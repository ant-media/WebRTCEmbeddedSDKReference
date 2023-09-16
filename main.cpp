#include "sdkapi.h"
#include "stdio.h"
// 

int main(int argc, char* argv[]) {
    init();
    if(argc > 1) {
        printf("argv 0:%s\n", argv[0]);
        printf("argv 1:%s\n", argv[1]);
        printf("argv 2:%s\n", argv[2]);
        printf("argv 3:%s\n", argv[3]);

        if(argc > 4) {
            printf("argv 4:%s\n", argv[4]);
            setVodDirectory(argv[4]);
        }

        if(argc > 7) {
            printf("argv 5:%s\n", argv[5]);
            printf("argv 6:%s\n", argv[6]);
            printf("argv 7:%s\n", argv[7]);

            setTurnServerParams(true, argv[5], argv[6], argv[7]);
        }

        start(argv[1], argv[2], argv[3]);
    }
    else {
/*
        setDataChannelEnabled(true, [](char* msg){
            printf("Receined Data Channel Message:%s\n", msg);
            
            sendDataChannelMessage(msg);
        });        
*/        
	  setMode(1);
	  
        //setLogLevel(3);

        start("ws://127.0.0.1:5080/WebRTCAppEE/websocket",
                       "rtsp://127.0.0.1:6554/test.flv", "stream1");
    }


    //rtc::CleanupSSL();
    return 0;
}
