<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<!-- GOOGLE FONTS -->
<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:light' rel='stylesheet' type='text/css'>
<!-- bootstrap  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/caja/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/tooltip.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/map/css/join.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원가입</title>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberInclude/joinInclude.jsp"/>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
<script>
	function searchPostCode(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var post_code = data.zonecode;
	            var addr1 = data.roadAddress;
	            
	            document.getElementById('memberPostCode').value = post_code;
                document.getElementById("memberAddr1").value = addr1;
	        }
	    }).open();
	}
	$("#chk_all").click(function() {
		if($("#chk_all").is(":checked")) $("input[class=chk]").prop("checked", true);
		else $("input[class=chk]").prop("checked", false);
	});

	$("input[class=chk]").click(function() {
		var total = $("input[class=chk]").length;
		var checked = $("input[class=chk]:checked").length;

		if(total != checked) $("#chk_all").prop("checked", false);
		else $("#chk_all").prop("checked", true); 
	});
	
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');

	var isIdChecked = false;// id 중복 확인을 했는지 확인
	var isEmailChecked = false;// email 중복 확인을 했는지 확인
	var isHndChecked = false;// Hnd 유효성 확인을 했는지 확인
	var isPwChecked = false;// pw 유효성 확인을 했는지 확인
	var isPwEquals = false;// pw 유효성 확인을 했는지 확인
	
	
	$('#memberId').keyup(function(){
		$('#check_id_button').css("border", "1px solid black");
		$('#check_id_button').css("color", "rgb(51, 51, 51)");
		isIdChecked = false;
		var member_id = $('#memberId');
		var reg = /^[a-zA-Z0-9]*$/;
		$('.hidden_div_01').css("display", "block");
		if(member_id.val().length < 6 || member_id.val().length > 20){
			$('#pwdMsg1').text('아이디는 6자리 이상 20자 이하로 입력해 주세요.');
		}else if(!reg.test(member_id.val())){
			$('#pwdMsg1').text('아이디는 영문/숫자만 사용하실 수 있습니다.');
		}else{
			$('.hidden_div_01').css("display", "none");
		}
	});
	
	$('#memberEmail').keyup(function(){
		$('#check_email_button').css("border", "1px solid black");
		$('#check_email_button').css("color", "rgb(51, 51, 51)");
		isEmailChecked = false;
		var email = $('#memberEmail');
		var reg = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
		$('.hidden_div_04').css("display", "block");
		if(email.val().length > 20){
			$('#pwdMsg4').text('이메일은 20자 이하로 입력해 주세요.');
		}else if(email.val() == "" || email.val().length == 0){
			$('#pwdMsg4').text('이메일을 입력해주세요.');
		}else if(!reg.test(email.val())){
			$('#pwdMsg4').text('이메일 형식으로 입력해 주세요.');
		}else if(email.val().length > 20){
			$('#pwdMsg4').text('이메일은 20자 이하로 입력해 주세요.');
		}else{
			$('.hidden_div_04').css("display", "none");
		}
	});
	$('#memberHndNo').keyup(function(){
		isHndChecked = false;
		var hndNo = $('#memberHndNo').val();
		$('.hidden_div_05').css("display", "block");
		if(hndNo.length != 11 || hndNo.substring(0, 3) != '010'){
			$('#pwdMsg5').text('휴대폰번호가 유효하지 않습니다.');
		}else{
			$('.hidden_div_05').css("display", "none");
			isHndChecked = true;
		}
	});
	function checkId(){
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		var member_id = $('#memberId');
		
		var reg = /^[a-zA-Z0-9]*$/;
		
		if(member_id.val().length < 6 || member_id.val().length > 20){
			alert("아이디는 6자리 이상 20자 이하로 입력해 주세요.");
			isIdChecked = false;
		}else if(!reg.test(member_id.val())){
			alert("아이디는 영문/숫자만 사용하실 수 있습니다.");
			isIdChecked = false;
		}else{
			$.ajax({
				type: "POST",
				url: '<%= request.getContextPath() %>/checkId',
				data: {member_id:member_id.val()},
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				success: function(data){
					console.log(data);
					if(data == 'success'){
						alert("사용가능한 아이디 입니다.");
						$('#check_id_button').css("border", "1px solid rgb(260, 260, 260)");
						$('#check_id_button').css("color", "rgb(221, 221, 221)");
						isIdChecked = true;
					}else{
						alert("이미 사용중인 아이디입니다.");
						isIdChecked = false;
					}
				}
			});
		}
	}
	var check_num = null;
	function checkEmail(){
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		var email = $('#memberEmail');
		
		var reg = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
		
		if(email.val().length > 20){
			alert("이메일은 20자 이하로 입력해 주세요.");
		}else if(email.val() == "" || email.val().length == 0){
			alert("이메일을 입력해주세요.");
		}else if(!reg.test(email.val())){
			alert("이메일 형식으로 입력해 주세요.");
		}else{
			$.ajax({
				type: "POST",
				url: '<%= request.getContextPath() %>/checkEmail',
				data: {email:email.val()},
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				success: function(data){
					if(data == 'fail'){
						alert("이미 사용중인 이메일입니다.");
						
					}else{
						alert("사용가능한 이메일 입니다.");
						$('#check_email_button').css("border", "1px solid rgb(260, 260, 260)");
						$('#check_email_button').css("color", "rgb(221, 221, 221)");
						
						check_num = data;
						$('.email_check_num').css("display", "inline-flex");
					}
				}
			});
		}
	}
	
	function checkNum(){
		var num = $('#mail_check');
		
		$('.hidden_div_06').css("display", "block");
		if(num.val() != check_num){
			$('#pwdMsg6').text('인증 실패');
			isEmailChecked = false;
		}else{
			alert("인증 성공!");
			$('.hidden_div_06').css("display", "none");
			$('.email_check_num').css("display", "none");
			document.getElementById('mail_check').value= "";
			isEmailChecked = true;
		}
	}
	$('#memberPwd1').keyup(function(){
		var joinPassword1 = $("#memberPwd1").val();
		var joinPassword2 = $("#memberPwd2").val();
		var reg = /^(?=.*?[A-Z|a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		$('.hidden_div_02').css("display", "block");
		if(joinPassword1.length > 16){
			$('#pwdMsg2').text('비밀번호는 최대 16자 까지 입력가능합니다.');
			isPwChecked = false;
		}else if(joinPassword1.search(/\s/) != -1) {
			$('#pwdMsg2').text('비밀번호는 공백을 사용하실 수 없습니다..');
			isPwChecked = false;
		}else if(/(\w)\1\1\1/.test(joinPassword1)){
			$('#pwdMsg2').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
			isPwChecked = false;
		}else if(false === reg.test(joinPassword1)){
			$('#pwdMsg2').text('8자 이상, 영문자/숫자/특수문자를 포함하여 입력해주세요.');
			isPwChecked = false;
		}else {
			$('.hidden_div_02').css("display", "none");
			isPwChecked = true;
		}
		
		if(isPwChecked && joinPassword2.length != 0  && joinPassword1 != joinPassword2){
			$('.hidden_div_03').css("display", "block");
			$('#pwdMsg3').text('비밀번호가 동일하지 않습니다.');
			isPwEquals = false;
		}else if(isPwChecked && joinPassword1 == joinPassword2){
			$('.hidden_div_03').css("display", "none");
			isPwChecked = true;
			isPwEquals = true;
		}
	});
	$('#memberPwd2').keyup(function(){
		var joinPassword1 = $("#memberPwd1").val();
		var joinPassword2 = $("#memberPwd2").val();
			
		var reg = /^(?=.*?[A-Z|a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		$('.hidden_div_03').css("display", "block");
		$('#pwdMsg3').css("color", "rgb(240, 63, 64)");
		if(joinPassword1.length == 0 || !isPwChecked){
			$('#pwdMsg3').text('비밀번호를 확인해 주세요');
			isPwChecked = false;
			
		}else{
			if(joinPassword1 != joinPassword2){
				$('#pwdMsg3').text('비밀번호가 동일하지 않습니다.');
				isPwChecked = true;
				isPwEquals = false;
			}else{
				$('.hidden_div_03').css("display", "none");
				isPwChecked = true;
				isPwEquals = true;
			}
		}
	});
	function isValidation(){
		var userName = document.getElementById('memberName').value;
		var postCode = document.getElementById('memberPostCode').value;
		var userHndNo = document.getElementById('memberHndNo').value;
		var add1 = document.getElementById('memberAddr1').value;
		if(!isIdChecked){
			alert("아이디 중복확인이 필요합니다.");
			return false;
		} else if(!isPwChecked) {
			alert("비밀번호가 유효하지 않습니다.")
			return false;
		} else if(!isPwEquals) {
			alert("비밀번호가 동일하지 않습니다.")
			return false;
		} else if(userName == "" || userName.length == 0){
			alert("이름을 입력해주세요.");
			return false;
		} else if(!isHndChecked){
			alert("핸드폰 번호를 입력해주세요.");
			return false;
		} else if(userHndNo.length < 11 || userHndNo.substring(0, 3) != '010'){
			alert("핸드폰 번호가 유효하지않습니다.");
			return false;
		} else if(!isEmailChecked){
			alert("이메일 본인인증이 필요합니다.");
			return false;
		} else if(postCode == "" || postCode.length == 0 || add1 == "" || add1.length == 0){
			alert("주소를 입력해주세요.");
			return false;
		} else if($('#membera1').prop("checked") == false){
			alert("필수약관동의를 체크해주세요.");
			return false;
		} else if($('#membera2').prop("checked") == false){
			alert("필수약관동의를 체크해주세요.");
			return false;
		} else if($('#membera3').prop("checked") == false){
			alert("필수약관동의를 체크해주세요.");
			return false;
		}
		
		return true;
	}
</script>