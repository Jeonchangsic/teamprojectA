<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="team.projectA.vo.*" %>
<%
	List<LodgingVO> list1 = (List<LodgingVO>)request.getAttribute("list1");
	List<RoomVO> list2 = (List<RoomVO>)request.getAttribute("list2");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="<%=request.getContextPath()%>/resources/css/lodging_css/reset.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/lodging_css/select_style.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/resources/css/jquery-3.6.1.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/jquery-ui.css">
    <script src="<%=request.getContextPath()%>/resources/css/jquery-ui.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"> <!--XE아이콘-->


    <script>

    //메뉴 접었다 폈다 하는 기능
     $(document).ready(function(){
	$(".select_under").click(function(){
		if($(this).next(".open_menu").is(":visible")){
			$(this).next(".open_menu").css("display", "none");
		}else{
			$(this).next(".open_menu").css("display", "block");
		}
	});  
});


  $(document).ready(function(){
     $(".select_under").mouseup(function (e){
         var container = $(".open_menu");
            if(container.has(e.target).length===0)
           container.hide();
      })
     })
     
     
     //전체메뉴숨기기
     $(document).ready(function(){
	$("#select ul li").click(function(){
		if($(".selectBoth").is(":visible")){
			$(".selectBoth").css("display", "none");
		}else{
			$(".selectBoth").css("display", "block");
		}
	});
})

 
     //클릭시 지역텍스트 변경    
      $( document ).ready( function() {

    	  $(".c1").click(function(){
        	  var jbText = $(this).text();
          $("#select_main p").text(jbText);
          $("#reselect_btn").css("display","inline-block");
    	  });
      });

     //지역전체메뉴 접었다 폈다 하는 기능  
      	$(document).ready(function(){
            $("#reselect_btn").click(function(){
            	if($(".selectBoth").is(":visible")){
        			$(".selectBoth").css("display", "none");
        		}else{
        			$(".selectBoth").css("display", "block");
        		}
            });
        });
     
     
     //검색기능
     $(document).ready(function(){
            $(".search_btn").click(function(){
                $(".search_bar").toggleClass("view");
            });

            // swiper slide
            var swiper = new Swiper(".mySwiper", {
                // cssMode: true,
                navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
                },
                pagination: {
                el: ".swiper-pagination",
                },
                // mousewheel: true,
                keyboard: true,
            });
        });

			 //캘린더
				$(function() {
                
            
                //오늘 날짜를 출력
                $("#today").text(new Date().toLocaleDateString());

                //datepicker 한국어로 사용하기 위한 언어설정
                $.datepicker.setDefaults($.datepicker.regional['ko']); 
                
                // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
                // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

                //시작일.
                $('#fromDate').datepicker({
                    showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                  
                    buttonText: "시작일",             // 버튼의 대체 텍스트
                    dateFormat: "yy-mm-dd",             // 날짜의 형식
                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                    minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                    onClose: function( selectedDate ) {    
                        // 시작일(fromDate) datepicker가 닫힐때
                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#toDate").datepicker( "option", "minDate", selectedDate );
                    }                
                });

                //종료일
                $('#toDate').datepicker({
                    showOn: "both", 
                  
                    buttonText: "종료일",
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    minDate: 0, // 오늘 이전 날짜 선택 불가
                    onClose: function( selectedDate ) {
                        // 종료일(toDate) datepicker가 닫힐때
                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                        $("#fromDate").datepicker( "option", "maxDate", selectedDate );
                    }                
                });
            });


	//필터선택
	 var div2 = document.getElementsByClassName("btnbox2");

function change_btn2(event) {
  //console.log(event.target);
  // console.log(this);
  // 콘솔창을 보면 둘다 동일한 값이 나온다

  console.log(event.target.classList[1]);

  if (event.target.classList[1] === "active2") {
    event.target.classList.remove("active2");
  } else {
    for (var i = 0; i < div2.length; i++) {
      div2[i].classList.remove("active2");
    }

    event.target.classList.add("active2");
  }
}

function init() {
  for (var i = 0; i < div2.length; i++) {
    div2[i].addEventListener("click", change_btn2);
  }
}

init();

//베드필터
           
            $(function() {  
$('#bed_val li').click(function(){
    $(this).find('p').css('background', 'yellow');


  });
});

function change_btn(e) {
	var btns = document.querySelectorAll(".btnbox");
	btns.forEach(function(btn, i) {
		if(e.currentTarget == btn) {
			btn.classList.add("active");
		}
		else {
			btn.classList.remove("active");
		}
	});
	console.log( e.currentTarget );
}


function count(type)  {
  // 결과를 표시할 element
  const resultElement = document.getElementById('result');
  
  // 현재 화면에 표시된 값
  let number = resultElement.innerText;
  
  // 더하기/빼기
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }else if(type === 'minus')  {
    number = parseInt(number) - 1;
  }
  
  // 결과 출력
  resultElement.innerText = number;
}


    </script>
        

    
