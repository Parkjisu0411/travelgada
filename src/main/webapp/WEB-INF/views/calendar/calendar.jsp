<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>달력</title>

  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/daterangepicker.min.css"
    integrity="sha512-nmvKZG8E3dANbZAsJXpdK6IqpfEXbPNbpe3M3Us1qTipq74IpTRShbpCf8lJFapB7e0MkDbNDKxLjS1VWt2vVg=="
    crossorigin="anonymous" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.21.1/jquery.daterangepicker.min.js"
    integrity="sha512-jM36zj/2doNDqDlSIJ+OAslGvZXkT+HrtMM+MMgVxCqax1AIm1XAfLuUFP7uMSavUxow+z/T2CRnSu7PDaYu2A=="
    crossorigin="anonymous"></script>
	
	
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700;800&display=swap"
	rel="stylesheet">
	
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	
<style type="text/css">

.calendar-section {
  margin-bottom: 20px;
}
.calendar, .calendar_weekdays,
.calendar_content {
  max-width: 585px;
}

.calendar {
  /*float: left;*/
  margin: auto;
  min-width: 320px;
  font-family: 'Lato', sans-serif;
  font-weight: 400;
}

.calendar_weekdays {
	color: #aaa;
	font-weight: lighter;
}
.calendar_weekdays div {
  display:inline-block;
  vertical-align:top;
}
.calendar_content, .calendar_weekdays, .calendar_header {
  position: relative;
}
.calendar_content:after, .calendar_weekdays:after, .calendar_header:after {
	content: ' ';
	display: table;
	clear: both;
}
.calendar_weekdays div, .calendar_content div {
  /*border: 1px dotted #999;*/
  width: 14.28571%;
  height: 68px;
  line-height: 69px;  
  overflow: hidden;
  text-align: center;
  background-color: transparent;
}

.calendar_content .today {
	color: #3B8FC7;
}
.calendar_content div {
  float: left;
	margin-left: -1px;
	margin-top: -1px;
  border: 1px solid transparent;
}
.calendar_content div:hover {
  border: 1px solid #777;
  /*line-height: 68px;*/
  cursor: pointer;
}

.calendar_content div.blank:hover {
  cursor: default;
  border: none;
}

.calendar_content div.past-date {
	cursor: initial;
  color: #d5d5d5;
}
.calendar_content div.today{
  font-weight: bold;
  font-size: 18px;
  color: #409EDD;
}
.calendar_content div.selected {
  background-color: rgba(153, 153, 161, .2); /*rgba(170, 170, 176, .5) #aaaab0*/
  border: 1px solid white;
}
.calendar_header {
  width: 100%;
  text-align: center;
}

.calendar_header h2 {
  float:left;
  width:70%;
  margin-top: 10px;
  padding: 0 10px;
  font-family: 'Lato', sans-serif;
  font-weight: 300;
  font-size: 1.5em;
  color: #FFFFFF;
}

button.switch-month {
  background-color: transparent;
  padding: 0;
  outline: none;
  border: none;
  line-height: 52px;
  height: 55px;
  float: left;
  width:15%;
  transition: color .2s;
}

button.switch-month:hover {
  color: #5EADE2;
}
button.switch-month:active {
  background-color: rgba(113, 113, 125, .4);
}
.calendar_header h2 {
  color: #409EDD;
  line-height: 1.7;
}


</style>

<script>

