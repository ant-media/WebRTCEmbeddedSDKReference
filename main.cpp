#include "sdkapi.h"
#include "stdio.h"
#include "stdlib.h"
// 

int main(int argc, char* argv[]) {
    init();
    setLogLevel(2);
    if(argc > 1) {
        printf("argv 0:%s\n", argv[0]);
        printf("argv 1:%s\n", argv[1]);
        printf("argv 2:%s\n", argv[2]);
        printf("argv 3:%s\n", argv[3]);

	int mode = atoi(argv[4]);
	printf("argv 4:%d\n", mode);

	setMode(mode);
        start(argv[1], argv[2], argv[3]);
    }

    //rtc::CleanupSSL();
    return 0;
}
