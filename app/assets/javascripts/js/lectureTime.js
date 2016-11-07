function startTime() {
    var today = new Date();
    var d = today.getDay();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    var lec = checkLectureHour();
    d = dayOftheWeek(d);
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('lecture').innerHTML = lec;
    document.getElementById('clock').innerHTML =
    d + "요일 " + h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function dayOftheWeek(d){
  if(d==1){ return "월" }
  else if (d==2) { return "화" }
  else if (d==3) { return "수" }
  else if (d==4) { return "목" }
  else if (d==5) { return "금" }
  else if (d==6) { return "토" }
  else if (d==7) { return "일" }
}
function checkTime(i) {
    if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
    return i;
}
function checkLectureHour(){
  var today = new Date();
  var hour = today.getHours();
  var minute = today.getMinutes();
  var result;
  if(hour == 9 || hour == 15){
    if (hour == 9) result = "1교시에요.";
    else result = "5교시에요.";
  } else if(hour == 10 || hour == 13 || hour == 16){
      if(minute <= 15) {
        if(hour == 10) result = "1교시에요.";
        else if(hour == 13) result = "3교시에요.";
        else result = "5교시에요.";
      } else if(minute <= 30){
        result = "쉬는시간이군요!";
      } else {
        if(hour == 10) result = "2교시에요.";
        else if(hour == 13) result = "4교시에요.";
        else result = "6교시에요.";
      }
  } else if(hour == 11 || hour == 14 || hour == 17) {
      if(minute <= 45) {
        if(hour == 10) result = "2교시에요.";
        else if(hour == 14) result = "5교시에요.";
        else result = "6교시에요.";
      } else {
        if(hour != 17) result = "쉬는시간이군요!";
        else "오늘 수업 끝~"
      }
  } else {
     if(hour >=18)
      result = "오늘 수업 끝~";
     else
      result = "수업 시작 전입니다.";
  }
  return result;
}
