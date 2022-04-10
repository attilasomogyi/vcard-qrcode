#shellcheck shell=sh
Describe 'vcard2qrcode'
  Include ./src/vcard2qrcode
  Describe 'usage()'
  It 'usage test'
  When call usage ''
      The stderr should eq 'Usage: vcard2qrcode [ -i | --input FILENAME ] [ -o | --output FILENAME ]'
    End
  End
End
