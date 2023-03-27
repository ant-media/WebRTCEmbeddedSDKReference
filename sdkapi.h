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
void setDataChannelEnabled(bool enabled, void (*f)(char*));
void sendDataChannelMessage(const char* msg);

/*
0: peer to peer
1: publish to server
*/
void setMode(int mode);


#endif // SDKAPI_H
