<!DOCTYPE html>
<html>
<head>
    <title>DailyNews</title>
    <#include "css/test.css">
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>
<body>
<div id="container" class="width">
    <header> 
    		<h1><a href="/">DailyNews</a></h1>
		<nav>
			<#if username??>	
    			<ul class="sf-menu dropdown">			
        			<li><a href="/welcome">Welcome ${username}</a></li>
	     			<li><a href="/logout">Logout</a></li>
					<li><a href="/newpost">New Post</a></li>
       			</ul>
			<#else>
				<ul class="sf-menu dropdown">			
        			<li><a class="nohover" href="#">Welcome Guest</a></li>
	     			<li><a href="/signup">Sign up</a></li>
					<li><a href="/login">Log in</a></li>
       			</ul>
			</#if>					
			<div class="clear"></div>
    	</nav>     
	<div class="clear"></div>       
    </header>
	<div id="body" class="no-intro">
		<section id="content" class="one-column full-width">
			<article>
				<h2>Add Post Details</h2>
				<fieldset>
					<legend></legend>
					<form action="/newpost" method="POST">
						<p><label for="subject">Title: <span class="required">*</span></label>
						<input name="subject" id="subject" value="${subject!""}" type="text" /></p>
						<p><label for="body">Body: <span class="required">*</span></label>
						<textarea cols="37" rows="11" name="body" id="bodyarea">${body!""}</textarea></p>
						<p><label for="tags">Tags:</label>
						<input name="tags" id="tags" value="${tags!""}" type="text" /><span class="note">(Note: Comma separated)</span></p>
						<p><input name="send" style="margin-left: 150px;" class="formbutton" value="Submit" type="submit" /><span class="error">${errors!""}</span></p>
					</form>
				</fieldset>
			</article>	
		</section>
		<div class="clear"></div>
	</div>
</div>
    <footer class="width">
        <div class="footer-content">
            <ul>
				<li><h4>Frequent Tags</h4></li>
				<#list myhotwords as hotwords>
					<li><a href="/tag/${hotwords["hottags"]}">${hotwords["hottags"]}</a></li>
				</#list>
			</ul>
			<ul>
				<li><h4>Top Publishers</h4></li>
				<#list mostpublisher as publisher>
					<li>${publisher["geek"]}</li>
				</#list>
			</ul>
			<ul>
                <li><h4>Top Commenters</h4></li>
                <#list mostcommenter as commenter>
                    <li>${commenter["nerd"]}</li>
                </#list>
            </ul>
			<ul>
				<li><h4>Social Media</h4></li>
				<li><a href="https://www.linkedin.com/pub/jigar-shah/35/b2b/b2"><img src="https://static.licdn.com/scds/common/u/img/webpromo/btn_liprofile_blue_80x15.png" width="80" height="15" border="0" alt="View Jigar Shah's profile on LinkedIn"></a></li>
				<li><a href="https://twitter.com/ShahPJigar" class="twitter-follow-button" data-show-count="false" data-show-screen-name="false">Follow @ShahPJigar</a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script></li>
			</ul>
            <div class="clear"></div>
        </div>
        <div class="footer-bottom">
            <p>&copy; DailyNews 2016 by Jigar.</p>
         </div>
    </footer>
</body>
</html>