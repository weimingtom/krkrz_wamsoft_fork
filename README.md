# krkrz_wamsoft_fork
[Very WIP and NOT RECOMMENDED] My wamsoft/krkrz fork for Android and Linux, without vcpkg

## References:
* https://github.com/wamsoft/krkrz
* https://github.com/wamsoft/krkrz/tree/59ef96b5c295617f3f6dac7d8e10a2066a75bfbe  
* https://github.com/weimingtom/krkrsdl2-miyoo-a30  

## How to build apk with Android ADT under Windows
* cd android_adt/jni
* Double click console.bat (modify the path %PATH% points to your Android NDK path in console.bat by yourself)  
```
::execute ndk-build

::@set PATH=D:\android-ndk-r9c;%PATH%
::@set PATH=D:\android-ndk-r10e;%PATH%
@set PATH=D:\home\soft\android_studio_sdk\ndk\25.2.9519653;%PATH%
@set NDK_MODULE_PATH=%CD%\..\..
@cmd
```
* ndk-build clean
* ndk-build -j8 (or ndk-build NDK_DEBUG=1 -j8, see adb_logcat_and_debug_crash.txt)
* Get libkrkrz.so under android_adt/libs/arm64-v8a/libkrkrz.so
* Use Android ADT to load android_adt/.project
* Compile the apk file and install it to the Android device, **Now only support ARM64 Android device**   

