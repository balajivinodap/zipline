powershell -Command "(New-Object Net.WebClient).DownloadFile('http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-msvc.zip', '%PREFIX%/ta-lib-0.4.0-msvc.zip')"
IF %ERRORLEVEL% == 1; exit 1
powershell -Command "Add-Type -AssemblyName System.IO.Compression.FileSystem;[System.IO.Compression.ZipFile]::ExtractToDirectory('%PREFIX%/ta-lib-0.4.0-msvc.zip', 'C:\')"
IF %ERRORLEVEL% == 1; exit 1

python setup.py build --compiler msvc
python setup.py install --prefix=%PREFIX%
