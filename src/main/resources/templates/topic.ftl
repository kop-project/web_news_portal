<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/static/styles/topic.css">

</head>
<style>


</style>
<body>

<div id="page">
    <input type="hidden" id="topicId" value="${topic.getId()}">
    <input type="hidden" id="sender" value="${user.getLogin()}">

    <div id="messages">
        <div class="container">
            <p>Hello. How are you today?</p>
            <span class="time-right">11:00</span>
        </div>
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
        <button class="btn btn-primary" id="btn-reg">Отправить сообщение</button>
    </div>

</div>

<script>


    var templateClone = document.getElementById('messages').cloneNode(true);
    console.log(templateClone);

//    var templateClone = document.getElementById('messages').cloneNode(true);
  //  console.log(templateClone.childNodes[1].childNodes);

    document.getElementById('btn-reg').onclick = function (ev) {
        var topicId = document.getElementById('topicId').value;
        var sender = document.getElementById('sender').value;
        var message = document.getElementById('message').value;

        var xhr = new XMLHttpRequest();
        var body = 'topicId=' + topicId + '&sender=' + sender + '&content=' + message;
        xhr.open("POST", '/topic/send_message', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send(body);


        xhr.onreadystatechange = function (ev1) {
                console.log(xhr.responseText);

            var templateClone = document.getElementById('messages').cloneNode(true);

            document.getElementById('messages').nextSibling.appendChild(templateClone);

            xhr.onreadystatechange = null;
        }
    }
</script>
</body>
</html>