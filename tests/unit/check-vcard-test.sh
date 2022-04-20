#shellcheck shell=sh
Describe 'check_vcard test'
    Include ./tests/unit/include/usage-message.sh
    Include ./src/vcard2qrcode
    setup() { touch empty-file; touch not-readable-file; chmod ugo-rwx not-readable-file; }
    cleanup() { rm empty-file; rm not-readable-file; }
    BeforeAll 'setup'
    AfterAll 'cleanup'
    It 'check_vcard() missing file test'
        When run check_vcard missing-file
            The status should be failure
            The stdout should equal ""
            The line 1 of stderr should equal "missing-file file is not exists."
            The line 2 of stderr should equal "$USAGE_MESSAGE"
    End
    It 'check_vcard() empty file test'
        When run check_vcard empty-file
            The status should be failure
            The stdout should equal ""
            The line 1 of stderr should equal "empty-file file is empty."
            The line 2 of stderr should equal "$USAGE_MESSAGE"
    End
    It 'check_vcard() zero argument test'
        When run check_vcard
            The status should be failure
            The stdout should equal ""
            The line 1 of stderr should equal "Missing file argument on check_vcard() function."
            The line 2 of stderr should equal "$USAGE_MESSAGE"
    End
    It 'check_vcard() not readable file test'
        When run check_vcard not-readable-file
            The status should be failure
            The stdout should equal ""
            The line 1 of stderr should equal "not-readable-file file is not readable."
            The line 2 of stderr should equal "$USAGE_MESSAGE"
    End
End
