<#import "pager.ftl" as p>

<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/static/styles/auth.css">
    <link rel="stylesheet" type="text/css" href="/static/styles/greetingPosts.css">
</head>

<style>
    body {
        max-width: 98%;
    }
    #pagination{
        position: absolute;
        top: 85%;
        left: 40%;
    }
    #escape{
        float: right;
    }
</style>
<body>
<a id="escape" href="/logout" class="">Выйти</a>

<p align="center" id="logo-img"><img  src="/static/images/InTech-Logo-6-01.png" width="575px" alt="logo"></p>
<#if user.getUsername()?has_content && user.getSurname()?has_content>
    <p align="center">Добро пожаловать, ${user.getUsername()} ${user.getSurname()}</p>
<#else >
    <p align="center">Добро пожаловать, ${user.getLogin()}</p>
</#if>

<!-- Ссылки на вызов модальных окон-->
<a   href="#win1" class="button button-success">
    <button id="modal" type="button" class="btn btn-primary">Создать тему</button>
</a>
<!-- Модальное окно №1 -->
<a href="#x" class="overlay" id="win1"></a>
<div class="popup">
    <form action="/topic/create" method="post" enctype="multipart/form-data">

        <div class="input-group">
            <input type="text" name="displayname" class="form-control">
            <div class="input-group-prepend">
                <span class="input-group-text" id="">Введите заголовок темы</span>
            </div>
        </div>

        <br>

        <input class="form-control" type="text" placeholder="${user.getLogin()}" value="${user.getLogin()}" name="author" readonly>

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

    </form>
    <a class="close"title="Закрыть" href="/"></a>
</div>

<br>
<br>
<br>

<div class="row">

    <#list topics.content as topic>
        <div class="col-md-3 topic">
            <div class="card mx-auto mb-3" style="max-width: 270px;">
                <!-- Изображение -->
                <img class="card-img-top" src="/img/${topic.getLogo()}" alt="..." width="200px" height="200px">
                <!-- Текстовый контент -->
                <div class="card-body theme">
                    <h4 class="card-title">${topic.getAuthor()}</h4>
                    <p  class="card-text">${topic.getDescription()}</p>
                    <a href="/topic/${topic.getId()}" class="btn btn-primary">Перейти</a>
                    <#if user.isAdmin()==true || user.getLogin() == topic.getAuthor()>
                        <a href="/topic/deleteTopic/${topic.getId()}" class="btn btn-danger">Удалить</a>
                    </#if>
                </div>
            </div><!-- Конец карточки -->
        </div>
    </#list>
    <div id="pagination">
    <#if topics.content?has_content>
        <@p.pager "/" topics>
        </@p.pager>
    </#if>
    </div>
</div>

</body>
</html>
