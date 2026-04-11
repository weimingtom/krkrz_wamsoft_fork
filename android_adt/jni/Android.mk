###from krkrm_v32.5_krkrz_dev_multi_platform_rollback_20170801_display_good.7z
###from krkr2-no-vcpkg



###/home/wmt/android-ndk-r27d/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ 
###--target=aarch64-none-linux-android29 
###--sysroot=/home/wmt/android-ndk-r27d/toolchains/llvm/prebuilt/linux-x86_64/sysroot 
###-DEXTERNAL_MINIAUDIO=1 
###-DINNER_AUDIOENGINE=1 
###-DMA_NO_DEVICE_IO 
###-DONIG_STATIC 
###-DTJS_JP_LOCALIZED 
###-DTVP_AUTOPATH_IGNORECASE 
###-DTVP_DONT_AUTOLOAD_MASK 
###-DTVP_DONT_AUTOLOAD_PROVINCE 
###-DTVP_ENABLE_EXECUTE_AT_EXCEPTION 
###-DTVP_LOG_TO_COMMANDLINE_CONSOLE 
###-DTVP_USE_OPENGL 
###-DTVP_USE_TURBO_JPEG_API 
###-DUNICODE 
###-D_UNICODE 
###-D__CODEGUARD__ 
###-D__GENERIC__ 
###-Dkrkrz_EXPORTS 
###-DCMAKE_INTDIR=\"Debug\" 
###
###-I/home/wmt/krkrz/common/environ 
###-I/home/wmt/krkrz/common/tjs2 
###-I/home/wmt/krkrz/common/base 
###-I/home/wmt/krkrz/common/extension 
###-I/home/wmt/krkrz/common/sound 
###-I/home/wmt/krkrz/common/msg 
###-I/home/wmt/krkrz/common/utils 
###-I/home/wmt/krkrz/common/visual 
###-I/home/wmt/krkrz/common/visual/gl 
###-I/home/wmt/krkrz/common/visual/opengl 
###-I/home/wmt/krkrz/common/glad/include 
###-I/home/wmt/krkrz/external 
###-I/home/wmt/krkrz/generic/base 
###-I/home/wmt/krkrz/generic/environ 
###-I/home/wmt/krkrz/generic/msg 
###-I/home/wmt/krkrz/generic/utils 
###-I/home/wmt/krkrz/generic/visual 
###-I/home/wmt/krkrz/sdl3/base 
###-I/home/wmt/krkrz/sdl3/environ 
###-I/home/wmt/krkrz/sdl3/utils 
###-I/home/wmt/krkrz/sdl3/visual 
###-I/home/wmt/krkrz/external/movie-player/include 
###-I/home/wmt/krkrz/build/arm64-android/_deps/sdl3-build/include-revision 
###-I/home/wmt/krkrz/build/arm64-android/_deps/sdl3-src/include 
###-isystem /home/wmt/krkrz/build/arm64-android/vcpkg_installed/x64-android/include 
###-isystem /home/wmt/krkrz/build/arm64-android/vcpkg_installed/x64-android/include/opus 
###-g 
###-DANDROID 
###-fdata-sections 
###-ffunction-sections 
###-funwind-tables 
###-fstack-protector-strong 
###-no-canonical-prefixes 
###-D_FORTIFY_SOURCE=2 -Wformat 
###-Werror=format-security 
###-frtti 
###-fexceptions  
###-fPIC   
###-fno-limit-debug-info    
###-std=gnu++17 
###-fPIC 
###-MD 
###-MT CMakeFiles/krkrz.dir/Debug/generic/app/movie.cpp.o 
###-MF CMakeFiles/krkrz.dir/Debug/generic/app/movie.cpp.o.d 
###-o CMakeFiles/krkrz.dir/Debug/generic/app/movie.cpp.o 
###-c /home/wmt/krkrz/generic/app/movie.cpp



LOCAL_PATH := $(call my-dir)

####################################
####################################

include $(CLEAR_VARS)

LOCAL_MODULE    := krkrz

