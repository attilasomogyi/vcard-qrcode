#shellcheck shell=sh
Describe 'usage test'
    Include ./tests/unit/include/usage-message.sh
    Include ./src/vcard2qrcode
    It 'usage() test'
    When call usage ''
        The stderr should eq "$USAGE_MESSAGE"
    End
End
