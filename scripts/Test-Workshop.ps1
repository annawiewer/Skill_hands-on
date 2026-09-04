[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$requiredFiles = @(
    'README.md',
    'scripts/Test-Workshop.sh',
    'labs/00-setup.md',
    'labs/01-discover-before-create.md',
    'labs/02-perform-workflow.md',
    'labs/03-create-skill.md',
    'labs/04-test-and-improve.md',
    'labs/05-peer-challenge.md',
    'resources/awesome-copilot-discovery-snapshot.md',
    'resources/awesome-copilot-repository-tour.md',
    'resources/core-concepts.md',
    'resources/handoff-acceptance-criteria.md',
    'resources/skill-quality-checklist.md',
    'resources/why-awesome-copilot-matters.md',
    'scenarios/incident-notes.md',
    'solutions/incident-handoff/SKILL.md'
)

$failures = [System.Collections.Generic.List[string]]::new()

foreach ($relativePath in $requiredFiles) {
    $fullPath = Join-Path $root $relativePath
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        $failures.Add("Missing required file: $relativePath")
    }
}

$readmePath = Join-Path $root 'README.md'
if (Test-Path -LiteralPath $readmePath -PathType Leaf) {
    $readme = Get-Content -Raw -LiteralPath $readmePath
    $conceptsPosition = $readme.IndexOf(
        '[core concepts](resources/core-concepts.md)',
        [StringComparison]::OrdinalIgnoreCase
    )
    $deepDivePosition = $readme.IndexOf(
        '[why Awesome Copilot matters](resources/why-awesome-copilot-matters.md)',
        [StringComparison]::OrdinalIgnoreCase
    )
    $tourPosition = $readme.IndexOf(
        '[Awesome Copilot repository tour](resources/awesome-copilot-repository-tour.md)',
        [StringComparison]::OrdinalIgnoreCase
    )
    $workshopPathPosition = $readme.IndexOf('## Workshop path', [StringComparison]::OrdinalIgnoreCase)

    if ($conceptsPosition -lt 0 -or $workshopPathPosition -lt 0 -or $conceptsPosition -gt $workshopPathPosition) {
        $failures.Add('README must introduce the core concepts before the workshop path.')
    }
    if ($deepDivePosition -lt 0 -or $workshopPathPosition -lt 0 -or $deepDivePosition -gt $workshopPathPosition) {
        $failures.Add('README must introduce the Awesome Copilot deep dive before the workshop path.')
    }
    if ($tourPosition -lt 0 -or $workshopPathPosition -lt 0 -or $tourPosition -gt $workshopPathPosition) {
        $failures.Add('README must introduce the Awesome Copilot repository tour before the workshop path.')
    }
    if ($readme -notmatch '\| \*\*Duration\*\* \| 30-120 minutes') {
        $failures.Add('README must advertise a variable duration from 30 to 120 minutes.')
    }
}

$cloneCommand = 'git clone https://github.com/annawiewer/Skill_hands-on.git'
$cloneGuides = @('README.md', 'labs/00-setup.md')

foreach ($relativePath in $cloneGuides) {
    $content = Get-Content -Raw -LiteralPath (Join-Path $root $relativePath)
    if (-not $content.Contains($cloneCommand)) {
        $failures.Add("Missing workshop clone command: $relativePath")
    }
    if ($content -notmatch '(?i)do not clone (the )?Awesome Copilot') {
        $failures.Add("Must distinguish the workshop clone from Awesome Copilot: $relativePath")
    }
    if ($content -notmatch '(?m)^\s*code \.\r?$') {
        $failures.Add("Missing VS Code open command: $relativePath")
    }
}

$browserOnlyFiles = @(
    'README.md',
    'resources/core-concepts.md',
    'resources/why-awesome-copilot-matters.md',
    'resources/awesome-copilot-repository-tour.md',
    'labs/00-setup.md',
    'labs/01-discover-before-create.md'
)

foreach ($relativePath in $browserOnlyFiles) {
    $content = Get-Content -Raw -LiteralPath (Join-Path $root $relativePath)
    if ($content -match '(?i)\bMCP\b|search_instructions|load_instruction|tool picker') {
        $failures.Add("Participant discovery path must remain browser-only: $relativePath")
    }
}

$discoveryLab = Get-Content -Raw -LiteralPath (Join-Path $root 'labs/01-discover-before-create.md')
if ($discoveryLab -notmatch 'docs/README\.skills\.md' -or $discoveryLab -notmatch 'incident-postmortem/SKILL\.md') {
    $failures.Add('Lab 01 must link directly to the public skills index and incident-postmortem SKILL.md.')
}

$markdownFiles = Get-ChildItem -Path $root -Recurse -File -Filter '*.md' |
    Where-Object { $_.FullName -notmatch '[\\/]\.copilot[\\/]' }
$linkPattern = [regex]'\[[^\]]+\]\((?![a-z][a-z0-9+.-]*:|#)(?<target>[^)#]+)(?:#[^)]+)?\)'
$checkedLinks = 0

foreach ($file in $markdownFiles) {
    $content = Get-Content -Raw -LiteralPath $file.FullName
    foreach ($match in $linkPattern.Matches($content)) {
        $target = [Uri]::UnescapeDataString($match.Groups['target'].Value.Trim('<', '>'))
        $resolved = [IO.Path]::GetFullPath((Join-Path $file.DirectoryName $target))
        $checkedLinks++
        if (-not (Test-Path -LiteralPath $resolved)) {
            $relativeFile = [IO.Path]::GetRelativePath($root, $file.FullName)
            $failures.Add("Broken local link in ${relativeFile}: $target")
        }
    }
}

$solutionPath = Join-Path $root 'solutions/incident-handoff/SKILL.md'
if (Test-Path -LiteralPath $solutionPath -PathType Leaf) {
    $solution = Get-Content -Raw -LiteralPath $solutionPath
    $frontmatter = [regex]::Match(
        $solution,
        '\A---\r?\n(?<body>.*?)\r?\n---',
        [Text.RegularExpressions.RegexOptions]::Singleline
    )

    if (-not $frontmatter.Success) {
        $failures.Add('Solution SKILL.md has invalid or missing YAML frontmatter.')
    }
    else {
        $body = $frontmatter.Groups['body'].Value
        $frontmatterLines = $body -split '\r?\n'
        $nameLine = $frontmatterLines | Where-Object { $_.StartsWith('name:') } | Select-Object -First 1
        $descriptionLine = $frontmatterLines | Where-Object { $_.StartsWith('description:') } | Select-Object -First 1

        if ($null -eq $nameLine -or $nameLine.Substring(5).Trim().Trim([char[]](0x27, 0x22)) -ne 'incident-handoff') {
            $failures.Add('Solution skill name must be incident-handoff.')
        }
        if ($null -eq $descriptionLine -or $descriptionLine -notmatch '(?i)use when') {
            $failures.Add('Solution skill description must explain when to use the skill.')
        }
    }
}

if ($failures.Count -gt 0) {
    $message = "Workshop validation failed:`n- " + ($failures -join "`n- ")
    Write-Error $message
    exit 1
}

Write-Host "Workshop validation passed: $($requiredFiles.Count) required files and $checkedLinks local links checked."
