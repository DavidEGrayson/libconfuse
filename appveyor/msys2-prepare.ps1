cd C:/msys64
$env:MSYSTEM = MSYS
usr\bin\bash -l -c "true"
usb\bin\bash -l -c "update-core"
usb\bin\bash -l -c "pacman -Su"
usr\bin\bash -l -c "pacman -S mingw-w64-x86_64-gcc autoconf flex make libtool"
usr\bin\bash -l -c "env"
