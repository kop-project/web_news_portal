<html>
<head>

</head>

<link rel="stylesheet" type="text/css" href="/static/styles/auth.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<body>

<p align="center"><img  src="/static/images/InTech-Logo-6-01.png" alt="logo"></p>
<h1 id="logo">Добро пожаловать на новостной портал #InTechNews</h1>

<div id="page">
    <form action="/registration" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Логин</label>
            <input id="text" name="login" class="form-control"  placeholder="Введите логин">
            <small id="loginError" class="form-text text-muted"><#if loginError?has_content>${loginError}</#if></small>
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Имя</label>
            <input id="username" name="username" class="form-control"  placeholder="Введите имя">
            <small id="nameError" class="form-text text-muted"></small>

        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Фамилия</label>
            <input id="surname" name="surname" class="form-control" placeholder="Введите фамилию">
            <small id="surnameError" class="form-text text-muted"></small>

        </div>

        <div class="form-group">
            <label for="exampleInputPassword1">Пароль</label>
            <input type="password" name="password" class="form-control" id="password" placeholder="Введите пароль">
            <small id="passwordError" class="form-text text-muted"></small>
        </div>

        <div class="form-group">
            <label for="exampleInputPassword1">Повторение пароля</label>
            <input type="password" name="password2" class="form-control" id="password2"
                   placeholder="Подтвердите пароль">
            <small id="passwordConfirm" class="form-text text-muted"></small>
        </div>

        <button type="submit" class="btn btn-primary" id="btn">Зарегистрироваться</button>
    </form>
</div>

</body>

<script src="/static/scripts/authValid.js">


</script>
<script>
    document.getElementById('password').onclick = function () {
        alert('Пароль должен быть больше 7 символов и включать хотя бы 1 цифру, букву строчную и заглавную, а так же спец.символ !@#$%');
    };


    document.getElementById('btn').onsubmit = function (event) {

    var login = document.getElementById('login');
    var name1 = document.getElementById('username');
    var surname = document.getElementById('surname');
    var password = document.getElementById('password');
    var password2 = document.getElementById('password2');

    event.preventDefault();

        if (login.value.length <= 0) {
            document.getElementById('loginError').innerText = 'Ошибка. Логин больше 0';
            event.preventDefault();
        } else {
            document.getElementById('loginError').innerText = '';
        }

        if (name1.value.length <= 0) {
            document.getElementById('nameError').innerText = 'Ошибка. Имя больше 0';
            event.preventDefault();
        } else {
            document.getElementById('nameError').innerText = '';
        }

        if (surname.value.length <= 0) {
            document.getElementById('surnameError').innerText = 'Ошибка. Фамилия больше 0';
            event.preventDefault();
        } else {
            document.getElementById('surnameError').innerText = '';
        }

        if(password.value.length < 8 && password2.value.length < 8) {
            event.preventDefault();
            document.getElementById('passwordError').innerText = 'Пароль не дожен быть пустой';
            document.getElementById('passwordConfirmError').innerText = 'Пароль не дожен быть пустой';
        }

    }
</script>
</html>