## weibo record
```
kirikiroid2 windowex研究。我试试运行krkr2和krkrz的windowex的测试例子，前者可以不编译，
有预编译的exe，可以正确运行；但krkrz运行不起来，我尝试自己编译krkrz和windowex的源代码
（需要另外拉ncbind和tp_stub的源代码），发现抛C++异常，说Debug.console不存在，我的天，
我不想看到这种问题，算了，等下次再想，暂时没有头绪，可能下次考虑编译wamsoft/krkrz
的代码再试试（如果不行的话就没辙了）

打算尝试用类似krkrsdl2的编译方式去编译wamsoft/krkrz，不过——我不知道这项目能不能用，
也不知道linux编译会不会有问题，所以我有时间就试试，如果不行就立刻马上赶紧存档不管了，
我今年可能没什么时间玩这些 ​​​

我把wamsoft/krkrz_dev的Unix版（Linux版）编译出来了，如图，用它自己的方法编译
cmake ninja vcpkg，cmake需要较新版，我是用xubuntu 20.04编译，官方是用Windows编译。
看来需要自己改一些地方（包括代码和cmake）才能在Linux下勉强跑起来，但这些修改官方没说，
可能官方暂时还是以编译windows版为主（或者他们不想说）。
可能考虑找时间把这份代码改成makefile编译，因为它用了另外一种方式SDL3去显示，
而且代码结构有较大的改变，我可以参考一下

我用makefile方式编译运行wamsoft/krkrz，把resource改成读文件夹的文件
（原版是编译进去elf或exe，写作resource://，我改成file://./resource/），
但解决不了opengl问题，只能把sdl3窗口的opengl开关去掉（不知道是什么原因，
也有可能和虚拟机有关）。另外代码中凡是涉及resource://的文件都要注释掉，
否则crash。目前只能改成这样，只能简单运行

纠结，我发现大部分的linux都跑不了wamsoft/krkrz（我自己修改成可以在linux下编译运行），
包括小主机，唯独vmware的ubuntu 25.04可以，而且必须在登录时切换到xorg模式才行，
我晕——但奇怪的是libglfw3的GLES2例子跑起来却没问题，所以这是什么原因，
难道SDL3的GLES2有bug？所以我不敢现在发布我自己的修改版，可能等我把安卓版
或者windows版跑通了再放到gh上

我尝试用vcpkg编译wamsoft/krkrz的安卓版，可以编译，但最终链接会失败
——反正我只是想拿到编译参数。其实即便能编译出安卓版的动态库也没用，
可能会缺少java代码，所以很大可能是原版都还没弄好的。这个vcpkg
和KrKr2-Next的vcpkg好像有点区别，这个的vcpkg不是直接指向ndk的工具链文件，
而是指向vcpkg的android工具链文件，再通过环境变量去查找NDK路径，
其实也就是绕了一下。导出SDL3仓库时候要等很长一段时间

wamsoft/krkrz研究。今天通过逆向vcpkg的编译参数输出把Android.mk
写出来了，可以用ndk-build编译出libSDL3.so和libkrkrz.so，
但目前还不能在安卓上运行，因为缺少Java代码，后面会补。
另外，还需要简化一下external目录，我基本把krkr2-next的ndk模块
搬过来用，所以有一些其实是不需要的；我还没测试ndk-build -j8，
如果不行的话还需要在Android.mk里面拆分静态库编译；目前看上去
编译出来的so文件比krkr2-next要小；不知道为什么vcpkg用的是
common/sound/AudioStream.cpp，我需要换成
common/sound/MiniAudioEngine.cpp才能链接成功，
可能这里是个坑

wamsoft/krkrz研究。测试过可以-j8编译，然后现在简化到只有15个外部库
（其中只有10个需要编译），这样编译出来的动态库可以大幅度缩小，
比krkr2-next的动态库小一半左右——当然这么小的代价是它几乎没有编译插件，
如果编译插件和加上一些功能的话动态库也会变得很大 ​​​

wamsoft/krkrz研究。我把SDL3的Java代码放进去android studio编译，
可以调用到main函数，但还是没把游戏跑起来，因为我还没把游戏编译进去apk。
需要把SDL3的示例工程改一下，改成不调用ndk-build或cmake
（只是我的喜好，其实也可以在编译apk时编译C/C++代码），
直接把预先编译好的so动态库编译进去。也就是说，可以不用管SDL3示例
代码里面的jni的C代码，那些代码已经在wamsoft/krkrz的C/C++代码里面
写好了，只要把vcpkg编译出来的动态库编译进去即可（我这里是另外
自己改成用ndk-build编译而非vcpkg编译）

wamsoft/krkrz研究。目前可以加载resource://的文件
（放在assets目录下编译进apk就能读到）。发现这些问题：
（1）andres.cpp是自执行的（见Load），就算没有编译它也
不会导致编译错误，所以要小心（2）andres.cpp里面有个JNI函数，
说明这个项目缺少了一些Java代码（也许可以自己补上去），
而这些代码可能是故意没有放入仓库中（3）默认TVPThrowExceptionMessage
会弹出对话框，我把它改成throw;让它crash，这样就能看到C++调用栈
（4）TVPLOG_LEVEL宏可以打开日志输出，默认是不打开
（5）代码中关于resource://就是对应assets目录

wamsoft/krkrz研究。现在可以运行简单的startup.tjs了。
方法是放在assets/data目录下编译运行——当然前提是要把前面加载的
一些resource://文件跑通。不过我不表乐观，因为很可能官方也没跑通
所以没有把Java代码放进去，我如果也跑不通的话可能就放弃思考这份代码了，
尽快放到gh上以后慢慢改，目前还不确定

wamsoft/krkrz研究。我把它的krkrsdl2的示例跑通了（吉里吉里与KAG的介绍），
我去，这开源项目wamsoft/krkrz顾名思义，是用SDL3实现的，
所以理论上它也是兼容krkrsdl2的示例，不过要稍微改一下，
例如它没有实现System.createAppLock，要自己补上去——它其实有实现，
只是没有写stub插桩函数。看样子它理论上也可以改造成支持运行吉里吉里2的
游戏——当然，还要解决一下字符集问题和注入system_polyfill的代码。
等我再跑通一些别的示例我就会放到gh上继续改了

2026/4/11
wamsoft/krkrz研究。我已经把我的分支代码放到gh上，名字叫krkrz_wamsoft_fork。
理论上可以改成支持gbk，但目前似乎只支持unicode，我以后再想办法修改
（简单说就是我现在懒得改了）。我打算这几天顺便把我另外一个krkrz的研究
代码也放到gh上，看情况，如果能整理出来的话 ​​​
```

