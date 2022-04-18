#shellcheck shell=sh
Describe 'usage test'
    Include ./src/vcard2qrcode
    It 'usage() test'
    When call usage ''
        The stderr should eq 'Usage: vcard2qrcode [ -i | --input FILENAME ] [ -o | --output FILENAME ]'
    End
End
