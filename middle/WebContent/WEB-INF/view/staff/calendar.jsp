<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8' />
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  <script>

$(function(){
    // calendar element 취득
    var calendarEl = $('#calendar1')[0];
    // full-calendar 생성하기
    let all_events = null;
    all_events = loadingEvents();
    var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
        left: 'prev today',
        center: 'title',
        right: 'next'
    },
    locale: 'ko', // 한국어 설정
    editable: true, // 수정 가능
    events : all_events
    });
    // 캘린더 랜더링
    calendar.render();

    function loadingEvents(){
        $.ajax({
            type : 'post',
            url : "<%=request.getContextPath()%>/calendar/getAllEvents.do",
            dataType : 'json',
            async : false,
            success : function(res){
				console.log(res);
				alert("성공");
            },
            error : function(err){
				alert(err.status);
                
            }
        })
    }
});

</script>
<style>
  /* body 스타일 */
  body {
    margin-top: 40px;
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }
  /* 드래그 박스의 스타일 */

  #calendar-wrap {
    margin-left: 200px;
  }
 
  #calendar1 {
    max-width: 1100px;
    margin: 0 auto;
  }
</style>
</head>
<body>
  <div id='wrap'>
    <div id='calendar-wrap'>
      <div id='calendar1'></div>
      <input type="button" id="btnAddTest" value="일정추가">
    </div>
  </div>
</body>
</html>