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
    <!-- Content -->
    <div class="content-col">
      <!-- content -->
      <div class="content">
        <div class="feature-holder"><img src="img/dummies/620x300.gif" alt="" class="attachment-post-thumbnail"></div>
        <div class="padding">
          <h3 class="p-title">Lorem ipsum dolor</h3>
          <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
          <p><span class="pullquote-right">This text is important thats why its pulled and quoted!</span>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Ut felis. Praesent dapibus, neque id cursus faucibus, Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci.</p>
          <!-- Buttons -->
          <div class="buttons-holder"> <a href="#" class="button-download">Download <span>1,231</span></a> <a href="#" class="button-love">Love it <span>450</span></a> </div>
          <!-- ENDS Buttons -->
        </div>
      </div>
      <!-- ENDS content -->
      <!-- Project gallery -->
      <h3 class="s-title">Project gallery</h3>
      <ul class="project-gallery">
        <li><a href="img/dummies/620x300.gif" rel="prettyPhoto[group]"><img src="img/dummies/140x140.gif" alt=""></a></li>
        <li><a href="img/dummies/620x300.gif" rel="prettyPhoto[group]"><img src="img/dummies/140x140.gif" alt=""></a></li>
        <li><a href="img/dummies/620x300.gif" rel="prettyPhoto[group]"><img src="img/dummies/140x140.gif" alt=""></a></li>
        <li><a href="img/dummies/620x300.gif" rel="prettyPhoto[group]"><img src="img/dummies/140x140.gif" alt=""></a></li>
        <li><a href="img/dummies/620x300.gif" rel="prettyPhoto[group]"><img src="img/dummies/140x140.gif" alt=""></a></li>
        <li><a href="img/dummies/620x300.gif" rel="prettyPhoto[group]"><img src="img/dummies/140x140.gif" alt=""></a></li>
        <li><a href="img/dummies/620x300.gif" rel="prettyPhoto[group]"><img src="img/dummies/140x140.gif" alt=""></a></li>
        <li><a href="img/dummies/620x300.gif" rel="prettyPhoto[group]"><img src="img/dummies/140x140.gif" alt=""></a></li>
      </ul>
      <!-- ENDS Project gallery -->
      <!-- comments list -->
      <h3 class="s-title">Comments <span>6 comments so far</span></h3>
      <div id="comments-wrap">
        <ol class="commentlist">
          <li class="comment even thread-even depth-1" id="li-comment-1">
            <div id="comment-1" class="comment-body clearfix"> <img alt="" src="img/gravatar.jpg" class="avatar avatar-35 photo" height="35" width="35">
              <div class="comment-author vcard">Jhon</div>
              <div class="comment-meta commentmetadata"> <span class="comment-date">3 days ago &middot; </span> <span class="comment-reply-link-wrap"><a class="comment-reply-link" href="#respond">Reply</a></span> </div>
              <div class="comment-inner">
                <p>Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.</p>
              </div>
            </div>
            <!-- child -->
            <ul class='children'>
              <li class="comment odd alt depth-2" id="li-comment-2">
                <div id="comment-2" class="comment-body clearfix"> <img alt="" src="img/gravatar.jpg" class="avatar avatar-35 photo" height="35" width="35">
                  <div class="comment-author vcard">Jhon</div>
                  <div class="comment-meta commentmetadata"> <span class="comment-date">1 hour ago &middot; </span> <span class="comment-reply-link-wrap"><a class="comment-reply-link" href="#respond">Reply</a></span> </div>
                  <div class="comment-inner">
                    <p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Sed posuere consectetur est at lobortis.</p>
                  </div>
                </div>
              </li>
            </ul>
            <!-- ENDS child -->
          </li>
          <li class="comment even thread-even depth-1" id="li-comment-3">
            <div id="comment-3" class="comment-body clearfix"> <img alt="" src="img/gravatar.jpg" class="avatar avatar-35 photo" height="35" width="35">
              <div class="comment-author vcard">Jhon</div>
              <div class="comment-meta commentmetadata"> <span class="comment-date">12 days ago &middot; </span> <span class="comment-reply-link-wrap"><a class="comment-reply-link" href="#respond">Reply</a></span> </div>
              <div class="comment-inner">
                <p>Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.</p>
              </div>
            </div>
          </li>
        </ol>
      </div>
      <!-- ENDS comments list -->
      <!-- Respond -->
      <div id="respond">
        <h3 class="s-title">Leave a Comment <span>Spam not allowed!</span></h3>
        <div class="cancel-comment-reply"><a id="cancel-comment-reply-link" href="#" style="display:none;">Cancel reply</a></div>
        <form action="#" method="post" id="commentform">
          <input type="text" name="author" id="author" value="" tabindex="1">
          <label for="author">Name <small>*</small></label>
          <input type="text" name="email" id="email" value="" tabindex="2">
          <label for="email">Email <small>*</small> <span>(not published)</span></label>
          <input type="text" name="url" id="url" value="" tabindex="3">
          <label for="url">Website</label>
          <textarea name="comment" id="comment"  tabindex="4"></textarea>
          <p>
            <input name="submit" type="submit" id="submit" tabindex="5" value="Post">
          </p>
        </form>
      </div>
      <div class="clear"></div>
      <!-- ENDS Respond -->
    </div>
    <!-- ENDS Content -->
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- table -->
      <h6 class="side-title"><span>Project Info</span></h6>
      <table>
        <tbody>
          <tr class="first-item">
            <td class="attr-name">Project date</td>
            <td class="attr-detail">14 March 2001</td>
          </tr>
          <tr class="">
            <td class="attr-name">Client</td>
            <td class="attr-detail">Myself</td>
          </tr>
          <tr class="">
            <td class="attr-name">Project url</td>
            <td class="attr-detail"><a href="#">luiszuno.com</a></td>
          </tr>
          <tr class="last-item">
            <td class="attr-name">Downloads</td>
            <td class="attr-detail">1,223</td>
          </tr>
        </tbody>
      </table>
      <!-- ENDS table -->
      <!-- project tags -->
      <h6 class="side-title"><span>Project tags</span></h6>
      <ul class="tags">
        <li></li>
        <li><a href="#">Pink</a></li>
        <li><a href="#">Red</a></li>
        <li><a href="#">Button</a></li>
        <li><a href="#">Project</a></li>
        <li><a href="#">Code</a></li>
        <li><a href="#">Jquery</a></li>
        <li><a href="#">Web</a></li>
        <li><a href="#">Freebie</a></li>
        <li><a href="#">Pic</a></li>
        <li><a href="#">Envato</a></li>
        <li><a href="#">Theme</a></li>
        <li><a href="#">Download</a></li>
        <li><a href="#">Stuff</a></li>
      </ul>
      <!-- ENDS project tags -->
      <!-- Info -->
      <h6 class="side-title"><span>Disclaimer</span></h6>
      <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
      <!-- ENDS Info -->
      <!-- Carbon ad -->
      <div class="ad-holder">
        <div class="carbonad"> <span class="carbonad-image"><a href="#"><img src="img/dummies/carbon-ad.gif" alt=""></a></span> <span class="carbonad-text">Pellentesque habitant morbi tristique </span> </div>
      </div>
      <!-- ENDS Carbon ad -->
    </div>
    <!-- ENDS Sidebar -->
    <div class="clear"></div>
  </div>
  <!-- ENDS wrapper-main -->
</div>
<!-- ENDS MAIN -->