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
        if (document.getElementById('content').childElementCount !== 0) {
            document.getElementById('content').innerHTML = "<div id=\"messages\">\n" +
                "            <div class=\"container\">\n" +
                "                <p></p>\n" +
                "                <span class=\"time-right\"></span>\n" +
                "                <span class=\"time-left\"></span>\n" +
                "            </div>\n" +
                "        </div>";
            var templateClone = document.getElementById('messages');
        } else {

            var templateClone = document.getElementById('messages').cloneNode(true);
        }

        var container = templateClone.firstElementChild.children;
        console.log(container);
        container[0].innerHTML = json.content;

        var time = json.timestamp;
        var tzoffset = (new Date()).getTimezoneOffset() * 60000; //offset in milliseconds
        var localISOTime = (new Date(Date.now() - tzoffset)).toISOString();
        localISOTime = localISOTime.replace('T',' ').substring(0, localISOTime.length - 5);
        container[1].innerHTML = localISOTime;

        container[2].innerHTML = json.sender;

        document.getElementById('content').appendChild(templateClone);
        document.getElementById('textMessage').innerText = '';
        window.location.reload();
        xhr.onreadystatechange = null;
    }
};