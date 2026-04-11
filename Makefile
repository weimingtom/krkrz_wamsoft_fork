USE_OPENGL:=1

## Ubuntu 25.04 on Xorg, VMware
## If no title bar under Ubuntu 25.04, switch to Ubuntu on Xorg mode when login (click and enter passwd, then choose at right bottom button of the login screen)
##
## (not good for GLES) Xubuntu 20.04, VirtualBox
## libEGL warning: DRI2: failed to authenticate
## Solve: VirtualBox-Settings-Graphics-VMSVGA: Enable 3D acceleration
## ERROR: [form.cpp:SDL3WindowForm:54] SDL3WindowForm: Failed to create SDL Window: Could not create GLES window surface
##
## (not good for GLES) xubuntu 25.04, VMware
## gedit sdl3/environ/main.cpp
## SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
## make test2
## ERROR: [SDLDrawDevice.cpp:InitRenderer:72] tTVPSDLDrawDevice::InitRenderer() failed:Could not create EGL context (call to eglCreateContext failed, reporting an error of EGL_BAD_MATCH)



#libxcb-xinput-dev
## sudo apt update

## sudo apt install gedit lftp make gcc g++

## sudo apt install libdbus-1-dev libudev-dev libx11-dev libgles-dev libwayland-dev libxkbcommon-dev libxext-dev libxcursor-dev libxi-dev libxrandr-dev libxss-dev libpulse-dev libasound2-dev

## sudo apt install libonig-dev libglm-dev libfmt-dev libopusfile-dev libvorbis-dev libfreetype-dev libturbojpeg-dev libjpeg-dev

## sudo apt install libgles2-mesa-dev libegl1-mesa-dev mesa-utils mesa-utils-extra
## glxgears
## es2gears_x11

#
#TODO:ERROR: [form.cpp:SDL3WindowForm:54] SDL3WindowForm: Failed to create SDL Window: Could not create GLES window surface
#strace ./krkrz, vmwgfx_dri.so not found
#gedit ./sdl3/environ/form.cpp
###if defined(TVP_USE_OPENGL)
##	flags |= SDL_WINDOW_OPENGL;
###endif
##mesa-vulkan-drivers mesa-va-drivers libgl1-mesa-dri
## sudo apt install libgl1-mesa-dri

#TODO:miniaudio
#TODO:picojson
#TODO:SDL3
#TODO:external/movie-player, generic/app/movie.cpp:25
#TODO:gedit sdl3/environ/stdapp.cpp, line 67

CC  := gcc
CPP := g++
AR  := ar cru
RANLIB := ranlib
RM := rm -rf

CPPFLAGS := 
#make verbose from xubuntu 20.04, wamsoft_krkrz_verbose.txt
#makefile from krkrsdl2_fork2

CPPFLAGS += -g3 -O0

CPPFLAGS += -fPIC 

ifeq ($(USE_OPENGL),1)
CPPFLAGS += -DTVP_USE_OPENGL
endif 
CPPFLAGS += -DEXTERNAL_MINIAUDIO=1 
CPPFLAGS += -DINNER_AUDIOENGINE=1 
CPPFLAGS += -DMA_NO_DEVICE_IO 
CPPFLAGS += -DONIG_STATIC 
CPPFLAGS += -DTJS_JP_LOCALIZED 
CPPFLAGS += -DTVP_DONT_AUTOLOAD_MASK 
CPPFLAGS += -DTVP_DONT_AUTOLOAD_PROVINCE 
CPPFLAGS += -DTVP_ENABLE_EXECUTE_AT_EXCEPTION 
CPPFLAGS += -DTVP_LOCALFILE_FORCE_CASESENSITIVE 
CPPFLAGS += -DTVP_LOG_TO_COMMANDLINE_CONSOLE 
CPPFLAGS += -DTVP_NO_NORMALIZE_PATH 
###CPPFLAGS += -DTVP_USE_OPENGL
CPPFLAGS += -DTVP_USE_TURBO_JPEG_API 
CPPFLAGS += -DUNICODE 
CPPFLAGS += -D_UNICODE 
CPPFLAGS += -D__CODEGUARD__ 
CPPFLAGS += -D__GENERIC__ 
CPPFLAGS += -DCMAKE_INTDIR=\"Debug\" 

