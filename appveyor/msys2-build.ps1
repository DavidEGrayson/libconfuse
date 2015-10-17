$prepare = @"
./autogen.sh
"@

$build = @"
mkdir build-`$MINGW_CHOST
cd build-`$MINGW_CHOST
../configure --prefix=`$MINGW_PREFIX \
  --build=`$MINGW_CHOST --host=`$MINGW_CHOST \
  --enable-static --enable-shared --disable-examples
make check
"@

$env:CHERE_INVOKING = "1"
$env:MSYSTEM = "MSYS2"
D:/msys64/usr/bin/bash -l -c $prepare

$env:MSYSTEM = "MINGW64"
$env:MINGW_PREFIX = "/mingw64"
$env:MINGW_CHOST = "x86_64-w64-mingw32"
D:/msys64/usr/bin/bash -l -c $build

$env:MSYSTEM = "MINGW32"
$env:MINGW_PREFIX = "/mingw32"
$env:MINGW_CHOST = "i686-w64-mingw32"
D:/msys64/usr/bin/bash -l -c $build
