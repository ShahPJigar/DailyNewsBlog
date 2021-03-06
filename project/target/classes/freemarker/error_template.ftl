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
			<h2>404</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
		</article>
	</section>
	<div class="clear"></div>
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