# andres.cpp is self register, see TVPRegisterStorageMedia
# becareful, exclude compiling andres.cpp will not make compiling failed
# see KrkrzActivity, this is entry class
# like MyMoviePlayer.setAssetManager(getAssets());
# Java_jp_wamsoft_krkrz_KrkrzActivity_setAssetManager(JNIEnv *env, jobject thiz, jobject asset_manager) {

# see common\msg\MsgIntf.cpp
# -DMY_USE_MINLIB_NOTJSERROR=1
# force TVPThrowExceptionMessage execute throw; to crash instead of throw eTJSError; to show a dialog in Android

# see common\utils\LogIntf.h
# -DTVPLOG_LEVEL=0 is verbose logging, for TVPLOG_DEBUG, default is not defined

# see sdl3\environ\stdapp.cpp
# -DUSE_NO_RESOURCE=0
#//if use resource://. but not built in ./krkrz, it will crash
##if !defined(USE_NO_RESOURCE)
##if !defined(ANDROID) && !defined(__ANDROID__) 
##define USE_NO_RESOURCE 1 
##endif
##endif

LOCAL_CFLAGS += \
-DUSE_NO_RESOURCE=0 \
-DTVPLOG_LEVEL=0 \
-DMY_USE_MINLIB=1 \
-DMY_USE_MINLIB_NOTJSERROR=0 \
-DEXTERNAL_MINIAUDIO=1 \
-DINNER_AUDIOENGINE=1 \
-DMA_NO_DEVICE_IO \
-DONIG_STATIC \
-DTJS_JP_LOCALIZED \
-DTVP_AUTOPATH_IGNORECASE \
-DTVP_DONT_AUTOLOAD_MASK \
-DTVP_DONT_AUTOLOAD_PROVINCE \
-DTVP_ENABLE_EXECUTE_AT_EXCEPTION \
-DTVP_LOG_TO_COMMANDLINE_CONSOLE \
-DTVP_USE_OPENGL \
-DTVP_USE_TURBO_JPEG_API \
-DUNICODE \
-D_UNICODE \
-D__CODEGUARD__ \
-D__GENERIC__ \
-Dkrkrz_EXPORTS \
-DCMAKE_INTDIR=\"Debug\"




LOCAL_CPPFLAGS += -DANDROID 
LOCAL_CPPFLAGS += -fdata-sections 
LOCAL_CPPFLAGS += -ffunction-sections 
LOCAL_CPPFLAGS += -funwind-tables 
LOCAL_CPPFLAGS += -fstack-protector-strong 
LOCAL_CPPFLAGS += -no-canonical-prefixes 
LOCAL_CPPFLAGS += -D_FORTIFY_SOURCE=2 -Wformat 
LOCAL_CPPFLAGS += -Werror=format-security 
LOCAL_CPPFLAGS += -frtti 
LOCAL_CPPFLAGS += -fexceptions  
LOCAL_CPPFLAGS += -fPIC   
LOCAL_CPPFLAGS += -fno-limit-debug-info    
LOCAL_CPPFLAGS += -std=gnu++17

LOCAL_CPP_FEATURES += exceptions

LOCAL_C_INCLUDES += \
$(LOCAL_PATH) \
$(LOCAL_PATH)/../../common/environ \
$(LOCAL_PATH)/../../common/tjs2 \
$(LOCAL_PATH)/../../common/base \
$(LOCAL_PATH)/../../common/extension \
$(LOCAL_PATH)/../../common/sound \
$(LOCAL_PATH)/../../common/msg \
$(LOCAL_PATH)/../../common/utils \
$(LOCAL_PATH)/../../common/visual \
$(LOCAL_PATH)/../../common/visual/gl \
$(LOCAL_PATH)/../../common/visual/opengl \
$(LOCAL_PATH)/../../common/glad/include \
$(LOCAL_PATH)/../../external \
$(LOCAL_PATH)/../../generic/base \
$(LOCAL_PATH)/../../generic/environ \
$(LOCAL_PATH)/../../generic/msg \
$(LOCAL_PATH)/../../generic/utils \
$(LOCAL_PATH)/../../generic/visual \
$(LOCAL_PATH)/../../sdl3/base \
$(LOCAL_PATH)/../../sdl3/environ \
$(LOCAL_PATH)/../../sdl3/utils \
$(LOCAL_PATH)/../../sdl3/visual \
$(LOCAL_PATH)/../../external/movie-player/include \
$(LOCAL_PATH)/../../external/SDL3-f600c74/include-config-relwithdebinfo_android \
$(LOCAL_PATH)/../../external/SDL3-f600c74/include \
$(LOCAL_PATH)/../../external/onig/src \
$(LOCAL_PATH)/../../external/glm \
$(LOCAL_PATH)/../../external/fmt-11.2.0/include \
$(LOCAL_PATH)/../../external/opusfile/include \
$(LOCAL_PATH)/../../external/libogg-1.1.3/include \
$(LOCAL_PATH)/../../external/opus/include \
$(LOCAL_PATH)/../../external/libvorbis-1.2.0/include \
$(LOCAL_PATH)/../../external/freetype/include \
$(LOCAL_PATH)/../../external/libjpeg-turbo \
$(LOCAL_PATH)/../../external/libjpeg-turbo/android \
$(LOCAL_PATH)/../../external/lpng \
$(LOCAL_PATH)/../../external/miniaudio-0.11.23 \
$(LOCAL_PATH)/../../external/picojson-1.3.0 \