# Original README

# 吉里吉里Z multi platform

## 概要

マルチプラットフォーム展開を想定した吉里吉里Zです

・システム基本制御は SDL3 を使います
・OpenGLベース描画機構を持ちます Canvas/Screen/Texture/Shader
・極力外部ライブラリを参照する形で構築されています。

外部ライブラリの参照には vcpkg を利用しています。
SDL3 は最新版を利用する関係で FettchContents で処理されます。

## 開発環境準備

### Windows

Windows用に Visual Studio をインストールして
C++ コンパイラ を使える状態にしておきます。

あわせて Visual Studio 付属の Cmake / Ninja を利用します。

※Visual Studio 2022 以降は vcpkg があわせて導入されますが、
自前環境を使う場合は競合してまうので入れない様にして下さい。

また、アセンブリの処理用に nasm 2.10.09 が必要です。

make を使いたい場合は、msys2 をインストールして基礎開発ツールを導入しておきます。

```bash
pacman -S base-devel
```

### Linux

整備中

### OSX

整備中

### vcpkg 環境準備

各環境に vcpkg を導入します。

https://learn.microsoft.com/ja-jp/vcpkg/get_started/overview

vcpkg のフォルダを環境変数 VCPKG_ROOT に設定しておきます。

```bash
# dos
set VCPKG_ROOT="c:\work\vcpkg"

# msys/cygwin
export VCPKG_ROOT='c:\work\vcpkg'
```

## ビルド

### ソースのチェックアウト

git clone 後 submodule 更新しておいてください

```
git submodule update --init
```

### ビルド

CMakePresets.json 中のプリセット定義をつかってビルドします。
必要なライブラリは vcpkg.json によってセットアップされます。

ビルドフォルダはデフォルトでは build/プリセット名 になっています。
また Generator は Ninja Multi Config での生成になります。

vpkg.json で外部ライブラリを扱うため、
CMAKE_TOOLCHAIN_FILE は vcpkg のものが指定されています。

```bash
cmake --preset x86-windows --config Release
cmake --build build/x86-windows
```

ビルドに必要な定義が行われた Makefile が準備されていいます。
make が使える環境ではこちらが利用可能です


```bash
# 構築対象 preset設定（未定義時はOSで自動判定）
export PRESET=x86-windows

# ビルドタイプ指定（未定義時は Release）
export BUILD_TYPE=Release
#export BUILD_TYPE=Debug

# cmake オプション指定
# USE_SJIS  デフォルトをSJIS(MBSC) にする
export CMAKEOPT="-DUSE_SJIS=ON"

# cmake プロジェクト生成
# この段階で vcpkg が処理されてライブラリが準備されます
make prebuild

# cmake でビルド
make build 

# サンプル実行
make run

# インストール処理
INSTALL_PREFIX=install make install

```	

### ビルド設定

処理内容詳細は Makefile と CMakeList.txt を参照して下さい。

ビルド用の以下の特殊な CMake変数があります

BUILD_WINVER    旧来のWindows版準拠で構築します（Windowsのデフォルト）
BUILD_SDL       SDLバージョンで作成します（Windows以外のデフォルト）
BUILD_LIB       ライブラリ版KRKRZを作成します

BUILD_SDL / BUILD_LIB では、旧来の Windows版固有の機能が排除
された GENERICバージョンの吉里吉里になります。

GENERICバージョンあわせのプラグインをビルドする場合は、tp_stub.h を
読み込む前に __GENERIC__ を定義しておく必要があるので注意してください。

### そのほか特殊変数

MASTER  
    ビルド時に定義されているとログレベルが WARNING で固定になります（INFOログがコンソール表示されなくなります）

    未定義時は、起動時ログレベルが Release 版は INFO、Debug版は DEBUG になります。
    起動時オプション -loglevel=ERROR,WARNING,INFO,DEBUG,VERBOSE で変更可能になります

