# QtAV 编译指南

## 脚本说明

### 1. install_depends.bat
**用途**: 安装 64 位 FFmpeg 依赖库到 Qt 目录  
**使用时机**: 首次编译前运行一次  
**作用**: 将 QtAV-depends 中的 64 位库复制到 Qt 安装目录

### 2. build_release.bat
**用途**: 编译 Release 版本  
**作用**: 
- 运行 qmake 配置项目
- 编译 Release 版本
- 自动调用 deploy_release.bat 部署依赖

### 3. build_debug.bat
**用途**: 编译 Debug 版本  
**作用**:
- 运行 qmake 配置项目
- 编译 Debug 版本
- 自动调用 deploy_debug.bat 部署依赖

### 4. deploy_release.bat
**用途**: 部署 Release 版本的运行依赖  
**使用时机**: 编译完成后自动调用，或手动运行  
**作用**:
- 使用 windeployqt 复制 Qt 库
- 复制 QtAV 库
- 复制 FFmpeg 库

### 5. deploy_debug.bat
**用途**: 部署 Debug 版本的运行依赖  
**使用时机**: 编译完成后自动调用，或手动运行  
**作用**:
- 使用 windeployqt 复制 Qt Debug 库
- 确保平台插件存在
- 复制 QtAV 库
- 复制 FFmpeg 库

## 编译步骤

### 首次编译
1. 运行 `install_depends.bat` - 安装依赖库（只需运行一次）
2. 运行 `build_release.bat` 或 `build_debug.bat` - 编译项目

### 后续编译
直接运行 `build_release.bat` 或 `build_debug.bat`

## 输出目录
- Release 版本: `build\Qt5-Release\bin\Player.exe`
- Debug 版本: `build\Qt5-Debug\bin\Player.exe`

## 常见问题

### 问题 1: 0xc000007b 错误
**原因**: FFmpeg 库是 32 位，程序是 64 位  
**解决**: 运行 `install_depends.bat` 安装 64 位库

### 问题 2: 找不到 Qt5Widgetsd.dll
**原因**: Debug 版本缺少 Qt Debug 库  
**解决**: 运行 `deploy_debug.bat`

### 问题 3: Qt platform plugin 错误
**原因**: 缺少 platforms 插件目录  
**解决**: 运行 `deploy_debug.bat` 或 `deploy_release.bat`

## 依赖库路径配置

如果你的路径不同，需要修改以下脚本中的路径：

- `QTDIR`: Qt 安装目录（默认: D:\Qt\5.15.2\msvc2019_64）
- `DEPENDS_DIR`: QtAV 依赖库目录（默认: H:\迅雷下载\QtAV-depends-windows-x86+x64\QtAV-depends-windows-x86+x64）
- Visual Studio 路径（默认: C:\Program Files (x86)\Microsoft Visual Studio\2019\Community）
