#shellcheck shell=sh
Describe 'check_number_of_program_arguments()'
    Include ./src/vcard2qrcode
    It 'check_number_of_program_arguments test'
        When run check_number_of_program_arguments ""
            The status should be failure
            The stdout should equal ""
            The stderr should eq "Usage: vcard2qrcode [ -i | --input FILENAME ] [ -o | --output FILENAME ]"
    End
End
