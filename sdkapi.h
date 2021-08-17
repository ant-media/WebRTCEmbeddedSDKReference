#ifndef SDKAPI_H
#define SDKAPI_H

void init();
void start(char* websocket_address, char* rtspURL, char* streamId);
void setVodDirectory(char* vodDir);
void setTurnServerParams(bool useTurn, char* url, char* user, char* pass);

/*
SENSITIVE = 0
VERBOSE = 1
INFO = 2
WARNING = 3
ERROR = 4
NONE = 5
*/
void setLogLevel(int level);
void setBasePath(char* basePath);


#endif // SDKAPI_H
