#shellcheck shell=sh
Describe 'check_file test'
    Include ./src/vcard2qrcode
    setup() { touch empty-file; }
    cleanup() { rm empty-file; }
    BeforeAll 'setup'
    AfterAll 'cleanup'
    It 'check_file() missing file test'
        When run check_file missing-file
            The status should be failure
            The stdout should equal ""
            The line 1 of stderr should equal "missing-file file is not exists."
            The line 2 of stderr should equal "Usage: vcard2qrcode [ -i | --input FILENAME ] [ -o | --output FILENAME ]"
    End
    It 'check_file() empty file test'
        When run check_file empty-file
            The status should be failure
            The stdout should equal ""
            The line 1 of stderr should equal "empty-file file is empty."
            The line 2 of stderr should equal "Usage: vcard2qrcode [ -i | --input FILENAME ] [ -o | --output FILENAME ]"
    End
    It 'check_file() zero argument test'
        When run check_file
            The status should be failure
            The stdout should equal ""
            The line 1 of stderr should equal "Missing file argument on check_file() funciton."
            The line 2 of stderr should equal "Usage: vcard2qrcode [ -i | --input FILENAME ] [ -o | --output FILENAME ]"
    End
End
