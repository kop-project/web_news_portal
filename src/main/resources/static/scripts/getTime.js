


var list = document.getElementsByClassName('time-right');
var arrList = Object.values(list);
arrList.forEach(function (item) {
    var time = item.id;
    var correctTime = +time.replace(/\s/g, '');
    var tzoffset = (new Date()).getTimezoneOffset() * 60000;
    var localISOTime = (new Date(correctTime - tzoffset)).toISOString();
    localISOTime = localISOTime.replace('T',' ').substring(0, localISOTime.length - 5);
    item.innerText = localISOTime;
});
