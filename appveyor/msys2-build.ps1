$env:MSYSTEM = "MINGW64"
C:/msys64/usr/bin/bash -l -c "./autogen.sh"
C:/msys64/usr/bin/bash -l -c "./configure --prefix=/mingw64 --build=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --enable-static --enable-shared --disable-examples"
C:/msys64/usr/bin/bash -l -c "make check"
