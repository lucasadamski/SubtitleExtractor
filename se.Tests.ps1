
Describe 'Parse-Lines' {

    BeforeAll {
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
    }

    It 'Given lines with letters, removes end of the line' {
        $lines = @("Line number one", "  Line number two  ", "Line number three");
        $allLines = Parse-Lines($lines)
        $allLines | Should -Be 'Line number one Line number two Line number three'
    }

    It 'Given lines without letters, removes lines' {
        $lines =  $lines = @("234234 ", "      ", "234:00---123");
        $allLines = Parse-Lines($lines)
        $allLines | Should -Be ''
    }

    It 'Given real srt file, should preserve text lines only and join in one line' {
        $lines = "138
        00:08:30,928 --> 00:08:35,098
        because she would show me all
        the cool things of New York.
        
        139
        00:08:35,849 --> 00:08:38,101
        {\an8}She took me to `"Psycho`"
        on the opening day.
        
        140
        00:08:38,101 --> 00:08:39,770
        {\an8}She knew what I liked." -split "\r\n";
        
        $allLines = Parse-Lines($lines)
        $allLines | Should -Be "because she would show me all the cool things of New York. {\an8}She took me to `"Psycho`" on the opening day. {\an8}She knew what I liked."
    }
}
