[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$logo = @"
                                                                                          
   mmmm              mm                     ##               mmmm                         
 m#""""#             ##          ##         ""       ##      ""##                         
 ##m       ##    ##  ##m###m   #######    ####     #######     ##       m####m            
  "####m   ##    ##  ##"  "##    ##         ##       ##        ##      ##mmmm##           
      "##  ##    ##  ##    ##    ##         ##       ##        ##      ##""""""           
 #mmmmm#"  ##mmm###  ###mm##"    ##mmm   mmm##mmm    ##mmm     ##mmm   "##mmmm#           
  """""     """" ""  "" """       """"   """"""""     """"      """"     """""            
                                                                                          
                                                                                          
                                                                                          
 mmmmmmmm                                                                                 
 ##""""""              ##                                      ##                         
 ##        "##  ##"  #######    ##m####   m#####m   m#####m  #######    m####m    ##m#### 
 #######     ####      ##       ##"       " mmm##  ##"    "    ##      ##"  "##   ##"     
 ##          m##m      ##       ##       m##"""##  ##          ##      ##    ##   ##      
 ##mmmmmm   m#""#m     ##mmm    ##       ##mmm###  "##mmmm#    ##mmm   "##mm##"   ##      
 """"""""  """  """     """"    ""        """" ""    """""      """"     """"     ""      
                                                                                          
                                                                                                                                                                 
"@;

Write-Host $logo -ForegroundColor Green;

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

