Add-Type -Assembly System.IO.Compression.FileSystem
$webclient = New-Object System.Net.WebClient

function Acquire($file, $url, $checksum)
{
  if (!(Test-Path $file))
  {
    "Downloading $url ..."
    $webclient.DownloadFile($url, $file)
  }
  else
  {
    "Using existing $file."
  }
  $actual_checksum = (Get-FileHash $file)[0].Hash.ToLower()
  if (!($checksum -eq $actual_checksum))
  {
    throw "Error: Checksum for $file is $actual_checksum expected $checksum"
  }
}

$ver = "20150916"
$msys2_archive = "msys2-base-x86_64-$ver.tar.xz"
Acquire -File $msys2_archive `
  -Url "http://repo.msys2.org/distrib/x86_64/$msys2_archive" `
  -Checksum "1eac63be7bfff979846dfda0aef6e2b572bc526450586de6364b08aaf642b843"

Acquire -File "tar_utils.zip" `
  -Url "http://alderaan.tmphax.com/tar_utils.zip" `
  -Checksum "ffe82e94813e12c3a911696adbdd34d6307c01d1b9c756e6ce1c0aebb7477199"

"Extracting tar_utils.zip"
[System.IO.Compression.ZipFile]::ExtractToDirectory("tar_utils.zip", ".")

"Extracting MSYS2"
bsdtar -xf $msys2_archive

"Initializing MSYS2"
cd msys64
$env:MSYSTEM = MSYS
usr\bin\bash -l -c "true"
usr\bin\bash -l -c "pacman -S mingw-w64-x86_64-gcc autoconf flex make libtool"