CPPFLAGS += -Icommon/environ 
CPPFLAGS += -Icommon/tjs2 
CPPFLAGS += -Icommon/base 
CPPFLAGS += -Icommon/extension 
CPPFLAGS += -Icommon/sound 
CPPFLAGS += -Icommon/msg 
CPPFLAGS += -Icommon/utils 
CPPFLAGS += -Icommon/visual 
CPPFLAGS += -Icommon/visual/gl 
CPPFLAGS += -Icommon/visual/opengl 
CPPFLAGS += -Icommon/glad/include 
CPPFLAGS += -Iexternal 
CPPFLAGS += -Igeneric/base 
CPPFLAGS += -Igeneric/environ 
CPPFLAGS += -Igeneric/msg 
CPPFLAGS += -Igeneric/utils 
CPPFLAGS += -Igeneric/visual 
CPPFLAGS += -Isdl3/base 
CPPFLAGS += -Isdl3/environ 
CPPFLAGS += -Isdl3/utils 
CPPFLAGS += -Isdl3/visual 
CPPFLAGS += -Iexternal/movie-player/include 

#miniaudio
CPPFLAGS += -Iexternal/miniaudio-0.11.23
#picojson
CPPFLAGS += -Iexternal/picojson-1.3.0
#SDL3
CPPFLAGS += -Iexternal/SDL3-f600c74/include

#pkg-config --cflags opusfile
CPPFLAGS += -I/usr/include/opus
#pkg-config --cflags freetype2
CPPFLAGS += -I/usr/include/freetype2 -I/usr/include/libpng16

#CPPFLAGS += -Ibuild/x64-linux/_deps/sdl3-build/include-revision 
#CPPFLAGS += -Ibuild/x64-linux/_deps/sdl3-src/include 
#CPPFLAGS += -isystem vcpkg_installed/x64-linux/include 
#CPPFLAGS += -isystem vcpkg_installed/x64-linux/include/opus 

CPPFLAGS += -std=gnu++17 

LDFLAGS :=

#-fPIC 
#-g  
#-o Debug/krkrz  
#-Wl,-rpath,/home/wmt/krkrz/build/x64-linux/_deps/sdl3-build/Debug: 
#vcpkg_installed/x64-linux/debug/lib/libfreetyped.a  
#vcpkg_installed/x64-linux/debug/lib/libturbojpeg.a  
#vcpkg_installed/x64-linux/debug/lib/libogg.a  
#vcpkg_installed/x64-linux/debug/lib/libvorbis.a  
#vcpkg_installed/x64-linux/debug/lib/libvorbisenc.a  
#vcpkg_installed/x64-linux/debug/lib/libvorbisfile.a  
#vcpkg_installed/x64-linux/debug/lib/libz.a  
#vcpkg_installed/x64-linux/debug/lib/libonig.a  
#vcpkg_installed/x64-linux/debug/lib/libfmtd.a  
#vcpkg_installed/x64-linux/debug/lib/libpng16d.a  
#vcpkg_installed/x64-linux/debug/lib/libglm.a  
#vcpkg_installed/x64-linux/debug/lib/libopus.a 
#vcpkg_installed/x64-linux/debug/lib/libopusfile.a  
#external/movie-player/Debug/libmovieplayer.a  
#_deps/sdl3-build/Debug/libSDL3.so.0.5.0 
#Debug/libresources.a  
#-ldl  
#vcpkg_installed/x64-linux/debug/lib/libbz2d.a  
#vcpkg_installed/x64-linux/debug/lib/libbrotlidec.a  
#vcpkg_installed/x64-linux/debug/lib/libbrotlicommon.a  
#-lm  
#vcpkg_installed/x64-linux/debug/lib/libvpx.a  
#external/movie-player/extlibs/libyuv/Debug/libyuv.a  
#-pthread

