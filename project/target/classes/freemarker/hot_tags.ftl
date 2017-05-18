<!DOCTYPE html>
<html>
<head>
    <title>My Blog</title>
    <#include "css/test.css">
</head>
<body>

<#if username??>
    Welcome ${username} <a href="/logout">Logout</a> | <a href="/newpost">New Post</a>

    <p>
<#else>
    Welcome guest <a href="/signup"> Sign up </a> | <a href="/login">Log in</a>
</#if>

<h1>My Blog</h1>

<#list myhotwords as hotwords>
${hotwords["hottags"]}
</#list>

</body>
</html>

