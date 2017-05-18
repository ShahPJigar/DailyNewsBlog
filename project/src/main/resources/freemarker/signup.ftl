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
			<ul class="sf-menu dropdown">			
				<#if username??><li><a href="/welcome">Welcome ${username}</a></li><#else><li><a class="nohover" href="#">Welcome Guest</a></li></#if>
				<li><a href="/signup">Sign up</a></li>
				<li><a href="/login">Login</a></li>
			</ul>
			<div class="clear"></div>
    	</nav>      
	<div class="clear"></div>       
    </header>
<div id="body" class="no-intro">
	<section id="content" class="one-column full-width">	
	    <article>		
			<h2>Signup</h2>
			<fieldset>
				<legend></legend>
                <form method="post">
                    <p><label for="username">Username: <span class="required">*</span></label>
                    <input name="username" id="username" value="${username}" type="text" /> <span class="error">${username_error!""}</span></p>
                    <p><label for="passowrd">Password: <span class="required">*</span></label>
                    <input name="password" id="password" value="" type="password" /> <span class="error">${password_error!""}</span></p>
					<p><label for="verify">Verify Password: <span class="required">*</span></label>
                    <input name="verify" id="verify" value="" type="password" /> <span class="error">${verify_error!""}</span></p>
					<p><label for="email">Email: </label>
                    <input name="email" id="email" value="${email}" type="text" /> <span class="error">${email_error!""}</span></p>
                    <p><input name="send" style="margin-left: 150px;" class="formbutton" value="Submit" type="submit" /></p>
                </form>
            </fieldset>
		</article>	
</article>
	</section>
	<div class="clear"></div>
</div>
    <footer class="width">
        <div class="footer-bottom">
            <p>&copy; DailyNews 2016 by Jigar.</p>
         </div>
    </footer>
</body>
</html>
