#############################################################################
# Makefile for building: webrtc_pull_rtsp
#############################################################################

ifeq ($(origin ARCH), undefined)
ifneq ($(CROSS_TRIPLE),)
ifneq ($(filter aarch64%,$(CROSS_TRIPLE)),)
ARCH = arm64
else ifneq ($(filter arm%,$(CROSS_TRIPLE)),)
ARCH = arm
endif
endif
endif

ARCH	?= x86
CROSS_PREFIX = $(if $(CROSS_TRIPLE),$(CROSS_TRIPLE)-)

MAKEFILE      		= Makefile
ifeq ($(origin CXX), default)
CXX           		= $(CROSS_PREFIX)g++
endif
CXXFLAGS      		= -pipe -g -Wall -W -fPIC -std=gnu++11 -fno-rtti -fpermissive -fno-threadsafe-statics -fno-exceptions
INCPATH       		= -I.
DEL_FILE      		= rm -f
LINK          		= $(CXX)
LFLAGS        		?= $(if $(shell command -v ld.lld 2>/dev/null),-fuse-ld=lld)
FFMPEG_LIBS   		= $(or $(shell pkg-config --libs libavformat libavcodec libavutil libswresample 2>/dev/null),-lavformat -lavcodec -lavutil -lswresample)
LIBS          		= $(FFMPEG_LIBS) -L./lib/$(ARCH) -lWebRTCEmbeddedSDK -ldl -lpthread -lrt -lm

####### Files
BUILD_DIR     = build/$(ARCH)
OBJECTS       = $(BUILD_DIR)/main.o
TARGET        = webrtc_pull_rtsp

####### Build rules

$(TARGET):  $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(LIBS)

all: Makefile $(TARGET)

clean: 
	$(DEL_FILE) -r build
	$(DEL_FILE) main.o
	$(DEL_FILE) $(TARGET)

####### Compile

$(BUILD_DIR)/main.o: main.cpp sdkapi.h
	mkdir -p $(dir $@)
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o $@ main.cpp
