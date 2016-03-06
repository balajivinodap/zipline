powershell -Command "(New-Object Net.WebClient).DownloadFile('http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-msvc.zip', 'ta-lib-0.4.0-msvc.zip')"
IF %ERRORLEVEL% == 1; exit 1
powershell -Command "Add-Type -AssemblyName System.IO.Compression.FileSystem;[System.IO.Compression.ZipFile]::ExtractToDirectory('ta-lib-0.4.0-msvc.zip', 'C:\')"
IF %ERRORLEVEL% == 1; exit 1
pushd C:\ta-lib\c\
cd make\cdd\win32\msvc
nmake
cd ..\cdr\win32\msvc
nmake
cd ..\cmd\win32\msvc
nmake
cd ..\cmr\win32\msvc
nmake
cd ..\csd\win32\msvc
nmake
cd ..\csr\win32\msvc
nmake
popd
del ta-lib-0.4.0-msvc.zip

python setup.py build --compiler msvc
python setup.py install --prefix=%PREFIX%
