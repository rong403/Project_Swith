<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- MAIN -->
<div id="main">
  <!-- wrapper-main -->
  <div class="wrapper">
    <!-- filter -->
    <ul class="tags">
      <li><span>Categories</span></li>
      <li><a href="#">All</a></li>
      <li class="active"><a href="#"> Photography</a></li>
      <li><a href="#">Logo</a></li>
      <li><a href="#">Webdesign</a></li>
      <li><a href="#">Marketing</a></li>
      <li><a href="#">Gaming</a></li>
      <li><a href="#">Coding</a></li>
    </ul>
    <!-- ENDS filter -->
    <!-- search -->
    <div class="top-search">
      <form  method="get" id="searchform" action="#">
        <div>
          <input type="text" value="Search..." name="s" id="s" onFocus="defaultInput(this,'Search...')" onBlur="clearInput(this,'Search...')">
          <input type="submit" id="searchsubmit" value=" ">
        </div>
      </form>
    </div>
    <!-- ENDS search -->
    
    <h1>스터디 등록</h1>
    <hr>
    <div id="rcorners3">
		<div class="textarea1">
			<h6 class="p-title">스터디 소개</h6>
			<!-- form -->
			<form id="contactForm" action="#" method="post">
				<fieldset>
					<div>
						<textarea name="comments" id="comments" rows="5" cols="20"
							class="form-poshytip"
							onFocus="defaultInput(this,'How can i help you?')"
							onBlur="clearInput(this,'How can i help you?')"
							title="등록글을 작성해주세요." style="width: 800px; height: 100px;">How can i help you?</textarea>
					</div>
					<!-- FOOTER -->
					
					<div id="footer">
					  <!-- wrapper-footer -->
					  <div class="wrapper">
					    <!-- left col -->
					    <div class="footer-left">
					      <h6 class="p-title">스터디 설정</h6>
					      <h6 class="p-title">1.요일 및 시간</h6>
					      <ul class="">
					        <li class=""><input type="checkbox" style="width: 50px;">월<input type="text" title="시간" style="width: 100px; margin-left: 100px" onFocus="defaultInput(this,'시간')" onBlur="clearInput(this,'시간')"></li>
					        <li class=""><input type="checkbox" style="width: 50px;">화<input type="text" title="시간" style="width: 100px; margin-left: 100px" onFocus="defaultInput(this,'시간')" onBlur="clearInput(this,'시간')"></li>
					        <li class=""><input type="checkbox" style="width: 50px;">수<input type="text" title="시간" style="width: 100px; margin-left: 100px" onFocus="defaultInput(this,'시간')" onBlur="clearInput(this,'시간')"></li>
					        <li class=""><input type="checkbox" style="width: 50px;">목<input type="text" title="시간" style="width: 100px; margin-left: 100px" onFocus="defaultInput(this,'시간')" onBlur="clearInput(this,'시간')"></li>
					        <li class=""><input type="checkbox" style="width: 50px;">금<input type="text" title="시간" style="width: 100px; margin-left: 100px" onFocus="defaultInput(this,'시간')" onBlur="clearInput(this,'시간')"></li>
					        <li class=""><input type="checkbox" style="width: 50px;">토<input type="text" title="시간" style="width: 100px; margin-left: 100px" onFocus="defaultInput(this,'시간')" onBlur="clearInput(this,'시간')"></li>
					        <li class=""><input type="checkbox" style="width: 50px;">일<input type="text" title="시간" style="width: 100px; margin-left: 100px" onFocus="defaultInput(this,'시간')" onBlur="clearInput(this,'시간')"></li>
					      </ul>
					    </div>
					    <!-- ENDS left col -->
					    <!-- right col -->
					    <div class="footer-right">
					      <h6 class="p-title">Contact me</h6>
					      <p>Want to hire me or just say hello? Use the form below to get in touch. Dont be shy!</p>
				          <div>
				          	<input name="name"  id="name" type="text" class="form-poshytip" value="Name" onFocus="defaultInput(this,'Name')" onBlur="clearInput(this,'Name')" title="Name">
				          </div>
				          <div>
				            <input name="email"  id="email" type="text" class="form-poshytip" value="Email" onFocus="defaultInput(this,'Email')" onBlur="clearInput(this,'Email')" title="Email">
				          </div>
				          <h6 class="p-title">3. 참고사항</h6>
				          <div>
				          	<textarea  name="comments"  id="comments" rows="5" cols="20" class="form-poshytip" onFocus="defaultInput(this,'참고하상')" onBlur="clearInput(this,'참고사항')" title="참고사항" style="width: 300px; height: 100px;">참고사항</textarea>
				          </div>
					    </div>
					    <!-- ENDS right col -->
					  </div>
					  <!-- ENDS wrapper-footer -->
					</div>
					<!-- ENDS FOOTER -->
					
					<p>
						<input type="button" value="Send" name="submit" id="submit">
					</p>
				</fieldset>
			</form>
			<!-- ENDS form -->
		</div>
	</div>
    
    
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->