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
	<section id="content" class="one-column">		
		<#list myposts as post>
			<article>
				<h2><a href="/post/${post["permalink"]}">${post["title"]}</a></h2>
				<div class="article-info">Posted on <time datetime="2013-05-14">${post["date"]?datetime}</time> by <span class="author">${post["author"]}</span><br>
					Comments: <span class="post-comments">
						<#if post["comments"]??>
							<#assign numComments = post["comments"]?size>
								<#else>
									<#assign numComments = 0>
						</#if><a href="/post/${post["permalink"]}">${numComments}</a></span>						
				</div>
				${post["body"]!""}
				<p>Filed Under:
					<#if post["tags"]??>
						<#list post["tags"] as tag>
						<a href="/tag/${tag}">${tag}</a>
						</#list>
					</#if>
				</p>
			</article>
		</#list>
	</section>
	<div class="clear"></div>
</div>
    <footer class="width">
        <div class="footer-content">
            <ul>
				<li><h4>Tags</h4></li>
				<#list myhotwords as hotwords>
					<li><a href="/tag/${hotwords["hottags"]}">${hotwords["hottags"]}</a></li>
				</#list>
			</ul>
			<ul>
				<li><h4>Authors</h4></li>
				<#list mostgeeky as geeks>
					<li><a href="#" class="nohover">${geeks["geeks"]}</a></li>
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

