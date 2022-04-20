#shellcheck shell=sh
Describe 'usage test'
    Include ./tests/unit/include/usage-message.sh
    Include ./src/vcard2qrcode
    It 'usage() test'
    When run usage ''
        The stdout should eq "$USAGE_MESSAGE"
    End
    unset_variable() { unset program_name; }
    Before 'unset_variable'
    It 'usage() program_name is not set test'
    When run usage usage ''
        The status should be failure
        The stdout should eq ""
        The stderr should eq "program_name is not set."
    End
End
