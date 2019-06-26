<#import "pager.ftl" as p>

<html xmlns="http://www.w3.org/1999/html">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/static/styles/topic.css">

</head>
<style>
#info{
    display: flex;
    justify-content: space-between;
    margin-top: 10px;
}

    .inform{
        margin-top: 55px;
        width: 950px;
    }
    #content{
        width: 1500px;

    }
    #message{
        margin-left: 140px;
        width: 70%;
        height: 45px;
    }

    #deleteMessage{
        text-decoration: none;
        color: cornflowerblue;
    }
    #reg{
        margin-right: 210px;
    }
</style>
<body>
<a id="escape" href="/" >Назад</a>
    <!-- Topic -->
    <div id="info">
        <div>
            <a align="center" id="logo-img"><img  src="/img/${topic.getLogo()}" width="700px" height="300px" alt="logo"></a>
        </div>
        <div class="inform">
            <div class="input-group">
                <br/>
                <input align="center" type="text" name="displayname" class="form-control" value="${topic.getDisplayname()}" readonly>
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Заголовок темы</span>
                </div>
            </div>
            <br/>
            <input class="form-control" type="text" placeholder="${user.getLogin()}" value="${user.getLogin()}" name="author" readonly>
            <br>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Описание темы</label>
                <textarea  class="form-control" name="description" id="textMessage" rows="3" readonly>${topic.getDescription()}</textarea>
            </div>
    <input type="hidden" id="topicId" value="${topic.getId()}">
    <input type="hidden" id="sender" value="${user.getLogin()}">

    </div>
    <!-- Topic -->
    </div>
    <div id="content">

        <#if messages?has_content>
        <#list messages.content as message>
            <#if message.getType() != "m.room.create">
            <div id="messages">
                <div class="container">
                    <p>${message.getContent()}</p>

                    <span class="time-right" id="${message.getTimestamp()}" >

                    </span>


                    <span class="time-left">${message.getSender()}</span>
                    <br/>
                    <#if user.isAdmin() == true || message.getSender() == user.getLogin()>
                        <p><a href="/topic/deleteMessage/${message.getId()}" id="deleteMessage">Удалить</a></p>
                    </#if>
                </div>
            </div>
            </#if>
        </#list>

            <@p.pager "/topic/${topic.getId()}" messages>
            </@p.pager>
            <#else>
        </#if>
    </div>



    <div class="page send">
        <textarea class="form-control txt" id="message" rows="3"  placeholder="Введите текст сообщения"></textarea>
        <button type="submit" class="btn btn-primary" id="reg">Отправить сообщение</button>
    </div>
<script>
</script>
<script src="/static/scripts/sendMessage.js"></script>
<script src="/static/scripts/getTime.js"></script>
</body>
</html>