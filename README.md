Embedded SDK is a C++ library that captures the camera stream from RTSP url and restreams it to the web browser with WebRTC. 
By using WebRTC, clients do not need to install any third party tool on their devices. Instead they can use the browsers only. Also the video latency is less than 1 seconds. 

You should create a C++ project and build it by linking Embedded SDK library. 

This project is a reference to show how you can use the Embedded SDK library. After building your project, you should use an Ant Media Server as a signaling server. If your camera behind a NAT then also TURN server will be needed for NAT traversal.


# Build
## Prerequisites
- You should get the Embedded SDK libraries from [antmedia.io](https://antmedia.io). There are x86, arm and arm64 libraries.
- You should have the cross compile enviroment to build the project. 
- If you don't have, you can use this [docker container](https://github.com/multiarch/crossbuild) to build the project. So you should have docker installed.

## Building Reference Project
- For x86-linux:

  `$ docker run --rm -v $(pwd):/workdir multiarch/crossbuild make`
- For arm-linux:
  
  `$ docker run --rm -v $(pwd):/workdir -e CROSS_TRIPLE=arm-linux-gnueabihf multiarch/crossbuild make ARCH=arm`
- For arm64-linux:
  
  `$ docker run --rm -v $(pwd):/workdir -e CROSS_TRIPLE=aarch64-linux-gnu multiarch/crossbuild make ARCH=arm64`


# Usage of executable:

## Step 1. Get Embedded SDK Reference Project Executable
You can build it as written above or directly download the convenient executable directly from the executables in this repo.

## Step 2. Run Ant Media Server
You can find more about Ant Media Server [here](https://github.com/ant-media/Ant-Media-Server/wiki).

## Step 3. Play with a web browser or mobile SDK

`
$ ./webrtc_pull_rtsp {ANT_MEDIA_SERVER_WS_URL} {RTSP_SOURCE_URL} {STREAM_ID}
`

  **ANT_MEDIA_SERVER_WS_URL:** Web Socket URL for Ant Media Server. *Default: ws://127.0.0.1:5080/WebRTCAppEE/websocket*

  **RTSP_SOURCE_URL:** Camera or orher RTSP source URL. Default: *ws://127.0.0.1:5080/WebRTCAppEE/websocket*

  **STREAM_ID:** Stream Id for the broadcast. *Default: stream136*

**Example:**

  `
  $ ./webrtc_pull_rtsp ws://my.ant.media.server.io:5080/WebRTCAppEE/websocket rtsp://172.17.0.1:6554/test.flv mystream
  `

## Step 4. Play with a web browser or mobile SDK
- Open the following link from the browser:
  https://my.ant.media.server.io:5443/WebRTCAppEE/peer.html
- Write your Stream Id and click Join
