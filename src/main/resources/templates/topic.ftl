<#import "pager.ftl" as p>

<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/static/styles/topic.css">
    <link rel="stylesheet" href="/static/styles/fontawesome.min.css">
</head>
<style>


</style>
<body>
<a id="escape" href="/">Назад</a>
<div id="page">
<!-- Topic -->
    <a align="center" id="logo-img"><img  src="/img/${topic.getLogo()}" width="475px" height="200px" alt="logo"></a>

    <div class="input-group">

            <br>
            <input align="center" type="text" name="displayname" class="form-control" value="${topic.getDisplayname()}" readonly>
            <div class="input-group-prepend">
                <span class="input-group-text" id="">Заголовок темы</span>
            </div>
        </div>
        <br>
        <input class="form-control" type="text" placeholder="${user.getLogin()}" value="${user.getLogin()}" name="author" readonly>
        <br>
        <div class="form-group">
            <label for="exampleFormControlTextarea1">Описание темы</label>
            <textarea  class="form-control" name="description" id="exampleFormControlTextarea1" rows="3" readonly>${topic.getDescription()}</textarea>
        </div>
    <input type="hidden" id="topicId" value="${topic.getId()}">
    <input type="hidden" id="sender" value="${user.getLogin()}">
    <!-- Topic -->
    <div id="content">

        <#if messages?has_content>
        <#list messages.content as message>
            <div id="messages">
                <div class="container">
                    <i class="fas fa-arrow-alt-circle-right"></i>
                    <p>${message.getContent()}</p>
                    <span class="time-right">11:00</span>
                    <span class="time-left">${message.getSender()}</span>
                </div>
            </div>
        </#list>
    </div>
    <br>

    <@p.pager "/topic/${topic.getId()}" messages>
    </@p.pager>
    </#if>


    <div class="page send">
        <textarea class="form-control txt" id="message" rows="3" placeholder="Введите текст сообщения"></textarea>
        <button type="submit" class="btn btn-primary" id="reg">Отправить сообщение</button>
    </div>

</div>
<script src="/static/scripts/sendMessage.js"></script>
</body>
</html>