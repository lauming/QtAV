@echo off
chcp 65001 >nul
echo ========================================
echo Deploy Player.exe Release Dependencies
echo ========================================

set "QTDIR=D:\Qt\5.15.2\msvc2019_64"
set "BIN_DIR=%~dp0build\Qt5-Release\bin"
set "DEPENDS_DIR=H:\迅雷下载\QtAV-depends-windows-x86+x64\QtAV-depends-windows-x86+x64"

if not exist "%BIN_DIR%\Player.exe" (
    echo ERROR: Player.exe not found
    pause
    exit /b 1
)

cd /d "%BIN_DIR%"

echo.
echo Step 1: Running windeployqt for Qt dependencies...
"%QTDIR%\bin\windeployqt.exe" --release --no-translations Player.exe

echo.
echo Step 2: Copying QtAV libraries...
if exist "%~dp0build\Qt5-Release\lib_win_x86_64\QtAV1.dll" (
    copy /y "%~dp0build\Qt5-Release\lib_win_x86_64\QtAV1.dll" . >nul
    echo   QtAV1.dll
)
if exist "%~dp0build\Qt5-Release\lib_win_x86_64\QtAVWidgets1.dll" (
    copy /y "%~dp0build\Qt5-Release\lib_win_x86_64\QtAVWidgets1.dll" . >nul
    echo   QtAVWidgets1.dll
)

echo.
echo Step 3: Copying FFmpeg and other dependencies...
if exist "%DEPENDS_DIR%\bin\x64" (
    xcopy /y /q "%DEPENDS_DIR%\bin\x64\av*.dll" .
    xcopy /y /q "%DEPENDS_DIR%\bin\x64\sw*.dll" .
    xcopy /y /q "%DEPENDS_DIR%\bin\x64\ass.dll" . 2>nul
    xcopy /y /q "%DEPENDS_DIR%\bin\x64\libass.dll" . 2>nul
    xcopy /y /q "%DEPENDS_DIR%\bin\x64\OpenAL32-VS2015.dll" . 2>nul
    echo   FFmpeg libraries copied
)

echo.
echo ========================================
echo Deployment Complete!
echo ========================================
echo.
echo Output: %BIN_DIR%\Player.exe
echo.
pause
