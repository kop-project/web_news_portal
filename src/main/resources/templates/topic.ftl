<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/static/styles/topic.css">

</head>
<style>


</style>
<body>

<div id="page">
    <form action="/topic/create" method="post" enctype="multipart/form-data">

        <div class="input-group">

            <br>
            <input type="text" name="displayname" class="form-control">
            <div class="input-group-prepend">
                <span class="input-group-text" id="">Введите заголовок темы</span>
            </div>
        </div>

        <br>

        <input class="form-control" type="text" placeholder="${user.getLogin()}" value="${user.getLogin()}"
               name="author" readonly>

        <br>

        <div class="form-group">
            <label for="exampleFormControlTextarea1">Описание темы</label>
            <textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>

    </form>

    <input type="hidden" id="topicId" value="${topic.getId()}">
    <input type="hidden" id="sender" value="${user.getLogin()}">

    <div id="content">

    </div>
    <!--<div class="input-group">
        <div class="custom-file">
            <input type="text" class="custom-file-input" id="inputGroupFile04" value="asd">
            <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
        </div>
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="button">Button</button>
        </div>
    </div>-->

    <div class="page send">
        <textarea class="form-control txt" id="message" rows="3" placeholder="Введите текст сообщения"></textarea>
        <button type="submit" class="btn btn-primary" id="reg">Отправить сообщение</button>
    </div>

</div>

<script>
    document.getElementById('reg').onclick = function (ev) {
        var topicId = document.getElementById('topicId').value;
        var sender = document.getElementById('sender').value;
        var message = document.getElementById('message').value;

        var xhr = new XMLHttpRequest();
        var body = 'topicId=' + topicId + '&sender=' + sender + '&content=' + message;
        xhr.open("POST", '/topic/send_message', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send(body);

        xhr.onreadystatechange = function (ev1) {
            var json = JSON.parse(xhr.responseText);
            if (document.getElementById('content').childElementCount === 0) {
                document.getElementById('content').innerHTML = " <div id=\"messages\">\n" +
                    "            <div class=\"container\">\n" +
                    "                <p></p>\n" +
                    "                <span class=\"time-right\"></span>\n" +
                    "                <span class=\"time-left\"></span>\n" +
                    "            </div>\n" +
                    "        </div>";
            } else {

                var templateClone = document.getElementById('messages').cloneNode(true);

            }
            var container = templateClone.firstElementChild.children;
            container[0].innerHTML = json.content;

            var time = json.timestamp;

            var tzoffset = (new Date()).getTimezoneOffset() * 60000; //offset in milliseconds
            var localISOTime = (new Date(Date.now() - tzoffset)).toISOString().slice(-13, -5);
            container[1].innerHTML = localISOTime;
            //container[1].innerHTML = new Date(time)..slice(-13, -5);

            container[2].innerHTML = json.sender;


            console.log(container);
            document.getElementById('content').appendChild(templateClone);

            xhr.onreadystatechange = null;
        }
    }
</script>
</body>
</html>