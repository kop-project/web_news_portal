<html>
<head>

</head>

<link rel="stylesheet" type="text/css" href="/static/styles/auth.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<body>

<!--<p align="center"><img  src="/static/images/InTech-Logo-6-01.png" alt="logo"></p>-->
<h1 id="logo">Добро пожаловать на новостной портал #InTechNews</h1>

<div id="page">
    <form action="/registration" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group">
            <label for="exampleInputEmail1">Логин</label>
            <input type="text" name="login" class="form-control" id="exampleInputEmail1" placeholder="Введите логин">
            <small id="emailHelp" class="form-text text-muted">Логин должен быть от 4 до 16 символов</small>
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Имя</label>
            <input type="text" name="username" class="form-control" id="exampleInputEmail1" placeholder="Введите имя">
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Фамилия</label>
            <input type="text" name="surname" class="form-control" id="exampleInputEmail1" placeholder="Введите фамилию">
        </div>

        <div class="form-group">
            <label for="exampleInputPassword1">Пароль</label>
            <input type="password" name="password" class="form-control" id="password" placeholder="Введите пароль">
            <small id="password" class="form-text text-muted"></small>
        </div>

        <div class="form-group">
            <label for="exampleInputPassword1">Повторение пароля</label>
            <input type="password" name="password2" class="form-control" id="password2"
                   placeholder="Подтвердите пароль">
            <small id="passwordConfirm" class="form-text text-muted"></small>
        </div>

        <button type="submit" class="btn btn-primary" id="btn-log">Зарегистрироваться</button>
    </form>
</div>

</body>

<script src="/static/scripts/authValid.js">


</script>
<script>
    document.getElementById('btn-log').onclick = function () {
        var pswd = document.getElementById('password');
        var pswdConfirm = document.getElementById('password2');

        if (pswd.value !== pswdConfirm.value) {
            document.getElementById('passwordConfirm').innerText = 'Пароли не совпадают';
            event.preventDefault();
        }
    }
</script>
</html>