LDFLAGS += -lfreetype 
LDFLAGS += -lturbojpeg 
LDFLAGS += -ljpeg 
LDFLAGS += -logg
LDFLAGS += -lvorbis 
LDFLAGS += -lvorbisenc
LDFLAGS += -lvorbisfile
LDFLAGS += -lz
LDFLAGS += -lonig
LDFLAGS += -lfmt
LDFLAGS += -lpng16
###LDFLAGS += -lglm
LDFLAGS += -lopus
LDFLAGS += -lopusfile
#LDFLAGS += -lmovieplayer  
LDFLAGS += -lSDL3 
#LDFLAGS += -lresources  
LDFLAGS += -ldl  
#LDFLAGS += -lbz2d.a  
#LDFLAGS += -lbrotlidec.a  
#LDFLAGS += -lbrotlicommon.a  
LDFLAGS += -lm  
#LDFLAGS += -lvpx  
#LDFLAGS += -lyuv  
LDFLAGS += -pthread


LDFLAGS += -L./external/SDL3-f600c74

OBJS += common/tjs2/tjs.o 
OBJS += common/tjs2/tjs.tab.o 
OBJS += common/tjs2/tjsArray.o 
OBJS += common/tjs2/tjsBinarySerializer.o 
OBJS += common/tjs2/tjsByteCodeLoader.o 
OBJS += common/tjs2/tjsCompileControl.o 
OBJS += common/tjs2/tjsConfig.o 
OBJS += common/tjs2/tjsConstArrayData.o 
OBJS += common/tjs2/tjsDate.o 
OBJS += common/tjs2/tjsdate.tab.o 
OBJS += common/tjs2/tjsDateParser.o 
OBJS += common/tjs2/tjsDebug.o 
OBJS += common/tjs2/tjsDictionary.o 
OBJS += common/tjs2/tjsDisassemble.o 
OBJS += common/tjs2/tjsError.o 
OBJS += common/tjs2/tjsException.o 
OBJS += common/tjs2/tjsGlobalStringMap.o 
OBJS += common/tjs2/tjsInterCodeExec.o 
OBJS += common/tjs2/tjsInterCodeGen.o 
OBJS += common/tjs2/tjsInterface.o 
OBJS += common/tjs2/tjsLex.o 
OBJS += common/tjs2/tjsMath.o 
OBJS += common/tjs2/tjsMessage.o 
OBJS += common/tjs2/tjsMT19937ar-cok.o 
OBJS += common/tjs2/tjsNamespace.o 
OBJS += common/tjs2/tjsNative.o 
OBJS += common/tjs2/tjsObject.o 
OBJS += common/tjs2/tjsObjectExtendable.o 
OBJS += common/tjs2/tjsOctPack.o 
OBJS += common/tjs2/tjspp.tab.o 
OBJS += common/tjs2/tjsRandomGenerator.o 
OBJS += common/tjs2/tjsRegExp.o 
OBJS += common/tjs2/tjsScriptBlock.o 
OBJS += common/tjs2/tjsScriptCache.o 
OBJS += common/tjs2/tjsSnprintf.o 
OBJS += common/tjs2/tjsString.o 
OBJS += common/tjs2/tjsUtils.o 
OBJS += common/tjs2/tjsVariant.o 
OBJS += common/tjs2/tjsVariantString.o

OBJS += common/base/BinaryStream.o 
OBJS += common/base/CharacterSet.o 
OBJS += common/base/EventIntf.o 
OBJS += common/base/PluginIntf.o 
OBJS += common/base/ScriptMgnIntf.o 
OBJS += common/base/StorageIntf.o 
OBJS += common/base/SysInitIntf.o 
OBJS += common/base/SystemIntf.o 
OBJS += common/base/TextStream.o 
OBJS += common/base/UtilStreams.o 
OBJS += common/base/XP3Archive.o 
OBJS += common/base/StorageCache.o 