※吉里吉里旧来の TVPAddLog() は INFO相当、TVPAddImportantlLog() は WARNING 相当になります

### テスト実行

Makefile にそのままトップフォルダで実行可能なルールが定義されています。

```bash
# cmake 経由で実行
make run
```

OpenGL 機能動作時は以下のファイル構成が必要になります

    plugin/ プラグインフォルダ
      libEGL.dll        OpenGL の egl用DLL
      libGLESv2.dll     OpenGL の GLES2用DLL
    plugin64/ プラグインフォルダ 64bit
      libEGL.dll        OpenGL の egl用DLL
      libGLESv2.dll     OpenGL の GLES2用DLL

## デバッグ実行

### VisualStudio でのデバッグ

以下の手順でソースデバッグできます

- Visual Studio を起動して、プロジェクトなしの状態のウインドウに実行ファイルをドロップする
- デバッグのプロパティの作業フォルダにプロジェクトフォルダを指定（プラグインフォルダの参照先になるため）
- デバッグのプロパティの引数に data フォルダの場所をフルパスで指定（現行仕様がexe相対もしくは絶対パス）

### VSCode でのデバッグ

次のような launch.jsonを準備して下さい。
program 部分に生成される実行ファイルのパス名を直接記載します。
args で処理対象フォルダを指定できます（フルパスになるように記載して下さい）

launch.json

```json
{
    // IntelliSense を使用して利用可能な属性を学べます。
    // 既存の属性の説明をホバーして表示します。
    // 詳細情報は次を確認してください: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "WINデバッグ起動",
            "type": "cppvsdbg",
            "request": "launch",
            "program": "build/x86-windows/Debug/krkrz.exe",
            "args": ["${workspaceFolder}/data"],
            "stopAtEntry": false,
            "console":"externalTerminal",
            "cwd": "${workspaceFolder}",
            "environment": []
        }
    ]
}
```

# その他情報

tvpsnd_ia32
nasm 2.10.09 が必要です。

tvpgl_ia32
nasm 2.10.09 が必要です。

自動生成ファイル
吉里吉里Z本体にはいくつかの自動生成ファイルが存在します。
自動生成ファイルは直接編集せず、生成元のファイルを編集します。
生成には主にbatファイルとperlが使用されているので、perlのインストールが必要です。
各生成ファイルを左に ':' 以降に生成元ファイルを列挙します。

tjs2/syntax/compile.bat で以下のファイルが生成されます。

tjs.tab.cpp/tjs.tab.hpp : tjs.y
tjsdate.tab.cpp/tjsdate.tab.hpp : tjsdate.y
tjspp.tab.cpp/tjspp.tab.hpp : tjspp.y
tjsDateWordMap.cc : gen_wordtable.bat

これらのファイルの生成には bison が必要です。
bison には libiconv2.dll libintl3.dll regex2.dll が必要なので一緒にインストールする必要があります。
http://gnuwin32.sourceforge.net/packages/bison.htm
http://gnuwin32.sourceforge.net/packages/libintl.htm
http://gnuwin32.sourceforge.net/packages/libiconv.htm
http://gnuwin32.sourceforge.net/packages/regex.htm

visual/glgen/gengl.bat で以下のファイルが生成されます。
tvpgl.c/tvpgl.h : maketab.c/tvpps.c

visual/IA32/compile.bat で以下のファイルが生成されます。
tvpgl_ia32_intf.c/tvpgl_ia32_intf.h : *.nas

base/win32/makestub.bat で以下のファイルが生成されます。
FuncStubs.cpp/FuncStubs.h : makestub.pl内で指定されたヘッダーファイル内のTJS_EXP_FUNC_DEF/TVP_GL_FUNC_PTR_EXTERN_DECLマクロで記述された関数
tp_stub.cpp/tp_stub.h : 同上

