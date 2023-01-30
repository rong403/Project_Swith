<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <%-- <script src="<%=request.getContextPath() %>/resources/dist/socket.io.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/web_rtc.js"></script> --%>
    <script src="<%=request.getContextPath() %>/resources/js/webrtc_client.js"></script>
    <script type="text/javascript">
    	createPeerConnection();
    </script>
</head>

<body>
	<div>
        <video id="localVideo" autoplay width="480px"></video>
        <video id="remoteVideo" width="480px" autoplay></video>
    </div>
</body>
</html>