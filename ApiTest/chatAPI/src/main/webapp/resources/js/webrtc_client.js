/*  화면 공유를 위한 변수 선언 */
const screenHandler = new ScreenHandler();
let shareView = null;

/**
 * ScreenHandler
 * @constructor
 */
function ScreenHandler() {
    // let localStream = null;

    console.log('Loaded ScreenHandler', arguments);

    // REF https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints#Properties_of_shared_screen_tracks
    const constraints = {
        audio: true,
        video: {
            width: 1980, // 최대 너비
            height: 1080, // 최대 높이
            frameRate: 50, // 최대 프레임
        },
    };

    /**
     * 스크린캡쳐 API를 브라우저 호환성 맞게 리턴합니다.
     * navigator.mediaDevices.getDisplayMedia 호출 (크롬 72 이상 지원)
     * navigator.getDisplayMedia 호출 (크롬 70 ~ 71 실험실기능 활성화 or Edge)
     */
    function getCrossBrowserScreenCapture() {
        if (navigator.getDisplayMedia) {
            return navigator.getDisplayMedia(constraints);
        } else if (navigator.mediaDevices.getDisplayMedia) {
            return navigator.mediaDevices.getDisplayMedia(constraints);
        }
    }

    /**
     * 스크린캡쳐 API를 호출합니다.
     * @returns shareView
     */
    function start() {

        try {
            shareView = getCrossBrowserScreenCapture();
        } catch (err) {
            console.log('Error getDisplayMedia', err);
        }

        return shareView;
    }

    /**
     * 스트림의 트렉을 stop()시켜 스트림이 전송을 중지합니다.
     */
    function end() {

        shareView.getTracks().forEach((track) => {
            // console.log("화면 공유 중지")
            track.stop();
        });

        // // 전송 중단 시 share-video 부분 hide
        // $("#share-video").hide();
    }

    /**
     * extends
     */
    this.start = start;
    this.end = end;

}

/**
 * screenHandler를 통해 스크린 API를 호출합니다
 * 원격 화면을 화면 공유 화면으로 교체
 */
function startScreenShare() {

    // 스크린 API 호출 & 시작
    screenHandler.start();

    // 1. myPeerConnection 에 연결된 다른 sender 쪽으로 - 즉 다른 Peer 쪽으로 -
    // 2. shareView 의 Track 에서 0번째 인덱스에 들어있는 값 - 즉 videoStream 로 - 교체한다.
    myPeerConnection.getSenders().forEach((sender)=>{ // 연결된 sender 로 보내기위한 반복문

        // 3. track 를 shareView 트랙으로 교체
        sender.replaceTrack(shareView.getTracks()[0])

    })


    /**
     * 화면 공유 중지 눌렀을 때 이벤트
     */
    shareView.getVideoTracks()[0].addEventListener('ended', () =>{
        // console.log('screensharing has ended')

        // 4. 화면 공유 중지 시 Track 를 localstream 의 videoStram 로 교체함
        myPeerConnection.getSenders().forEach((sender) =>{
            sender.replaceTrack(localStream.getTracks()[1]);
        })

        // $("#share-video").hide();

    });

    // console.dir(shareView.getTracks());
    // console.dir(localStream.getTracks());

}

/*
*  video off 버튼을 통해 스크린 API 종료
* */
function stopScreenShare(){

    // screen share 종료
    screenHandler.end();
    // myPeerConnection
    myPeerConnection.getSenders().forEach((sender) =>{
        
        // 4. 화면 공유 중지 시 Track 를 localstream 의 videoStram 로 교체함
        sender.replaceTrack(localStream.getTracks()[1]);
    })
}

function createPeerConnection() {
    myPeerConnection = new RTCPeerConnection(peerConnectionConfig);

    // event handlers for the ICE negotiation process
    myPeerConnection.onicecandidate = handleICECandidateEvent;
    myPeerConnection.ontrack = handleTrackEvent;

    // the following events are optional and could be realized later if needed
    // myPeerConnection.onremovetrack = handleRemoveTrackEvent;

    myPeerConnection.oniceconnectionstatechange = handleICEConnectionStateChangeEvent;
    // myPeerConnection.onicegatheringstatechange = handleICEGatheringStateChangeEvent;
    // myPeerConnection.onsignalingstatechange = handleSignalingStateChangeEvent;
}

/** peerConnection 과 관련된 이벤트 처리
 * 다른 peer 와 연결되었을 때 remote_video show 상태로로, 끊졌을때는 remote_video 를 hide 상태로 변경
 * **/
function handleICEConnectionStateChangeEvent(){
    let status = myPeerConnection.iceConnectionState;

    if(status === "connected"){
        console.log("status : "+status)
        $("#remote_video").show();
    }else if(status === "disconnected"){
        console.log("status : "+status)

        $("#remote_video").hide();
    }
}
