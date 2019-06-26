<html>
<head>

</head>

<link rel="stylesheet" type="text/css" href="/static/styles/auth.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<body>

<p align="center"><img  src="/static/images/InTech-Logo-6-01.png" alt="logo"></p>
<h1 id="logo">Добро пожаловать на новостной портал #InTechNews</h1>

<div id="page">
    <form action="/login" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Логин</label>
            <input type="text" name="username" class="form-control" id="exampleInputEmail1"  placeholder="Введите логин">
            <small id="emailHelp" class="form-text text-muted"></small>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Пароль</label>
            <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            <small id="emailHelp" class="form-text text-muted"></small>
        </div>

        <button  type="submit" class="btn btn-primary" id="btn-log">Войти</button>
        <br>
    </form>

    <form action="/registration" method="get">
 <button class="btn btn-primary" id="btn-reg">Зарегистрироваться</button>
    </form>

</div>

</body>

<script src="/static/scripts/authValid.js">



</script>
</html>