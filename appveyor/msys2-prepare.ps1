cd C:/msys64
$env:MSYSTEM = "MSYS"
usr\bin\bash -l -c "true"
usr\bin\bash -l -c "pacman -Q"
# usr\bin\bash -l -c "pacman --noconfirm --needed -q -S mingw-w64-x86_64-gcc autoconf flex make libtool"