$( document ).ready(function() {
	function c(passed_month, passed_year, calNum) {
		var calendar = calNum == 0 ? calendars.cal1 : calendars.cal2;
		makeWeek(calendar.weekline);
		calendar.datesBody.empty();
		var calMonthArray = makeMonthArray(passed_month, passed_year);
		var r = 0;
		var u = false;
		while(!u) {
			if(daysArray[r] == calMonthArray[0].weekday) { u = true } 
			else { 
				calendar.datesBody.append('<div class="blank"></div>');
				r++;
			}
		} 
		for(var cell=0;cell<42-r;cell++) { // 42 date-cells in calendar
			if(cell >= calMonthArray.length) {
				calendar.datesBody.append('<div class="blank"></div>');
			} else {
				var shownDate = calMonthArray[cell].day;
				// Later refactiroing -- iter_date not needed after "today" is found
				var iter_date = new Date(passed_year,passed_month,shownDate); 
				if ( 
					(
						( shownDate != today.getDate() && passed_month == today.getMonth() ) 
						|| passed_month != today.getMonth()
					) 
						&& iter_date < today) {						
					var m = '<div class="past-date">';
				} else {
					var m = checkToday(iter_date)?'<div class="today">':"<div>";
				}
				calendar.datesBody.append(m + shownDate + "</div>");
			}
		}

		// var color = o[passed_month];
		calendar.calHeader.find("h2").text(i[passed_month]+" "+passed_year);
					//.css("background-color",color)
					//.find("h2").text(i[passed_month]+" "+year);

		// find elements (dates) to be clicked on each time
		// the calendar is generated
		
		//clickedElement = bothCals.find(".calendar_content").find("div");
		var clicked = false;
		selectDates(selected);

		clickedElement = calendar.datesBody.find('div');
		clickedElement.on("click", function(){
			clicked = $(this);
			if (clicked.hasClass('past-date')) { return; }
			var whichCalendar = calendar.name;
			console.log(whichCalendar);
			// Understading which element was clicked;
			// var parentClass = $(this).parent().parent().attr('class');
			if (firstClick && secondClick) {
				thirdClicked = getClickedInfo(clicked, calendar);
				var firstClickDateObj = new Date(firstClicked.year, 
											firstClicked.month, 
											firstClicked.date);
				var secondClickDateObj = new Date(secondClicked.year, 
											secondClicked.month, 
											secondClicked.date);
				var thirdClickDateObj = new Date(thirdClicked.year, 
											thirdClicked.month, 
											thirdClicked.date);
				if (secondClickDateObj > thirdClickDateObj
					&& thirdClickDateObj > firstClickDateObj) {
					secondClicked = thirdClicked;
					// then choose dates again from the start :)
					bothCals.find(".calendar_content").find("div").each(function(){
						$(this).removeClass("selected");
					});
					selected = {};
					selected[firstClicked.year] = {};
					selected[firstClicked.year][firstClicked.month] = [firstClicked.date];
					selected = addChosenDates(firstClicked, secondClicked, selected);
				} else { // reset clicks
					selected = {};
					firstClicked = [];
					secondClicked = [];
					firstClick = false;
					secondClick = false;
					bothCals.find(".calendar_content").find("div").each(function(){
						$(this).removeClass("selected");
					});	
				}
			}
			if (!firstClick) {
				firstClick = true;
				firstClicked = getClickedInfo(clicked, calendar);
				selected[firstClicked.year] = {};
				selected[firstClicked.year][firstClicked.month] = [firstClicked.date];
			} else {
				console.log('second click');
				secondClick = true;
				secondClicked = getClickedInfo(clicked, calendar);
				//console.log(secondClicked);

				// what if second clicked date is before the first clicked?
				var firstClickDateObj = new Date(firstClicked.year, 
											firstClicked.month, 
											firstClicked.date);
				var secondClickDateObj = new Date(secondClicked.year, 
											secondClicked.month, 
											secondClicked.date);

				if (firstClickDateObj > secondClickDateObj) {

					var cachedClickedInfo = secondClicked;
					secondClicked = firstClicked;
					firstClicked = cachedClickedInfo;
					selected = {};
					selected[firstClicked.year] = {};
					selected[firstClicked.year][firstClicked.month] = [firstClicked.date];

				} else if (firstClickDateObj.getTime() ==
							secondClickDateObj.getTime()) {
					selected = {};
					firstClicked = [];
					secondClicked = [];
					firstClick = false;
					secondClick = false;
					$(this).removeClass("selected");
				}


				// add between dates to [selected]
				selected = addChosenDates(firstClicked, secondClicked, selected);
			}
			// console.log(selected);
			selectDates(selected);
		});			

	}
	function selectDates(selected) {
		if (!$.isEmptyObject(selected)) {
			var dateElements1 = datesBody1.find('div');
			var dateElements2 = datesBody2.find('div');

			function highlightDates(passed_year, passed_month, dateElements){
				if (passed_year in selected && passed_month in selected[passed_year]) {
					var daysToCompare = selected[passed_year][passed_month];
					// console.log(daysToCompare);
					for (var d in daysToCompare) {
						dateElements.each(function(index) {
							if (parseInt($(this).text()) == daysToCompare[d]) {
								$(this).addClass('selected');
							}
						});	
					}
					
				}
			}

			highlightDates(year, month, dateElements1);
			highlightDates(nextYear, nextMonth, dateElements2);
		}
	}

	function makeMonthArray(passed_month, passed_year) { // creates Array specifying dates and weekdays
		var e=[];
		for(var r=1;r<getDaysInMonth(passed_year, passed_month)+1;r++) {
			e.push({day: r,
					// Later refactor -- weekday needed only for first week
					weekday: daysArray[getWeekdayNum(passed_year,passed_month,r)]
				});
		}
		return e;
	}
	function makeWeek(week) {
		week.empty();
		for(var e=0;e<7;e++) { 
			week.append("<div>"+daysArray[e].substring(0,3)+"</div>") 
		}
	}

	function getDaysInMonth(currentYear,currentMon) {
		return(new Date(currentYear,currentMon+1,0)).getDate();
	}
	function getWeekdayNum(e,t,n) {
		return(new Date(e,t,n)).getDay();
	}
	function checkToday(e) {
		var todayDate = today.getFullYear()+'/'+(today.getMonth()+1)+'/'+today.getDate();
		var checkingDate = e.getFullYear()+'/'+(e.getMonth()+1)+'/'+e.getDate();
		return todayDate==checkingDate;

	}
	function getAdjacentMonth(curr_month, curr_year, direction) {
		var theNextMonth;
		var theNextYear;
		if (direction == "next") {
			theNextMonth = (curr_month + 1) % 12;
			theNextYear = (curr_month == 11) ? curr_year + 1 : curr_year;
		} else {
			theNextMonth = (curr_month == 0) ? 11 : curr_month - 1;
			theNextYear = (curr_month == 0) ? curr_year - 1 : curr_year;
		}
		return [theNextMonth, theNextYear];
	}
	function b() {
		today = new Date;
		year = today.getFullYear();
		month = today.getMonth();
		var nextDates = getAdjacentMonth(month, year, "next");
		nextMonth = nextDates[0];
		nextYear = nextDates[1];
	}

	var e=480;

	var today;
	var year,
		month,
		nextMonth,
		nextYear;

	//var t=2013;
	//var n=9;
	var r = [];
	var i = ["JANUARY","FEBRUARY","MARCH","APRIL","MAY",
			"JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER",
			"NOVEMBER","DECEMBER"];
	var daysArray = ["Sunday","Monday","Tuesday",
					"Wednesday","Thursday","Friday","Saturday"];
	var o = ["#16a085","#1abc9c","#c0392b","#27ae60",
			"#FF6860","#f39c12","#f1c40f","#e67e22",
			"#2ecc71","#e74c3c","#d35400","#2c3e50"];
	
	var cal1=$("#calendar_first");
	var calHeader1=cal1.find(".calendar_header");
	var weekline1=cal1.find(".calendar_weekdays");
	var datesBody1=cal1.find(".calendar_content");

	var cal2=$("#calendar_second");
	var calHeader2=cal2.find(".calendar_header");
	var weekline2=cal2.find(".calendar_weekdays");
	var datesBody2=cal2.find(".calendar_content");

	var bothCals = $(".calendar");

	var switchButton = bothCals.find(".calendar_header").find('.switch-month');

	var calendars = { 
					"cal1": { 	"name": "first",
								"calHeader": calHeader1,
								"weekline": weekline1,
								"datesBody": datesBody1 },
					"cal2": { 	"name": "second",
								"calHeader": calHeader2,
								"weekline": weekline2,
								"datesBody": datesBody2	}
					}
	

	var clickedElement;
	var firstClicked,
		secondClicked,
		thirdClicked;
	var firstClick = false;
	var secondClick = false;	
	var selected = {};

	b();
	c(month, year, 0);
	c(nextMonth, nextYear, 1);
	switchButton.on("click",function() {
		var clicked=$(this);
		var generateCalendars = function(e) {
			var nextDatesFirst = getAdjacentMonth(month, year, e);
			var nextDatesSecond = getAdjacentMonth(nextMonth, nextYear, e);
			month = nextDatesFirst[0];
			year = nextDatesFirst[1];
			nextMonth = nextDatesSecond[0];
			nextYear = nextDatesSecond[1];

			c(month, year, 0);
			c(nextMonth, nextYear, 1);
		};
		if(clicked.attr("class").indexOf("left")!=-1) { 
			generateCalendars("previous");
		} else { generateCalendars("next"); }
		clickedElement = bothCals.find(".calendar_content").find("div");
		console.log("checking");
	});


	//  Click picking stuff
	function getClickedInfo(element, calendar) {
		var clickedInfo = {};
		var clickedCalendar,
			clickedMonth,
			clickedYear;
		clickedCalendar = calendar.name;
		//console.log(element.parent().parent().attr('class'));
		clickedMonth = clickedCalendar == "first" ? month : nextMonth;
		clickedYear = clickedCalendar == "first" ? year : nextYear;
		clickedInfo = {"calNum": clickedCalendar,
						"date": parseInt(element.text()),
						"month": clickedMonth,
						"year": clickedYear}
		//console.log(clickedInfo);
		return clickedInfo;
	}


	// Finding between dates MADNESS. Needs refactoring and smartening up :)
	function addChosenDates(firstClicked, secondClicked, selected) {
		if (secondClicked.date > firstClicked.date || 
			secondClicked.month > firstClicked.month ||
			secondClicked.year > firstClicked.year) {

			var added_year = secondClicked.year;
			var added_month = secondClicked.month;
			var added_date = secondClicked.date;
			console.log(selected);

			if (added_year > firstClicked.year) {	
				// first add all dates from all months of Second-Clicked-Year
				selected[added_year] = {};
				selected[added_year][added_month] = [];
				for (var i = 1; 
					i <= secondClicked.date;
					i++) {
					selected[added_year][added_month].push(i);
				}
		
				added_month = added_month - 1;
				console.log(added_month);
				while (added_month >= 0) {
					selected[added_year][added_month] = [];
					for (var i = 1; 
						i <= getDaysInMonth(added_year, added_month);
						i++) {
						selected[added_year][added_month].push(i);
					}
					added_month = added_month - 1;
				}

				added_year = added_year - 1;
				added_month = 11; // reset month to Dec because we decreased year
				added_date = getDaysInMonth(added_year, added_month); // reset date as well

				// Now add all dates from all months of inbetween years
				while (added_year > firstClicked.year) {
					selected[added_year] = {};
					for (var i=0; i < 12; i++) {
						selected[added_year][i] = [];
						for (var d = 1; d <= getDaysInMonth(added_year, i); d++) {
							selected[added_year][i].push(d);
						}
					}
					added_year = added_year - 1;
				}
			}
			
			if (added_month > firstClicked.month) {
				if (firstClicked.year == secondClicked.year) {
					console.log("here is the month:",added_month);
					selected[added_year][added_month] = [];
					for (var i = 1; 
						i <= secondClicked.date;
						i++) {
						selected[added_year][added_month].push(i);
					}
					added_month = added_month - 1;
				}
				while (added_month > firstClicked.month) {
					selected[added_year][added_month] = [];
					for (var i = 1; 
						i <= getDaysInMonth(added_year, added_month);
						i++) {
						selected[added_year][added_month].push(i);
					}
					added_month = added_month - 1;
				}
				added_date = getDaysInMonth(added_year, added_month);
			}

			for (var i = firstClicked.date + 1; 
				i <= added_date;
				i++) {
				selected[added_year][added_month].push(i);
			}
		}
		return selected;
	}
});