OBJS += common/environ/TouchPoint.o 

OBJS += common/extension/Extension.o 

OBJS += common/msg/MsgIntf.o 

OBJS += common/sound/MathAlgorithms.o 
OBJS += common/sound/PhaseVocoderDSP.o 
OBJS += common/sound/PhaseVocoderFilter.o 
OBJS += common/sound/RealFFT.o 
OBJS += common/sound/SoundBufferBaseIntf.o 
OBJS += common/sound/SoundBufferBaseImpl.o 
OBJS += common/sound/WaveFormatConverter.o 
OBJS += common/sound/WaveIntf.o 
OBJS += common/sound/WaveLoopManager.o 
OBJS += common/sound/WaveSegmentQueue.o 
OBJS += common/sound/OpusCodecDecoder.o 
OBJS += common/sound/VorbisCodecDecoder.o 

OBJS += common/utils/ClipboardIntf.o 
OBJS += common/utils/cp932_uni.o 
OBJS += common/utils/DebugIntf.o 
OBJS += common/utils/md5.o 
OBJS += common/utils/MiscUtility.o 
OBJS += common/utils/Random.o 
OBJS += common/utils/ThreadIntf.o 
OBJS += common/utils/TimerThread.o 
OBJS += common/utils/TimerIntf.o 
OBJS += common/utils/TVPTimer.o 
OBJS += common/utils/uni_cp932.o 
OBJS += common/utils/VelocityTracker.o 

OBJS += common/visual/BitmapIntf.o 
OBJS += common/visual/BitmapLayerTreeOwner.o 
OBJS += common/visual/BitmapInfomation.o 
OBJS += common/visual/CharacterData.o 
OBJS += common/visual/ComplexRect.o 
OBJS += common/visual/DrawDevice.o 
OBJS += common/visual/FontSystem.o 
OBJS += common/visual/FreeType.o 
OBJS += common/visual/FreeTypeFontRasterizer.o 
OBJS += common/visual/GraphicsLoaderIntf.o 
OBJS += common/visual/GraphicsLoadThread.o 
OBJS += common/visual/ImageFunction.o 
OBJS += common/visual/LayerBitmapImpl.o 
OBJS += common/visual/LayerBitmapIntf.o 
OBJS += common/visual/LayerIntf.o 
OBJS += common/visual/LayerManager.o 
OBJS += common/visual/LayerTreeOwnerImpl.o
OBJS += common/visual/LoadJPEG.o 
OBJS += common/visual/LoadPNG.o 
OBJS += common/visual/LoadTLG.o 
OBJS += common/visual/NullDrawDevice.o 
OBJS += common/visual/BitmapDrawDevice.o 
OBJS += common/visual/PrerenderedFont.o 
OBJS += common/visual/RectItf.o 
OBJS += common/visual/SaveTLG5.o 
OBJS += common/visual/SaveTLG6.o 
OBJS += common/visual/TransIntf.o 
OBJS += common/visual/tvpgl.o 
OBJS += common/visual/VideoOvlIntf.o 
OBJS += common/visual/WindowIntf.o 
OBJS += common/visual/KeyRepeat.o 

OBJS += common/visual/gl/blend_function.o 
OBJS += common/visual/gl/ResampleImage.o 
OBJS += common/visual/gl/WeightFunctor.o 

OBJS += common/base/FuncStubs.o 

OBJS += common/visual/opengl/OGLDrawDevice.o 
OBJS += common/visual/opengl/CanvasIntf.o 
OBJS += common/visual/opengl/GLTexture.o 
OBJS += common/visual/opengl/GLFrameBufferObject.o 
OBJS += common/visual/opengl/GLShaderUtil.o 
OBJS += common/visual/opengl/Matrix32Intf.o 
OBJS += common/visual/opengl/Matrix44Intf.o 
OBJS += common/visual/opengl/OffscreenIntf.o 
OBJS += common/visual/opengl/OpenGLError.o 
OBJS += common/visual/opengl/ShaderProgramIntf.o 
OBJS += common/visual/opengl/TextureIntf.o 
OBJS += common/visual/opengl/TextureLayerTreeOwner.o 
OBJS += common/visual/opengl/VertexBinderIntf.o 
OBJS += common/visual/opengl/VertexBufferIntf.o 