#$(LOCAL_PATH)/../../external/SDL3-f600c74/include-revision


LOCAL_SRC_FILES += \
$(LOCAL_PATH)/../../common/tjs2/tjs.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjs.tab.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsArray.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsBinarySerializer.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsByteCodeLoader.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsCompileControl.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsConfig.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsConstArrayData.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsDate.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsdate.tab.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsDateParser.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsDebug.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsDictionary.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsDisassemble.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsError.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsException.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsGlobalStringMap.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsInterCodeExec.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsInterCodeGen.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsInterface.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsLex.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsMath.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsMessage.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsMT19937ar-cok.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsNamespace.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsNative.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsObject.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsObjectExtendable.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsOctPack.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjspp.tab.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsRandomGenerator.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsRegExp.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsScriptBlock.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsScriptCache.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsSnprintf.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsString.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsUtils.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsVariant.cpp \
$(LOCAL_PATH)/../../common/tjs2/tjsVariantString.cpp \
$(LOCAL_PATH)/../../common/base/BinaryStream.cpp \
$(LOCAL_PATH)/../../common/base/CharacterSet.cpp \
$(LOCAL_PATH)/../../common/base/EventIntf.cpp \
$(LOCAL_PATH)/../../common/base/PluginIntf.cpp \
$(LOCAL_PATH)/../../common/base/ScriptMgnIntf.cpp \
$(LOCAL_PATH)/../../common/base/StorageIntf.cpp \
$(LOCAL_PATH)/../../common/base/SysInitIntf.cpp \
$(LOCAL_PATH)/../../common/base/SystemIntf.cpp \
$(LOCAL_PATH)/../../common/base/TextStream.cpp \
$(LOCAL_PATH)/../../common/base/UtilStreams.cpp \
$(LOCAL_PATH)/../../common/base/XP3Archive.cpp \
$(LOCAL_PATH)/../../common/base/StorageCache.cpp \
$(LOCAL_PATH)/../../common/environ/TouchPoint.cpp \
$(LOCAL_PATH)/../../common/extension/Extension.cpp \
$(LOCAL_PATH)/../../common/msg/MsgIntf.cpp \
$(LOCAL_PATH)/../../common/sound/MathAlgorithms.cpp \
$(LOCAL_PATH)/../../common/sound/PhaseVocoderDSP.cpp \
$(LOCAL_PATH)/../../common/sound/PhaseVocoderFilter.cpp \
$(LOCAL_PATH)/../../common/sound/RealFFT.cpp \
$(LOCAL_PATH)/../../common/sound/SoundBufferBaseIntf.cpp \
$(LOCAL_PATH)/../../common/sound/SoundBufferBaseImpl.cpp \
$(LOCAL_PATH)/../../common/sound/WaveFormatConverter.cpp \
$(LOCAL_PATH)/../../common/sound/WaveIntf.cpp \
$(LOCAL_PATH)/../../common/sound/WaveLoopManager.cpp \
$(LOCAL_PATH)/../../common/sound/WaveSegmentQueue.cpp \
$(LOCAL_PATH)/../../common/sound/OpusCodecDecoder.cpp \
$(LOCAL_PATH)/../../common/sound/VorbisCodecDecoder.cpp \
$(LOCAL_PATH)/../../common/utils/ClipboardIntf.cpp \
$(LOCAL_PATH)/../../common/utils/cp932_uni.cpp \
$(LOCAL_PATH)/../../common/utils/DebugIntf.cpp \
$(LOCAL_PATH)/../../common/utils/md5.c \
$(LOCAL_PATH)/../../common/utils/MiscUtility.cpp \
$(LOCAL_PATH)/../../common/utils/Random.cpp \
$(LOCAL_PATH)/../../common/utils/ThreadIntf.cpp \
$(LOCAL_PATH)/../../common/utils/TimerThread.cpp \
$(LOCAL_PATH)/../../common/utils/TimerIntf.cpp \
$(LOCAL_PATH)/../../common/utils/TVPTimer.cpp \
$(LOCAL_PATH)/../../common/utils/uni_cp932.cpp \
$(LOCAL_PATH)/../../common/utils/VelocityTracker.cpp \
$(LOCAL_PATH)/../../common/visual/BitmapIntf.cpp \
$(LOCAL_PATH)/../../common/visual/BitmapLayerTreeOwner.cpp \
$(LOCAL_PATH)/../../common/visual/BitmapInfomation.cpp \
$(LOCAL_PATH)/../../common/visual/CharacterData.cpp \
$(LOCAL_PATH)/../../common/visual/ComplexRect.cpp \
$(LOCAL_PATH)/../../common/visual/DrawDevice.cpp \
$(LOCAL_PATH)/../../common/visual/FontSystem.cpp \
$(LOCAL_PATH)/../../common/visual/FreeType.cpp \
$(LOCAL_PATH)/../../common/visual/FreeTypeFontRasterizer.cpp \
$(LOCAL_PATH)/../../common/visual/GraphicsLoaderIntf.cpp \
$(LOCAL_PATH)/../../common/visual/GraphicsLoadThread.cpp \
$(LOCAL_PATH)/../../common/visual/ImageFunction.cpp \
$(LOCAL_PATH)/../../common/visual/LayerBitmapImpl.cpp \
$(LOCAL_PATH)/../../common/visual/LayerBitmapIntf.cpp \
$(LOCAL_PATH)/../../common/visual/LayerIntf.cpp \
$(LOCAL_PATH)/../../common/visual/LayerManager.cpp \
$(LOCAL_PATH)/../../common/visual/LayerTreeOwnerImpl.cpp \
$(LOCAL_PATH)/../../common/visual/LoadJPEG.cpp \
$(LOCAL_PATH)/../../common/visual/LoadPNG.cpp \
$(LOCAL_PATH)/../../common/visual/LoadTLG.cpp \
$(LOCAL_PATH)/../../common/visual/NullDrawDevice.cpp \
$(LOCAL_PATH)/../../common/visual/BitmapDrawDevice.cpp \
$(LOCAL_PATH)/../../common/visual/PrerenderedFont.cpp \
$(LOCAL_PATH)/../../common/visual/RectItf.cpp \
$(LOCAL_PATH)/../../common/visual/SaveTLG5.cpp \
$(LOCAL_PATH)/../../common/visual/SaveTLG6.cpp \
$(LOCAL_PATH)/../../common/visual/TransIntf.cpp \
$(LOCAL_PATH)/../../common/visual/tvpgl.c \
$(LOCAL_PATH)/../../common/visual/VideoOvlIntf.cpp \
$(LOCAL_PATH)/../../common/visual/WindowIntf.cpp \
$(LOCAL_PATH)/../../common/visual/KeyRepeat.cpp \
$(LOCAL_PATH)/../../common/visual/gl/blend_function.cpp \
$(LOCAL_PATH)/../../common/visual/gl/ResampleImage.cpp \
$(LOCAL_PATH)/../../common/visual/gl/WeightFunctor.cpp \
$(LOCAL_PATH)/../../common/base/FuncStubs.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/OGLDrawDevice.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/CanvasIntf.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/GLTexture.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/GLFrameBufferObject.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/GLShaderUtil.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/Matrix32Intf.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/Matrix44Intf.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/OffscreenIntf.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/OpenGLError.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/ShaderProgramIntf.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/TextureIntf.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/TextureLayerTreeOwner.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/VertexBinderIntf.cpp \
$(LOCAL_PATH)/../../common/visual/opengl/VertexBufferIntf.cpp \
$(LOCAL_PATH)/../../common/glad/src/gles2.c \
$(LOCAL_PATH)/../../common/glad/src/egl.c \
$(LOCAL_PATH)/../../common/sound/SoundDecodeThread.cpp \
$(LOCAL_PATH)/../../common/sound/SoundEventThread.cpp \
$(LOCAL_PATH)/../../common/sound/QueueSoundBufferImpl.cpp \
$(LOCAL_PATH)/../../generic/base/DrawDeviceImpl.cpp \
$(LOCAL_PATH)/../../generic/base/EventImpl.cpp \
$(LOCAL_PATH)/../../generic/base/NativeEventQueue.cpp \
$(LOCAL_PATH)/../../generic/base/PluginImpl.cpp \
$(LOCAL_PATH)/../../generic/base/ScriptMgnImpl.cpp \
$(LOCAL_PATH)/../../generic/base/StorageImpl.cpp \
$(LOCAL_PATH)/../../generic/base/SysInitImpl.cpp \
$(LOCAL_PATH)/../../generic/base/SystemImpl.cpp \
$(LOCAL_PATH)/../../generic/environ/Application.cpp \
$(LOCAL_PATH)/../../generic/environ/FontSystemBase.cpp \
$(LOCAL_PATH)/../../generic/environ/WindowForm.cpp \
$(LOCAL_PATH)/../../generic/environ/JoyPad.cpp \
$(LOCAL_PATH)/../../generic/msg/MsgImpl.cpp \
$(LOCAL_PATH)/../../generic/msg/MsgLoad.cpp \
$(LOCAL_PATH)/../../generic/utils/ClipboardImpl.cpp \
$(LOCAL_PATH)/../../generic/visual/BitmapBitsAlloc.cpp \
$(LOCAL_PATH)/../../generic/visual/LayerImpl.cpp \
$(LOCAL_PATH)/../../generic/visual/VideoOvlImpl.cpp \
$(LOCAL_PATH)/../../generic/visual/WindowImpl.cpp \
$(LOCAL_PATH)/../../sdl3/base/FileImpl.cpp \
$(LOCAL_PATH)/../../sdl3/base/SDL3KirikiriIOStream.cpp \
$(LOCAL_PATH)/../../sdl3/base/SDL3KirikiriStorage.cpp \
$(LOCAL_PATH)/../../sdl3/base/storage.cpp \
$(LOCAL_PATH)/../../sdl3/environ/app.cpp \
$(LOCAL_PATH)/../../sdl3/environ/form.cpp \
$(LOCAL_PATH)/../../sdl3/environ/key.cpp \
$(LOCAL_PATH)/../../sdl3/environ/main.cpp \
$(LOCAL_PATH)/../../sdl3/environ/pad.cpp \
$(LOCAL_PATH)/../../sdl3/utils/LogImpl.cpp \
$(LOCAL_PATH)/../../sdl3/utils/TickCount.cpp \
$(LOCAL_PATH)/../../sdl3/visual/SDLDrawDevice.cpp \
$(LOCAL_PATH)/../../common/sound/MiniAudioEngine.cpp \
$(LOCAL_PATH)/../../sdl3/sound/audio.cpp \
$(LOCAL_PATH)/../../sdl3/environ/stdapp.cpp \
$(LOCAL_PATH)/../../common/base/FileAllocator.cpp \
$(LOCAL_PATH)/../../generic/app/movie.cpp \
$(LOCAL_PATH)/../../generic/app/andres.cpp \
$(LOCAL_PATH)/../../sdl3/utils/ThreadImpl.cpp