</script>


    
<!-- Date Picker -->
  <script>
    $(document).ready(function () {
      $('#two-inputs').dateRangePicker(
        {
          language: 'ko',
          minDays: 1,
          separator: ' to ',
          selectForward: true,
          getValue: function () {
            if ($('#date-range200').val() && $('#date-range201').val())
              return $('#date-range200').val() + ' to ' + $('#date-range201').val();
            else
              return '';
          },
          setValue: function (s, s1, s2) {
            $('#date-range200').val(s1);
            $('#date-range201').val(s2);
          }
        });
    });
  </script>
  
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<!--Content -->
	<form action="${pageContext.request.contextPath}/planner_create" method="post">

	<!-- 숨겨서 보내야 하는 정보들 -->
	<input type="hidden" name="member_id" value="${member}"/>
	<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"/>
	<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}"/>

	<div class="container">
	<span style="font-family: 'yg-jalnan'">플래너 이름 : </span>
	<input type="text" name="planner_name"/>
	<br/>
	<br/>
	<span style="font-family: 'yg-jalnan'">여행 기간 : </span>
	<!-- Date Picker -->
<!-- 	<div> -->
		<span id="two-inputs"> 
      		<input id="date-range200" size="20" placeholder="출발일" name="start_date">
      		<input id="date-range201" size="20" placeholder="도착일" name="end_date">
    	</span> 
