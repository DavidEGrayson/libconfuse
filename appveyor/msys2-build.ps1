$env:MSYSTEM = "MINGW64"
$env:HOME = "C:/projects/libconfuse"
C:/msys64/usr/bin/bash -l -c @"
./autogen.sh
./configure --prefix=/mingw64 \
  --build=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 \
  --enable-static --enable-shared --disable-examples
make check
"@

