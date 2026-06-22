#include "sdkapi.h"
#include "stdio.h"
#include "stdlib.h"
// 

int main(int argc, char* argv[]) {
    init();
    setLogLevel(2);
    if(argc > 3) {
        printf("argv 0:%s\n", argv[0]);
        printf("argv 1:%s\n", argv[1]);
        printf("argv 2:%s\n", argv[2]);
        printf("argv 3:%s\n", argv[3]);

        if(argc > 4) {
            int mode = atoi(argv[4]);
            printf("argv 4:%d\n", mode);
            setMode(mode);
        }

        if(argc > 5) {
            printf("argv 5:%s\n", argv[5]);
            setVodDirectory(argv[5]);
        }

        if(argc > 8) {
            printf("argv 6:%s\n", argv[6]);
            printf("argv 7:%s\n", argv[7]);
            printf("argv 8:%s\n", argv[8]);

            setTurnServerParams(true, argv[6], argv[7], argv[8]);
        }

        start(argv[1], argv[2], argv[3]);
    }
    else {
        printf("Usage: %s {ANT_MEDIA_SERVER_WS_URL} {RTSP_SOURCE_URL} {STREAM_ID} [MODE] [VOD_DIRECTORY] [TURN_URL] [TURN_USERNAME] [TURN_PASSWORD]\n", argv[0]);
    }

    //rtc::CleanupSSL();
    return 0;
}