<!--     </div> -->
    
    <!-- 달력 -->
<div class="container">
      <div class="calendar-section">
        <div class="row">

          <div class="col-sm-6">

            <div class="calendar calendar-first" id="calendar_first">
              <div class="calendar_header">
                <button class="switch-month switch-left">
                  <i class="glyphicon glyphicon-chevron-left"></i>
                </button>
                <h2></h2>
                <button class="switch-month switch-right">
                  <i class="glyphicon glyphicon-chevron-right"></i>
                </button>
              </div>
              <div class="calendar_weekdays"></div>
              <div class="calendar_content"></div>
            </div>

          </div>
          <div class="col-sm-6">

            <div class="calendar calendar-second" id="calendar_second">
              <div class="calendar_header">
                <button class="switch-month switch-left">
                  <i class="glyphicon glyphicon-chevron-left"></i>
                </button>
                <h2></h2>
                <button class="switch-month switch-right">
                  <i class="glyphicon glyphicon-chevron-right"></i>
                </button>
              </div>
              <div class="calendar_weekdays"></div>
              <div class="calendar_content"></div>
            </div>            

          </div>

        </div> <!-- End Row -->
            
      </div> <!-- End Calendar -->
    </div> <!-- End Container -->
    
    
    
    <br/>
	<span style="font-family: 'yg-jalnan'">여행 갈 나라 : </span>
	
<!-- 	(여러나라를 여행하는 경우 먼저 가는 나라를 선택해주세요.) -->

	<input type="text" name="schedule_content"/>
	
	<br/>
	<br/>
	<input type="submit" value="작성"/>
	</div>
	</form>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>