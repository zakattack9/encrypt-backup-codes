## The Problem
When enabling 2FA for online accounts oftentimes you'll receive recovery codes that can be used in the event that your 2FA authenticator can't be accessed. Additionally, when setting up 2FA you can also save the TOTP shared secret key (oftentimes the QR code that gets scanned) which can be used to set up TOTP for a specific account on an authenticator again in the future without needing to reset 2FA on the account. The safest method of storing both the recovery and setup codes is to first encrypt the 2FA codes, then store the encrypted files offline across multiple hard drives; to make this process easier, the `encrypt.sh` and `decrypt.sh` scripts in this repo will compress all relevant 2FA codes into a single encrypted zip file that can be stored across multiple hard drives and later decrypted/decompressed.

## Retrieving the Scripts
It is important to note that both the encrypt and decrypt scripts come with self cleanup and will auto-generate the respective encrypt/decrypt script depending on the current state of the 2FA codes. For example, if you're encrypting your 2FA codes, `encrypt.sh` will automatically generate `decrypt.sh` if it detects that it's not in the current directory where the encrypt script was run; likewise, if you're decrypting your 2FA codes, `decrypt.sh` will automatically generate `encrypt.sh` if it detects that it's not  in the current directory where the decrypt script was run.

```shell
curl https://raw.githubusercontent.com/zakattack9/encrypt-backup-codes/master/encrypt.sh -o encrypt.sh && chmod +x encrypt.sh

# it is optional to pull down the decrypt script since encrypt.sh will automatically do this
curl https://raw.githubusercontent.com/zakattack9/encrypt-backup-codes/master/decrypt.sh -o decrypt.sh && chmod +x decrypt.sh
```

## For MacOS
7-zip is used in these scripts to encrypt the files with AES256 which requires 7z to be installed for MacOS machines. With `brew`, the `p7zip` package can be installed using the following commands.
```shell
brew update
brew install p7zip
# installs 7z, 7za, and 7zr
```