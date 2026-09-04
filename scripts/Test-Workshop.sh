#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root="$(cd "$script_dir/.." && pwd)"

required_files=(
    "README.md"
    "scripts/Test-Workshop.ps1"
    "labs/00-setup.md"
    "labs/01-discover-before-create.md"
    "labs/02-perform-workflow.md"
    "labs/03-create-skill.md"
    "labs/04-test-and-improve.md"
    "labs/05-peer-challenge.md"
    "resources/awesome-copilot-discovery-snapshot.md"
    "resources/awesome-copilot-repository-tour.md"
    "resources/core-concepts.md"
    "resources/handoff-acceptance-criteria.md"
    "resources/skill-quality-checklist.md"
    "resources/why-awesome-copilot-matters.md"
    "scenarios/incident-notes.md"
    "solutions/incident-handoff/SKILL.md"
)

failures=()

add_failure() {
    failures[${#failures[@]}]="$1"
}

for relative_path in "${required_files[@]}"; do
    if [[ ! -f "$root/$relative_path" ]]; then
        add_failure "Missing required file: $relative_path"
    fi
done

readme_path="$root/README.md"
if [[ -f "$readme_path" ]]; then
    workshop_path_line="$(grep -inm1 '^## Workshop path' "$readme_path" | cut -d: -f1 || true)"
    concepts_line="$(grep -inm1 '\[core concepts\](resources/core-concepts\.md)' "$readme_path" | cut -d: -f1 || true)"
    deep_dive_line="$(grep -inm1 '\[why Awesome Copilot matters\](resources/why-awesome-copilot-matters\.md)' "$readme_path" | cut -d: -f1 || true)"
    tour_line="$(grep -inm1 '\[Awesome Copilot repository tour\](resources/awesome-copilot-repository-tour\.md)' "$readme_path" | cut -d: -f1 || true)"

    if [[ -z "$concepts_line" || -z "$workshop_path_line" || "$concepts_line" -gt "$workshop_path_line" ]]; then
        add_failure "README must introduce the core concepts before the workshop path."
    fi
    if [[ -z "$deep_dive_line" || -z "$workshop_path_line" || "$deep_dive_line" -gt "$workshop_path_line" ]]; then
        add_failure "README must introduce the Awesome Copilot deep dive before the workshop path."
    fi
    if [[ -z "$tour_line" || -z "$workshop_path_line" || "$tour_line" -gt "$workshop_path_line" ]]; then
        add_failure "README must introduce the Awesome Copilot repository tour before the workshop path."
    fi
    if ! grep -Eq '\| \*\*Duration\*\* \| 30-120 minutes' "$readme_path"; then
        add_failure "README must advertise a variable duration from 30 to 120 minutes."
    fi
fi

clone_command="git clone https://github.com/annawiewer/Skill_hands-on.git"
clone_guides=("README.md" "labs/00-setup.md")

for relative_path in "${clone_guides[@]}"; do
    full_path="$root/$relative_path"
    if ! grep -Fq "$clone_command" "$full_path"; then
        add_failure "Missing workshop clone command: $relative_path"
    fi
    if ! grep -Eiq 'do not clone (the )?Awesome Copilot' "$full_path"; then
        add_failure "Must distinguish the workshop clone from Awesome Copilot: $relative_path"
    fi
    if ! grep -Eq '^[[:space:]]*code \.[[:space:]]*$' "$full_path"; then
        add_failure "Missing VS Code open command: $relative_path"
    fi
done

browser_only_files=(
    "README.md"
    "resources/core-concepts.md"
    "resources/why-awesome-copilot-matters.md"
    "resources/awesome-copilot-repository-tour.md"
    "labs/00-setup.md"
    "labs/01-discover-before-create.md"
)

for relative_path in "${browser_only_files[@]}"; do
    if grep -Eiq '\bMCP\b|search_instructions|load_instruction|tool picker' "$root/$relative_path"; then
        add_failure "Participant discovery path must remain browser-only: $relative_path"
    fi
done

discovery_lab="$root/labs/01-discover-before-create.md"
if ! grep -q 'docs/README\.skills\.md' "$discovery_lab" || ! grep -q 'incident-postmortem/SKILL\.md' "$discovery_lab"; then
    add_failure "Lab 01 must link directly to the public skills index and incident-postmortem SKILL.md."
fi

checked_links=0
while IFS= read -r -d '' markdown_file; do
    while IFS= read -r markdown_link; do
        target="${markdown_link#*](}"
        target="${target%)}"
        target="${target#<}"
        target="${target%>}"
        target="${target%%#*}"

        if [[ -z "$target" || "$target" == \#* || "$target" =~ ^[A-Za-z][A-Za-z0-9+.-]*: ]]; then
            continue
        fi

        checked_links=$((checked_links + 1))
        if [[ ! -e "$(dirname "$markdown_file")/$target" ]]; then
            relative_file="${markdown_file#"$root/"}"
            add_failure "Broken local link in $relative_file: $target"
        fi
    done < <(grep -Eo '\[[^]]+\]\([^)]+\)' "$markdown_file" || true)
done < <(find "$root" -type f -name '*.md' ! -path '*/.copilot/*' -print0)

solution_path="$root/solutions/incident-handoff/SKILL.md"
if [[ -f "$solution_path" ]]; then
    frontmatter="$(awk '{ sub(/\r$/, "") } NR == 1 && $0 == "---" { active=1; next } active && $0 == "---" { exit } active { print }' "$solution_path")"

    if [[ -z "$frontmatter" ]]; then
        add_failure "Solution SKILL.md has invalid or missing YAML frontmatter."
    else
        name_value="$(printf '%s\n' "$frontmatter" | sed -n 's/^name:[[:space:]]*//p' | head -n1 | tr -d "\"'")"
        description_value="$(printf '%s\n' "$frontmatter" | sed -n 's/^description:[[:space:]]*//p' | head -n1)"

        if [[ "$name_value" != "incident-handoff" ]]; then
            add_failure "Solution skill name must be incident-handoff."
        fi
        if [[ ! "$description_value" =~ [Uu]se[[:space:]]when ]]; then
            add_failure "Solution skill description must explain when to use the skill."
        fi
    fi
fi

if [[ ${#failures[@]} -gt 0 ]]; then
    printf 'Workshop validation failed:\n' >&2
    printf -- '- %s\n' "${failures[@]}" >&2
    exit 1
fi

printf 'Workshop validation passed: %d required files and %d local links checked.\n' \
    "${#required_files[@]}" "$checked_links"
