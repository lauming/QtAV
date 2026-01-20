@echo off
chcp 65001 >nul
echo ========================================
echo Build QtAV Debug Version
echo ========================================

set "QTDIR=D:\Qt\5.15.2\msvc2019_64"
set "BUILD_DIR=%~dp0build\Qt5-Debug"

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"

echo.
echo Step 1: Running qmake...
cd /d "%BUILD_DIR%"
"%QTDIR%\bin\qmake.exe" "%~dp0QtAV.pro" -spec win32-msvc "CONFIG+=debug"

if errorlevel 1 (
    echo qmake failed!
    pause
    exit /b 1
)

echo.
echo Step 2: Building...
nmake

if errorlevel 1 (
    echo Build failed!
    pause
    exit /b 1
)

echo.
echo Step 3: Deploying dependencies...
call "%~dp0deploy_debug.bat"
