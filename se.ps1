
function Parse-Lines($text) {
    $result = "";
    foreach($line in $text) {
        $parsedLine = Parse-Line($line);
        $result += $parsedLine;
    }
    return $result.Trim();
}

function Parse-Line([string]$line) {
    $result = "";
    if($line -match "(?i)[a-z]")
    {
        $result = $line.Trim() + ' ';
    }
    return $result;
}


$currentPath = Get-Location;
$inputPath = $currentPath.Path + "\input.txt";
$outputPath = $currentPath.Path + "\output.txt";

$result = Parse-Lines([System.IO.File]::ReadLines($inputPath));
    $result | Out-File -FilePath $outputPath -Append

Write-Host "Subitles successfully extracted to $outputPath" -ForegroundColor Green;

