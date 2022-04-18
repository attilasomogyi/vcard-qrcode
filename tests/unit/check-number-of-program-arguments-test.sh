#shellcheck shell=sh
Describe 'check_number_of_program_arguments()'
    Include ./tests/unit/include/usage-message.sh
    Include ./src/vcard2qrcode
    It 'check_number_of_program_arguments test'
        When run check_number_of_program_arguments ""
            The status should be failure
            The stdout should equal ""
            The stderr should eq "$USAGE_MESSAGE"
    End
    unset_variable() { unset "number_of_program_arguments"; }
    Before 'unset_variable'
    It 'check_number_of_program_arguments unset test'
        When run check_number_of_program_arguments ""
            The status should be failure
            The stdout should equal ""
            The line 1 of stderr should equal "number_of_program_arguments is not set."
            The line 2 of stderr should equal "$USAGE_MESSAGE"
    End
    set_string_variable() { export number_of_program_arguments="stringtest"; }
    Before 'set_string_variable'
    It 'check_number_of_program_arguments unset test'
        When run check_number_of_program_arguments ""
            The status should be failure
            The stdout should equal ""
            The line 1 of stderr should equal "number_of_program_arguments is not number."
            The line 2 of stderr should equal "$USAGE_MESSAGE"
    End
End
