document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    // FullCalendar 초기화
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',  // 월간 달력 형식으로 설정
        locale: 'ko',  // 한국어로 설정
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        events: []  // 초기 이벤트는 비워둡니다.
    });

    // 캘린더 렌더링
    calendar.render();

    // AJAX로 서버로부터 데이터 가져오기
    $.ajax({
        url: 'CalendarService',  // 데이터를 가져올 URL 설정 (서블릿, 컨트롤러 등)
        type: 'GET',
        success: function(data) {
            // 데이터를 콘솔에 출력하여 확인 (이 위치에서 확인 가능)
            console.log(data);

            // 데이터가 JSON 문자열이라면, 이를 JSON 객체로 변환
            var jsonData;
            if (typeof data === 'string') {
                try {
                    jsonData = JSON.parse(data);
                } catch (e) {
                    console.error('Error parsing JSON data', e);
                    return;
                }
            } else {
                jsonData = data;  // 이미 객체 형식이면 그대로 사용
            }

            var events = [];
            jsonData.forEach(function(event) {
                events.push({
                    title: event.task_name.split(' ')[0],  // 제목
                    start: event.task_st_dt.split(' ')[0], // 시작 날짜 (YYYY-MM-DD 형식)
                    end: event.task_ed_dt.split(' ')[0],   // 종료 날짜 (YYYY-MM-DD 형식)
                    description: event.task_info,
					backgroundColor: event.kanban_color          // 설명 (필요시)
                });
            });

            // 이벤트 소스를 캘린더에 추가
            calendar.addEventSource(events);
			
			
        }
    });
});