## $(LOCAL_PATH)/../../generic/app/andres.cpp


###why use common/sound/AudioStream.cpp instead of common/sound/MiniAudioEngine.cpp ?
###$(LOCAL_PATH)/../../common/sound/AudioStream.cpp


##vcpkg_installed/x64-android/debug/lib/libfreetyped.a  
##vcpkg_installed/x64-android/debug/lib/libturbojpeg.a  
##vcpkg_installed/x64-android/debug/lib/libogg.a  
##vcpkg_installed/x64-android/debug/lib/libvorbis.a  
##vcpkg_installed/x64-android/debug/lib/libvorbisenc.a  
##vcpkg_installed/x64-android/debug/lib/libvorbisfile.a  
##vcpkg_installed/x64-android/debug/lib/libz.a  
##vcpkg_installed/x64-android/debug/lib/libonig.a  
##vcpkg_installed/x64-android/debug/lib/libfmtd.a  
##vcpkg_installed/x64-android/debug/lib/libpng16d.a  
##vcpkg_installed/x64-android/debug/lib/libglm.a  
##vcpkg_installed/x64-android/debug/lib/libopus.a  
##vcpkg_installed/x64-android/debug/lib/libopusfile.a  
##external/movie-player/Debug/libmovieplayer.a  
##_deps/sdl3-build/Debug/libSDL3.so  
##vcpkg_installed/x64-android/debug/lib/libbz2d.a  
##vcpkg_installed/x64-android/debug/lib/libpng16d.a  
##vcpkg_installed/x64-android/debug/lib/libz.a  
##vcpkg_installed/x64-android/debug/lib/libbrotlidec.a  
##vcpkg_installed/x64-android/debug/lib/libbrotlicommon.a  
##vcpkg_installed/x64-android/debug/lib/libvorbis.a  
##vcpkg_installed/x64-android/debug/lib/libz.a  
##vcpkg_installed/x64-android/debug/lib/libogg.a  
##vcpkg_installed/x64-android/debug/lib/libopus.a  
##-lm  
##/home/wmt/android-ndk-r27d/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/aarch64-linux-android/29/liblog.so  
##-landroid  
##-lmediandk  
##-lOpenMAXAL  
##external/movie-player/extlibs/libyuv/Debug/libyuv.a  
##-latomic 
##-lm

