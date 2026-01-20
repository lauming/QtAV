@echo off
chcp 65001 >nul
echo ========================================
echo Install QtAV Dependencies (x64)
echo ========================================

set "DEPENDS_DIR=H:\迅雷下载\QtAV-depends-windows-x86+x64\QtAV-depends-windows-x86+x64"
set "QTDIR=D:\Qt\5.15.2\msvc2019_64"

if not exist "%DEPENDS_DIR%\bin\x64" (
    echo ERROR: Dependencies directory not found
    echo %DEPENDS_DIR%\bin\x64
    pause
    exit /b 1
)

echo.
echo Copying x64 FFmpeg and dependencies to Qt directory...
xcopy /y /q "%DEPENDS_DIR%\bin\x64\*.dll" "%QTDIR%\bin\"

if exist "%DEPENDS_DIR%\lib\x64" (
    xcopy /y /q "%DEPENDS_DIR%\lib\x64\*.lib" "%QTDIR%\lib\"
)

if exist "%DEPENDS_DIR%\include" (
    xcopy /y /e /q "%DEPENDS_DIR%\include\*" "%QTDIR%\include\"
)

echo.
echo ========================================
echo Installation Complete!
echo ========================================
pause
