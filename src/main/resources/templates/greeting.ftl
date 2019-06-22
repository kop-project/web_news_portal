<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/static/styles/auth.css">
</head>

<body>
<p align="center"><img  src="/static/images/InTech-Logo-6-01.png" alt="logo"></p>
<p align="center">Привет!</p>

<form action="/topic/create" method="post" enctype="multipart/form-data">
    <div id="page">
        <input type="hidden" name="_csrf" value="${_csrf.token}">

        <div class="input-group">
            <input type="text" name="displayname" class="form-control">
            <div class="input-group-prepend">
                <span class="input-group-text" id="">Введите заголовок темы</span>
            </div>
        </div>

        <br>

        <input class="form-control" type="text" placeholder="Автор" name="author" readonly>

        <br>

        <div class="input-group">
            <div class="custom-file">
                <input type="file" name="file" class="custom-file-input" >
                <label class="custom-file-label" for="inputGroupFile04">Выбрать логотип темы</label>
            </div>
        </div>

        <br>

        <div class="form-group">
            <label for="exampleFormControlTextarea1">Описание темы</label>
            <textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>
        <button class="btn btn-primary" id="btn-reg">Создать</button>
    </div>

</form>
</body>
</html>