</head>
<body>
   <header>
        <div class="inner" class="fixedclear">
            <h1><a href="#"><img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/logo.svg" alt="저긴어때"></a></h1>
            <div id="room_val">GH</div>        
            <ul>
                <li>
                    <input type="search" class="search_bar">
                    <a href="#" class="search_btn"><i class="xi-search xi-1x search"></i></a>
                </li>                 <!-- **검색창 구현**-->
                <li><a href="#" id="login">로그인</a></li>                                    <!-- 폰트 스타일 수정-->
            </ul>
            
        </div>
   </header>
                <!-- end header-->
    <section id="body_inner" class="fixedclear">
        <section id="inner" class="fixedclear" >
            <div id="select" class="fixedclear">
              <div id="select_main">
              		<p>지역선택</p>
	              	<div id="reselect_btn">
	              		<img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
	              	</div>
              </div>
               <div class="selectBoth">
                <div id="select_left">
                 <div class="select_under">
                    <div>인기지역</div>
                    <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
                  </div>
                <ul class="open_menu">
                   <li class="c1" onclick="statusChange(this)">부산 전체</li>
                    <li class="c1">전라 전체</li>
                    <li class="c1">제주 전체</li>
                </ul>  
                 <div class="select_under">
                    <div>부산</div>
                    <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
                 </div> 
                 <ul class="open_menu">
                    <li class="c1">부산 전체</li>
                    <li class="c1">해운대/마린시티</li>
                    <li class="c1">광안리/경성대</li>
                    <li class="c1">부산역</li>
                    <li class="c1">송정/기장</li>
                    <li class="c1">자갈치/남포동/영도</li>
                </ul>    
                 <div class="select_under">
                    <div>경기</div>
                    <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
                 </div> 
                 <ul class="open_menu">
                    <li class="c1">경기 전체</li>
                    <li class="c1">수원/화성</li>
                    <li class="c1">남양주/구리/성남/분당</li>
                    <li class="c1">용인/동탄</li>
                    <li class="c1">이천/광주/여주/하남</li>
                    <li class="c1">가평/청평/양평</li>
                    <li class="c1">부천/광명/시흥/안산</li>
                </ul>     
                 <div class="select_under">
                    <div>강원</div>
                    <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
                 </div> 
                 <ul class="open_menu">
                    <li class="c1">강원 전체</li>
                    <li class="c1">속초/양양/고성</li>
                    <li class="c1">강릉</li>
                    <li class="c1">평창/정선/영월</li>
                    <li class="c1">동해/삼척/태백</li>
                </ul>        
                 <div class="select_under">
                    <div>전라</div>
                    <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
                 </div>
                 <ul class="open_menu">
                    <li class="c1">전라 전체</li>
                    <li class="c1">전주/완주</li>
                    <li class="c1">광주/나주</li>
                    <li class="c1">여수</li>
                    <li class="c1">순천/광양/담양/보성/화순</li>
                    <li class="c1">목포/신안/영광/진도/고흥/영암/완도</li>
                </ul>       

              </div>
               <div id="select_right" >
                <div class="select_under">
                    <div>서울</div>
                    <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
                 </div>
                 <ul class="open_menu">
                    <li class="c1">서울 전체</li>
                    <li class="c1">강남/역삼/삼성</li>
                    <li class="c1">서울역/이태원/용산</li>
                    <li class="c1">여의도</li>
                    <li class="c1">영등포역</li>
                    <li class="c1">서초/교대/사당</li>
                    <li class="c1">건대입구/성수/왕십리</li>
                </ul>     
               
                <div class="select_under">
                    <div>제주</div>
                    <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
                 </div> 
                 <ul class="open_menu">
                    <li class="c1">제주 전체</li>
                    <li class="c1">제주시/제주국제공항</li>
                    <li class="c1">서귀포시</li>
                    <li class="c1">애월/한림/협재</li>
                </ul>      
                <div class="select_under">
                    <div>인천</div>
                    <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
                 </div> 
                 <ul class="open_menu">
                    <li class="c1">인천 전체</li>
                    <li class="c1">송도/소래포구</li>
                    <li class="c1">구읍뱃터/월미</li>
                    <li class="c1">인천국제공항/강화/을왕리/영종</li>
                    <li class="c1">청라/계양/부평</li>
                </ul>      
                <div class="select_under">
                    <div>경상</div>
                    <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
                 </div> 
                 <ul class="open_menu">
                    <li class="c1">경상 전체</li>
                    <li class="c1">경주</li>
                    <li class="c1">울산/양산</li>
                    <li class="c1">거제/통영</li>
                    <li class="c1">포항/영덕/울진/청송</li>
                    <li class="c1">창원/마산/진해/김해</li>
                </ul>      
                <div class="select_under">
                    <div>충청</div>
                    <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/down_icon.png">
                 </div> 
                 <ul class="open_menu">
                    <li class="c1">충청 전체</li>
                    <li class="c1">대전/세종</li>
                    <li class="c1">천안/아산/도고</li>
                    <li class="c1">보령/대천/부여/공주/금산</li>
                    <li class="c1">청주/음성/진천</li>
                </ul>      
              </div>
             </div>
            </div>
          <div id="inner1" class="fixedclear">

            <div id="main_filter" class="fixedclear">
                <div class="filter" id="filter_day">
                  	  날짜
                </div>
                
                <form>
                    <input type="text" name="fromDate" id="fromDate">
                    <input type="text" name="toDate" id="toDate">
                </form>
             

                <div class="filter">
                   	 베드 타입
                </div>
                 <ul class="btnsBox">
                    <li class="btnbox active" onclick="change_btn(event)"><a href="#">
                      <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/single_bed.jpg" alt="single_bed">
                      <p>싱글</p></a>
                    </li>
                    <li class="btnbox active" onclick="change_btn(event)"><a href="#">
                      <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/double_bed.jpg" alt="single_bed">
                      <p>더블</p></a>
                    </li>
                    <li class="btnbox active" onclick="change_btn(event)"><a href="#">
                      <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/twin_bed.jpg" alt="single_bed">
                      <p>트윈</p></a>
                    </li>
                    <li class="btnbox active" onclick="change_btn(event)"><a href="#">
                      <img src="<%=request.getContextPath()%>/resources/images/lodgingList_images/ondol_bed.jpg" alt="single_bed">
                      <p>온돌</p></a>
                    </li>    
                 </ul>
                <div class="filter" id="filter_num">
                  	  인원
                    <button type='button' onclick='count("plus")'  value='+' class="updown">+</button>
                    <span id='result'>2</span>
                    <button type='button'  onclick='count("minus")' value='-' class="updown">-</button>
                </div>
                <div id="reset">
                     <button type="button" onclick = "location.href = '#' " name="reset">초기화</button>
                    <button type="button" onclick = "location.href = '#' " name="set">적용</button>
                </div>
                <div class="filter" >
                   	 공용시설
                </div>
                <div class="public_in" class="fixedclear">
                    <ul id="public_left" class="filter_check"> 
                        <li>
                            <input type=checkbox>
                            <label>피트니스</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>사우나</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>레스토랑</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>라운지</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>BBQ</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>공용스파</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>세미나실</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>노래방</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>세탁기</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>탈수기</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>취사가능</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>온천</label>
                        </li>   
                    </ul>

                    <ul id="public_right" class="filter_check">
                        <li>
                            <input type=checkbox>
                            <label>수영장</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>골프장</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>엘레베이터</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>공용PC</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>카페</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>족구장</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>편의점</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>주방/식당</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>건조기</label>
                        </li>  
                        <li>
                            <input type=checkbox>
                            <label>주차장</label>
                        </li>  
                        <li>
                            <input type=checkbox>
                            <label>공용샤워실</label>
                        </li>  
                        <li>
                            <input type=checkbox>
                            <label>스키장</label>
                        </li>  

                    </ul>
                </div>   

                <div id="filter_in" class="filter" >
                   	 객실 내 시설
                </div>
                <div class="public_in"> 
                 <ul id="in_left" class="filter_check" >
                    <li>
                        <input type=checkbox>
                        <label>객실스파</label>
                    </li>   
                    <li>
                        <input type=checkbox>
                        <label>와이파이</label>
                    </li>   
                    <li>
                        <input type=checkbox>
                        <label>TV</label>
                    </li>   
                    <li>
                        <input type=checkbox>
                        <label>냉장고</label>
                    </li>   
                    <li>
                        <input type=checkbox>
                        <label>욕조</label>
                    </li>   
                    <li>
                        <input type=checkbox>
                        <label>다리미</label>
                    </li>   

                 </ul>
                 <ul id="in_right" class="filter_check">
                    <li>
                        <input type=checkbox>
                        <label>미니바</label>
                    </li>   
                    <li>
                        <input type=checkbox>
                        <label>욕실용품</label>
                    </li>   
                    <li>
                        <input type=checkbox>
                        <label>에어컨</label>
                    </li>   
                    <li>
                        <input type=checkbox>
                        <label>객실샤워실</label>
                    </li>   
                    <li>
                        <input type=checkbox>
                        <label>드라이기</label>
                    </li>   
                    <li>
                        <input type=checkbox>
                        <label>전기밥솥</label>
                    </li>   

                 </ul>
                </div>
                <div class="filter" id="odd">
                 	   기타
                </div>
                <div class="public_in"> 
                    <ul id="odd_left" class="filter_check">
                        <li>
                            <input type=checkbox>
                            <label>픽업가능</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>프린터사용</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>개인사물함</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>조식포함</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>발렛파킹</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>반려견동반</label>
                        </li>
 
                     </ul>
                     <ul id="odd_right" class="filter_check">
                        <li>
                            <input type=checkbox>
                            <label>객실내취사</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>짐보관가능</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>무료주차</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>객실내흡연</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>금연</label>
                        </li>   
                        <li>
                            <input type=checkbox>
                            <label>카드결제</label>
                        </li>
 
                     </ul>

                </div>
            </div>
         </div>
         <div id="inner2" >
           <ul id="up">
            <li><button type="button" onclick = "change_btn2(event)" href = '#'  id="up1" class="btnbox2"> 추천순</button></li>
            <li><button type="button" onclick = "change_btn2(event)" href = '#' id="up2" class="btnbox2">가격낮은순</button></li>
            <li><button type="button" onclick = "change_btn2(event)" href = '#' id="up3" class="btnbox2">가격높은순</button></li>
            <li><button type="button" onclick = "change_btn2(event)" href = '#' id="up4" class="btnbox2"> 별점순</button></li>
            <li><button type="button" onclick = "change_btn2(event)" href = '#' id="up5" class="btnbox2">리뷰많은순</button></li>
           </ul>
           <h2>인기추천</h2 >
           <c:forEach var="vo1" items="${list1}" varStatus="status">
           <c:set var="doneLoop" value="false"/>	<!-- break를 위한 boolean변수 doneLoop 선언 -->
          		<c:forEach var="vo2" items="${list2}" varStatus="status">
          			<c:if test="${doneLoop ne true}"> 	<!-- doneLoop 논리값이 반대가 되면 break -->
          			<c:if test="${vo1.lidx == vo2.lidx && vo2.rnum > 0}">
			            <a href="<%=request.getContextPath() %>/lodging/lodgingView.do?lidx=${vo2.lidx}">
			                <div class="imgbor">
			            		<div class="img_left">
			                        <ul>
			                            <li class="up_img">    
			                            	<h3>${vo1.lodgingname}</h3>
			                            	<p>${vo1.satis}</p>
			                            	<p>${vo1.lodgingaddr}</p>
			                            </li>			                        
			                        </ul>
			                    </div>
			                    <div class="img_right">
			                        <div>남은 객실 ${vo2.rnum}개</div>
			                        <div><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo2.rprice}" />원</div>
			                    </div>
			                	<img src="<%=request.getContextPath()%>/resources/images/lodging_images/${vo1.limagename}"> 
			                </div>
			            </a>
				        <c:set var="doneLoop" value="true"/> 	<!-- doneLoop 논리값 반대 설정 = break -->
   					</c:if>
	           		</c:if>	           		
           		</c:forEach>
        	</c:forEach>
           <%-- <%for(LodgingVO vo1 : list1){%>
          		<%for(RoomVO vo2 : list2){%>
          			<%if(vo1.getLidx().equals(vo2.getLidx()) && vo2.getRnum()>0){ %>
			            <a href="<%=request.getContextPath() %>/lodging/lodgingView.do?lidx=<%=vo2.getLidx() %>">
			                <div class="imgbor" >
			                    <div class="img_left">
			                        <ul>
			                            <li class="up_img">    
			                    			<h3> <%=vo1.getLodgingname() %></h3>
			                       			<p><%=vo1.getSatis() %></p>
											<p><%=vo1.getLodgingaddr() %></p>
			                            </li>
			                        </ul>
			                    </div>
			                    <div class="img_right">
			                        <div>남은객실수 <%=vo2.getRnum() %></div>
			                        <div><%=vo2.getRprice() %>원</div>
			                    </div>
			                   <img src="<%=request.getContextPath()%>/resources/images/lodging_images/<%=vo1.getLimagename() %>"> 
			                </div>
			            </a>
	           		<%break; } %>
           		<%} %>
            <%} %> --%>
         </div>


        </section>

        <footer class="fixedclear">
            <div id="foot" >
                
                <br>
                <br>
                <div id="copy">
                    (주)저긴어때 l     
                    대표이사 : 홍이젠 l
                    사업자 등록번호 : 104-14-100400 l
                    메일 : Whatdoyouthink@naver.com <br>
                    주소 : 전라북도 전주시 덕진구 금암1동 667-52 5층 l
                    전화번호 : 063-104-1004 (오전 9시 ~ 오후 5시)<br>
                    <br>
                    Copyright WD COMPANY Corp. All rights reserved.
                    <br>
                    <br>
                    
                </div>
            </div>
        </footer>
    </section>
    </body>


</html>