OBJS += common/glad/src/gles2.o 
OBJS += common/glad/src/egl.o 

OBJS += common/sound/SoundDecodeThread.o 
OBJS += common/sound/SoundEventThread.o 
#miniaudio
OBJS += common/sound/QueueSoundBufferImpl.o 

OBJS += generic/base/DrawDeviceImpl.o 
OBJS += generic/base/EventImpl.o 
OBJS += generic/base/NativeEventQueue.o 
OBJS += generic/base/PluginImpl.o 
OBJS += generic/base/ScriptMgnImpl.o 
OBJS += generic/base/StorageImpl.o 
OBJS += generic/base/SysInitImpl.o 
OBJS += generic/base/SystemImpl.o 

#picojson
OBJS += generic/environ/Application.o 
OBJS += generic/environ/FontSystemBase.o 
OBJS += generic/environ/WindowForm.o 
OBJS += generic/environ/JoyPad.o 

OBJS += generic/msg/MsgImpl.o 
#picojson
OBJS += generic/msg/MsgLoad.o 

OBJS += generic/utils/ClipboardImpl.o 
OBJS += generic/visual/BitmapBitsAlloc.o 
OBJS += generic/visual/LayerImpl.o 
OBJS += generic/visual/VideoOvlImpl.o 
OBJS += generic/visual/WindowImpl.o 

OBJS += sdl3/base/FileImpl.o 
OBJS += sdl3/base/SDL3KirikiriIOStream.o 
OBJS += sdl3/base/SDL3KirikiriStorage.o 
OBJS += sdl3/base/storage.o 

OBJS += sdl3/environ/app.o 
OBJS += sdl3/environ/form.o 
OBJS += sdl3/environ/key.o 
#main()
###OBJS += sdl3/environ/main.o 
OBJS += sdl3/environ/pad.o 

OBJS += sdl3/utils/LogImpl.o 
OBJS += sdl3/utils/TickCount.o 

OBJS += sdl3/visual/SDLDrawDevice.o 

OBJS += common/sound/MiniAudioEngine.o 

OBJS += sdl3/sound/audio.o 
OBJS += sdl3/environ/stdapp.o 

OBJS += common/base/FileAllocator.o 

OBJS += generic/app/movie.o 
OBJS += generic/app/objres.o 

OBJS += sdl3/utils/ThreadImpl.o 

KRKRZ_OBJS := 

all : krkrz

krkrz: sdl3/environ/main.cpp krkrz.a $(KRKRZ_OBJS)
	$(CPP) sdl3/environ/main.cpp $(KRKRZ_OBJS) krkrz.a -o $@ $(CPPFLAGS) $(LDFLAGS)

krkrz.a : $(OBJS)
	$(AR) $@ $(OBJS)
	$(RANLIB) $@

%.o : %.cpp
	$(CPP) $(CPPFLAGS2) $(CPPFLAGS) -o $@ -c $<

%.o : %.cc
	$(CPP) $(CPPFLAGS2) $(CPPFLAGS) -o $@ -c $<

%.o : %.c
	$(CC) $(CPPFLAGS) -o $@ -c $<

#gedit common/base/StorageIntf.cpp 
#gedit sdl3/environ/stdapp.cpp, line 67
# Please run with: ./krkrz <path>
test:
	./krkrz

test2:
	SDL_RENDER_DRIVER=opengles2 ./krkrz

test3:
	SDL_RENDER_DRIVER=software ./krkrz

# Please run with: ./krkrz <path>
#(gdb) catch throw
debug:
	gdb --args ./krkrz

clean :
	$(RM) $(OBJS) $(KRKRZ_OBJS) krkrz.a krkrz 
	$(RM) user:

