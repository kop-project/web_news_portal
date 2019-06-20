<html>
<head>

</head>

<link rel="stylesheet" type="text/css" href="/static/css/auth.css">
<body>

<p align="center"><img  src="/static/images/InTech-Logo-6-01.png" alt="logo"></p>
<h1 id="logo">Добро пожаловать на новостной портал #InTechNews</h1>

<form action="/login" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">

</form>
</body>
</html>