ifneq ($(filter $(TARGET_ARCH_ABI), x86_64 x86),)
endif

LOCAL_LDLIBS    := -llog -landroid -lEGL -lGLESv1_CM -lGLESv2 -lOpenSLES -lz 
#-latomic

###LOCAL_WHOLE_STATIC_LIBRARIES += core_tjs core_extension_visual_simd core_utils core_visual core_sound core_movie core_plugin_environ core_base plugins 
LOCAL_WHOLE_STATIC_LIBRARIES += libonig libpng libfreetype vorbis ogg libopusfile libopus fmt libjpeg-turbo
###bpg uchardet opencv_core_imgproc oboe webp tinyxml2 lz4 libopenal

LOCAL_STATIC_LIBRARIES := 
#LOCAL_STATIC_LIBRARIES += android_native_app_glue cpufeatures ndk_helper
#see blow call import-module

LOCAL_SHARED_LIBRARIES :=
LOCAL_SHARED_LIBRARIES += SDL3
#SDL2 
#libopenal

include $(BUILD_SHARED_LIBRARY)

$(call import-module,external/freetype)
$(call import-module,external/libjpeg-turbo)
$(call import-module,external/onig)
$(call import-module,external/lpng)
$(call import-module,external/opusfile)
$(call import-module,external/opus)
###$(call import-module,external/libogg)

###$(call import-module,android/cpufeatures)
###$(call import-module,android/native_app_glue)
###$(call import-module,android/ndk_helper)

###$(call import-module,external/opencv-2.4.13)
$(call import-module,external/SDL3-f600c74)
###$(call import-module,external/oboe-1.8.0)
$(call import-module,external/fmt-11.2.0)
###$(call import-module,external/openal-soft-1.17.0)
###$(call import-module,external/libwebp-1.0.0)
###$(call import-module,external/tinyxml2-11.0.0)
###$(call import-module,external/lz4-1.10.0)
$(call import-module,external/libogg-1.1.3)
$(call import-module,external/libvorbis-1.2.0)
