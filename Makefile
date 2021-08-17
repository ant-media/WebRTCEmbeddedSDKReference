#############################################################################
# Makefile for building: webrtc_pull_rtsp
#############################################################################

ARCH	?= x86

MAKEFILE      		= Makefile
CXX           		= g++
CXXFLAGS      		= -pipe -g -Wall -W -fPIC -std=gnu++11 -fno-rtti -fpermissive -fno-threadsafe-statics -fno-exceptions
INCPATH       		= -I.
DEL_FILE      		= rm -f
LINK          		= g++
LFLAGS        		= 
LIBS          		= -L./lib/$(ARCH) -lWebRTCEmbeddedSDK -ldl -lpthread -lrt -lm

####### Files
OBJECTS       = main.o
TARGET        = webrtc_pull_rtsp

####### Build rules

$(TARGET):  $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(LIBS)

all: Makefile $(TARGET)

clean: 
	$(DEL_FILE) $(OBJECTS)
	$(DEL_FILE) $(TARGET)

####### Compile

main.o: main.cpp sdkapi.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp


