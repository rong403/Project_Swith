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
    <div class="">
      <h6 class="p-title">스터디 등록</h6>
      <p>Want to hire me or just say hello? Use the form below to get in touch. Dont be shy!</p>
      <!-- form -->
      <form id="contactForm" action="#" method="post">
        <fieldset>
          <div>
            <textarea  name="comments"  id="comments" rows="5" cols="20" class="form-poshytip" onFocus="defaultInput(this,'How can i help you?')" onBlur="clearInput(this,'How can i help you?')" title="How can i help you?" style="width: 800px; height: 100px;">How can i help you?</textarea>
          </div>
          <p>
            <input type="button" value="Send" name="submit" id="submit">
          </p>
        </fieldset>
      </form>
      <p id="success" class="success">Thanks for your comments.</p>
      <!-- ENDS form -->
    </div>
    
    
    
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->