<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta charset="UTF-8">
	<title>NEIS</title>
	
	<script type="text/javascript" src="/js/care/html5shiv.js"></script>
	<script src="/js/com/code.jquery.com_jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
	<script src="/js/com/code.jquery.com_ui_1.12.1_jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="/js/care/TweenMax.min.js"></script>
	
	<!-- Date&Time -->
	<script src="/js/com/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous"></script>
	<script src="/js/com/ko.min.js" integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ==" crossorigin="anonymous"></script>
	
	<!-- Vue.js -->
	<script src="/js/com/vue@2.6.js"></script>
	<!-- Axios(Ajax) -->
	<script src="/js/com/axios.min.js"></script>
	
	<!-- Websocket -->
	<script src="/js/com/sockjs.min.js" integrity="sha512-5yJ548VSnLflcRxWNqVWYeQZnby8D8fJTmYRLyvs445j1XmzR8cnWi85lcHx3CUEeAX+GrK3TqTfzOO6LKDpdw==" crossorigin="anonymous"></script>
	<script src="/js/com/stomp.js"></script>
	
	<script src="/js/com/lodash.min.js" integrity="sha256-Jvh9+A4HNbbWsWl1Dw7kAzNsU3y8elGIjLnUSUNMtLg=" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/css/care/agency.css">
    <link rel="stylesheet" href="/css/care/fontawesome-free-6.2.0-web/css/all.css" >
	<link rel="stylesheet" href="/css/care/monitor/common.css">
	<link rel="stylesheet" href="/css/care/monitor/carent.css">
	<link rel="stylesheet" href="/css/care/jquery-ui/jquery-ui.css">
	<link rel="stylesheet" href="/css/com/xeicon/xeicon.min.css">
	
	<!-- 스크롤 -->
	<script type="text/javascript" src="/js/care/jquery.mCustomScrollbar.concat.min.js"></script>
	<link rel="stylesheet" href="/css/care/jquery.mCustomScrollbar.css">
	
<!-- 	태크 -->
	<script type="text/javascript" src="/js/monitor/care_main/care_main_tag.js"></script>
	<script type="text/javascript" src="/js/monitor/care_main/care_main_spades_status.js"></script>
	<script type="text/javascript" src="/js/monitor/care_main/care_main_header_status.js"></script>
	
	
	<style>
	    #danger {position: fixed; width: calc(100% - 40px); height: calc(100% - 40px); border: 20px solid #DB4455; z-index: 99998;background: rgba(217, 189, 189, 0.3); animation: danger 1s infinite;-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;}
	    @keyframes danger{
	        0% {opacity: 0.1;}
	        25% {opacity: 1;}
	        50% {opacity: 1;}
	        75% {opacity: 1;}
	        100% {opacity: 0.1;}
	    }
	    .danger {position: absolute; top: 30%; left: 50%;margin-left: -260px; border: 10px solid #DB4455; width: 500px; height: 220px; background: rgba(217, 189, 189, 0.9); border-radius: 20px; z-index: 99999}
	    .danger img {width: 160px; margin: 20px;}
	    .danger h1 {font-size: 60px; line-height: 200px; width: 300px; float: right; text-align: center; color: #DB4455 }
	    #danger_ok {position: absolute; bottom: 10px; width: 100px; height: 30px; line-height: 28px; border: 3px solid #db4455; border-radius: 5px; color: #db4455;}
	</style>  
	
	<script type="text/x-template" id="modal-template">
  	<transition name="modal">
    	<div class="modal-mask">
      		<div class="modal-wrapper">
        		<div class="modal-container">

        			<div class="modal-header">
        				<slot name="header">default header</slot>
		          	</div>

          			<div class="modal-body">
            			<slot name="body">default body</slot>
					</div>
 
        		</div>
      		</div>
    	</div>
  	</transition>
	</script>  
	
</head>
<body>
	<div class="wrap" id="app" v-cloak>
		<header id="header">
			<h1 class="logo">
				<a href="#">
					<img src="/images/care/common/logo3.png" alt="로고" />
				</a>
			</h1>
			<span id="currentTime">{{currentTime}}</span>
			<ul v-if="${member.neisLv == 1 || member.neisLv == 2}" class="gnb">

				<li>
                   <a href="/monitor/rad/index.do">부지환경방사선</a>
				</li>
				<li>
                   <a href="/monitor/weather/index.do">부지기상</a>
				</li>
				<li class="logout">
                    <a href="/logout.do"> LOGOUT </a>
				</li>
			</ul>
			<ul v-else-if="${member.neisLv == 3}" class="gnb2">
				<li class="logout">
                    <a href="/logout.do"> LOGOUT </a>
				</li>
			</ul>
			<ul v-else-if="${member.neisLv == 4}" class="gnb3">
				<li>
                   <a href="javascript:eventRegPopUp()">이벤트 등록</a>
				</li>
				<li>
                   <a href="javascript:errorPopUp()">통신장애 관리</a>
				</li>
				<li class="logout">
                    <a href="/logout.do"> LOGOUT </a>
				</li>
			</ul>
		</header>
		
<script type="text/javascript">

	 function bbsPopUp() {

			//창 크기 지정
			var width = 1500;
			var height = 800;

			//pc화면기준 가운데 정렬
			var left = (window.screen.width / 2) - (width/2); 
			var top = (window.screen.height / 4);

		    //윈도우 속성 지정
			var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		    	
		    //연결하고싶은url 
		    const url = "/com/bbs/BbsIndex.do";

			//등록된 url 및 window 속성 기준으로 팝업창을 연다.
			window.open(url, "bbs popup", windowStatus);

		}
	 
	 function errorPopUp() {

			//창 크기 지정
			var width = 1500;
			var height = 800;

			//pc화면기준 가운데 정렬
			var left = (window.screen.width / 2) - (width/2); 
			var top = (window.screen.height / 4);

		    //윈도우 속성 지정
			var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		    	
		    //연결하고싶은url 
		    const url = "/monitor/errorIndex.do";

			//등록된 url 및 window 속성 기준으로 팝업창을 연다.
			window.open(url, 'error popup', windowStatus);

		}
	 
	 function eventRegPopUp() {

			//창 크기 지정
			var width = 1500;
			var height = 800;

			//pc화면기준 가운데 정렬
			var left = (window.screen.width / 2) - (width/2); 
			var top = (window.screen.height / 4);

		    //윈도우 속성 지정
			var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		    	
		    //연결하고싶은url 
		    const url = "/monitor/eventRegIndex.do";

			//등록된 url 및 window 속성 기준으로 팝업창을 연다.
			window.open(url, "event reg popup", windowStatus);

		}
	 
</script>
		<div id="visual">
			<ul class="atomic_condition">
                <li>
					<div class="ac_round dcTest">
						<img src="/images/care/common/radi_01.png" alt="시운전" />
					</div>
					<span>시운전중</span>
				</li>
				<li>
					<div class="ac_round dcNormal">
						<img src="/images/care/common/radi_01.png" alt="운전" />
					</div>
					<span>정상 운전중</span>
				</li>
				<li>
					<div class="ac_round dcPrvnMntn">
						<img src="/images/care/common/radi_02_color.png" alt="정비" />
					</div>
					<span>예방정비</span>
				</li>
				<li>
					<div class="ac_round dcSuddenStop">
						<img src="/images/care/common/radi_03_color.png" alt="정지" />
					</div>
					<span>불시정지</span>
				</li>
				<li>
					<div class="ac_round dcPerStop">
						<img src="/images/care/common/radi_04_color.png" alt="영구정지" />
					</div>
					<span>영구정지</span>
				</li>
				<li>
					<div class="ac_round dcNormalStop">
						<img src="/images/care/common/radi_06_color.png" alt="통신장애" />
					</div>
					<span>통신장애</span>
				</li>
			</ul>
		</div>
<!--         <marquee id="notice"> -->
<!-- 			<div @click="detailModal()" style="float:left;"> -->
<!--                 <span class="ico">최근공지</span>  <span id="title_txt">{{bbsList.title}}</span> <span id="dtm" class="time">{{moment(bbsList.regDtm).format('YYYY년 MM월 DD일 a hh:mm:ss')}}</span> -->
<!-- 			</div> -->
<!-- 		</marquee> -->
		<div id="content" class="clearfix">
			<template v-for="(npp, index) in nppList">
				<section class="atomic" :class="npp.dNpp">
					<div class="atomic_power">
						<h4 v-html="npp.display"></h4>
						<ul v-if="${member.neisLv == 1 || member.neisLv == 2}">
							<li v-for="hogi in npp.hogiList">
								<a v-if="hogi.hogi == 'KNFC1'" :href="hogi.nowDiv != 'DC_READY' ? '/monitor/detail/' + hogi.hogi.slice(0,-1) + '/' + hogi.dHogi : '#'">
									<p class="now_on">&nbsp;</p>
									<div class="power_bar dcNormal" >
										<img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="width: 36px; animation: loading 0s linear infinite;"/>
										<img v-else src="/images/care/sub/radi_01x29_small.png" alt="방사능이미지" style="width: 36px;"/>
										<div class="inner_bar" style="height:150px;"></div>
									</div>
									<p class="at_name">{{hogi.text}}</p>
									<p class="check_time"><span v-html="hogi.displayTime"></span></p>
								</a>
								<a v-else-if="hogi.hogi == 'HAN1' || hogi.changePiPms == 'N'" :href="hogi.nowDiv != 'DC_READY' ? '/monitor/detail/' + hogi.hogi.slice(0,-1) + '/' + hogi.dHogi : '#'">
									<p v-if="hogi.failureTimeYn == 'Y'" class="now_on">&nbsp;</p>
									<p v-else class="now_on">
									<span v-if="hogi.nowDiv == 'DC_SUDDEN_STOP'" style="color: #e92222;" v-html="hogi.pwr"></span>
									<span v-else v-html="hogi.pwr"></span>
									</p>
									<div class="power_bar" :class="hogi.cssText">
										<img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="width: 36px; animation: loading 0s linear infinite;"/>
										<img v-else :src="hogi.img" alt="방사능이미지" style="width: 36px;"/>
										<div class="inner_bar" v-bind:style="{ height: hogi.height + 'px'}"></div>
									</div>
									<p v-if="hogi.hogi == 'NKRN3'" class="at_name">1호기</p>
									<p v-else-if="hogi.hogi == 'NKRN4'" class="at_name">2호기</p>
									<p v-else class="at_name">{{hogi.text}}</p>
									<p class="check_time"><span v-html="hogi.displayTime"></span></p>
								</a>
								<a v-else-if="hogi.changePiPms == 'Y'" :href="hogi.nowDiv != 'DC_READY' ? '/monitor/detail/' + hogi.hogi.slice(0,-1) + '/' + hogi.dHogi : '#'">
									<p v-if="hogi.failureTimeYn == 'Y'" class="now_on">&nbsp;</p>
									<p v-else class="now_on">
									<span v-if="hogi.nowDiv == 'DC_SUDDEN_STOP'" style="color: #e92222;" v-html="hogi.pwrPi"></span>
									<span v-else v-html="hogi.pwrPi"></span>
									</p>
									<div class="power_bar" :class="hogi.cssText">
										<img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="width: 36px; animation: loading 0s linear infinite;"/>
										<img v-else :src="hogi.imgPi" alt="방사능이미지" style="width: 36px;"/>
										<div class="inner_bar" v-bind:style="{ height: hogi.heightPi + 'px'}"></div>
									</div>
									<p v-if="hogi.hogi == 'NKRN3'" class="at_name">1호기</p>
									<p v-else-if="hogi.hogi == 'NKRN4'" class="at_name">2호기</p>
									<p v-else class="at_name">{{hogi.text}}</p>
									<p class="check_time"><span v-html="hogi.displayTimePi"></span></p>
								</a>
							</li>
						</ul>
						<ul v-if="${member.neisLv == 3 || member.neisLv == 4}" >
							<li v-for="hogi in npp.hogiList" v-on:click="simple_atomic(hogi.hogi, hogi.dHogi )" >
								<a v-if="hogi.hogi == 'KNFC1'">
									<p class="now_on">&nbsp;</p>
									<div class="power_bar dcNormal" >
										<img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="width: 36px; animation: loading 0s linear infinite;"/>
										<img v-else src="/images/care/sub/radi_01x29_small.png" alt="방사능이미지" style="width: 36px;"/>
										<div class="inner_bar" style="height:150px;"></div>
									</div>
									<p class="at_name">{{hogi.text}}</p>
									<p class="check_time"><span v-html="hogi.displayTime"></span></p>
								</a>
								<a v-else-if="hogi.hogi == 'HAN1' || hogi.changePiPms == 'N'">
									<p v-if="hogi.failureTimeYn == 'Y'" class="now_on">&nbsp;</p>
									<p v-else class="now_on">
									<span v-if="hogi.nowDiv == 'DC_SUDDEN_STOP'" style="color: #e92222;" v-html="hogi.pwr"></span>
									<span v-else v-html="hogi.pwr"></span>
									</p>
									<div class="power_bar" :class="hogi.cssText">
										<img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="width: 36px; animation: loading 0s linear infinite;"/>
										<img v-else :src="hogi.img" alt="방사능이미지" style="width: 36px;"/>
										<div class="inner_bar" v-bind:style="{ height: hogi.height + 'px'}"></div>
									</div>
									<p v-if="hogi.hogi == 'NKRN3'" class="at_name">1호기</p>
									<p v-else-if="hogi.hogi == 'NKRN4'" class="at_name">2호기</p>
									<p v-else class="at_name">{{hogi.text}}</p>
									<p class="check_time"><span v-html="hogi.displayTime"></span></p>
								</a>
								<a v-else-if="hogi.changePiPms == 'Y'" >
									<p v-if="hogi.failureTimeYn == 'Y'" class="now_on">&nbsp;</p>
									<p v-else class="now_on">
									<span v-if="hogi.nowDiv == 'DC_SUDDEN_STOP'" style="color: #e92222;" v-html="hogi.pwrPi"></span>
									<span v-else v-html="hogi.pwrPi"></span>
									</p>
									<div class="power_bar" :class="hogi.cssText">
										<img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="width: 36px; animation: loading 0s linear infinite;"/>
										<img v-else :src="hogi.imgPi" alt="방사능이미지" style="width: 36px;"/>
										<div class="inner_bar" v-bind:style="{ height: hogi.heightPi + 'px'}"></div>
									</div>
									<p v-if="hogi.hogi == 'NKRN3'" class="at_name">1호기</p>
									<p v-else-if="hogi.hogi == 'NKRN4'" class="at_name">2호기</p>
									<p v-else class="at_name">{{hogi.text}}</p>
									<p class="check_time"><span v-html="hogi.displayTimePi"></span></p>
								</a>
							</li>
						</ul>
					</div>
				</section>
			</template>
<!-- 			<div class="map_area"> -->
<!-- 				<a href=""  class="marker mp_01"><span>고리</span></a> -->
<!-- 				<a href=""  class="marker mp_02"><span>새울</span></a> -->
<!-- 				<a href=""  class="marker mp_03"><span>한빛</span></a> -->
<!-- 				<a href=""  class="marker mp_04"><span>월성</span></a> -->
<!-- 				<a href=""  class="marker mp_05"><span>한울</span></a> -->
<!-- 				<a href=""  class="marker mp_06"><span>하나로</span></a> -->
<!-- 				<a href=""  class="marker mp_07"><span>KNFC</span></a> -->
<!-- 			</div> -->
			<div class="index_notice">
                <h4><i class="xi-comment-o"></i> 공지사항 <small>notice</small><a href="javascript:bbsPopUp()">more <i class="xi-label"></i></a></h4>
                <table>
                    <colgroup>
                        <col width="400px">
                        <col width="100px">
                    </colgroup>
                    <tr v-for="(bbs, index) in bbsList">
                        <td @click="detailModal(bbs)" >
                        <i v-if="bbs.status == 'Y'" style="color: #51b504;" class="fa-sharp fa-solid fa-n"></i>
                         {{bbs.title}}</td>
                        <td>{{moment(bbs.regDtm).format('YYYY-MM-DD')}}</td>
                    </tr>
                </table>
            </div>
		</div>
<!-- 		<footer id="footer">Copyright KINS. All Rights Reserved.</footer> -->
		
		
		<modal v-if="showDetailModal" @close="showDetailModal = false" v-bind:class="{ pendingRequest: pendingRequest }" class="detailmodal">
            <div slot="header"> 
            	<div class="text_tit" style="vertical-align: middle;">공지사항</div>
            </div> 
            <div slot="body"> 
            <div class="contents enrollment" style="color: black;"> 
                <table class="notice">
                	<colgroup>
    					<col style="width: 90px" />
    					<col style="width: 600px" />
    					
    				</colgroup> 
                    <tr>
                        <th style="vertical-align: middle;">등록일</th>
                        <td>{{moment(bbs.regDtm).format('YYYY년 MM월 DD일 a hh:mm:ss')}}</td>   
                    </tr>
                    <tr>
                        <th style="vertical-align: middle;">제목</th>
                        <td>{{bbs.title}}</td> 
                    </tr>
                    <tr style="min-height: 300px; height: 300px">
                    	<th style="vertical-align: middle;">내용</th> 
                    	<td> 
                    		<div class="viewerScrollbar">
                    		<div id="editSection" class="detailCntn" v-html="bbs.cntn"></div>
                    		</div>
<!--                     		<div class="detailCntn" v-html="bbsList.cntn"></div>  -->
                    	</td>     
                    </tr>
                    <tr v-if="bbs.regId == 'auto'">
                        <th style="vertical-align: middle; height: 170px;">기타</th>
                        <td><textarea readonly style="min-height: 150px;">{{bbs.bbsSubTitl}}</textarea></td>
                    </tr> 
                    <tr v-else>
                        <th style="vertical-align: middle;">첨부파일</th>
                        <td style="padding: 0px">
	                        <div class="fileDiv">
		                        <template v-for="file in file.fileList">
			                       	<span @click="downloadFile(file)">{{file.fileNm}}<a href="#none"><i class="xi-save"></i></a></span>
			                       	<form :id="'file' + file.sn" action="/monitor/detail/fileDownload.do" method="POST">
<!-- 			                        <form id="downloadFile" action="/mgmt/bbs/detail/fileDownload.do" method="POST"> -->
			                       		<input type="hidden" name="artcDiv" v-model="file.artcDiv">
			                       		<input type="hidden" name="artcNo" v-model="file.artcNo">
			                       		<input type="hidden" name="sn" v-model="file.sn">
		    	                    </form>
								</template>
							</div>
						</td>
                    </tr> 
                </table>
             </div>  
	         <div class="btn_list" slot="footer">
				<ul class="right"> 
					<li><button @click="showDetailModal = false;">닫기</button></li>  
				</ul>
			</div> 
		</div>
	</modal>
    
    <div class="relevantAgency_area">
        <!--한빛 6 (정상운전)-->
<!--         <div class="relevantAgency green_line" id="tab-1"> -->
        <div v-for="npp in nppAllList" class="relevantAgency" :class="npp.cssText" :id="'tab-' + npp.hogi">
            <div class="header">
                <div v-if="npp.hogi == 'NKRN3'" class="pile_name">{{npp.title}} UNIT 1
                	<img v-if="header.failureTimeYn == 'Y'" style="margin-top: 12px;" src="/images/care/common/radi_06_color.png">
                    <div class="ac_round" :class="npp.cssText">
                        <img :src="npp.img" alt="방사능이미지">
                    </div>
                </div>
                <div v-else-if="npp.hogi == 'NKRN4'" class="pile_name">{{npp.title}} UNIT 2
                	<img v-if="header.failureTimeYn == 'Y'" style="margin-top: 12px;" src="/images/care/common/radi_06_color.png">
                    <div class="ac_round" :class="npp.cssText">
                        <img :src="npp.img" alt="방사능이미지">
                    </div>
                </div>
                <div v-else class="pile_name">{{npp.title}} UNIT {{npp.dHogi}} 
                	<img v-if="header.failureTimeYn == 'Y'" style="margin-top: 12px;" src="/images/care/common/radi_06_color.png">
                    <div class="ac_round" :class="npp.cssText">
                        <img :src="npp.img" alt="방사능이미지">
                    </div>
                </div>
                <div v-if="header.changePiPms == 'Y'" class="summary">
                    <div v-if="header.failureTimeYn == 'Y'" class="day">{{header.now_workDate_pi}}</div>
                    <div v-else class="day">{{currentTime}}</div>
                    <ul class="summary_txt">
<!--                         <li>운영상태 : <span class="situation green">정상</span></li> -->
                        <li>운영상태 : <span>{{header.displayText}}</span></li>
                        <li>원자력 출력 : <span>{{header.piPwr}} %</span></li>
                        <li>터빈출력 : <span>{{header.piTbn}} MWe</span></li>
<!--                         <li>안전모선 : <span class="situation green">정상</span></li> -->
                    </ul>
                </div>
                <div v-else class="summary">
                    <div v-if="header.failureTimeYn == 'Y'" class="day">{{header.now_workDate}}</div>
                    <div v-else class="day">{{currentTime}}</div>
                    <ul class="summary_txt">
<!--                         <li>운영상태 : <span class="situation green">정상</span></li> -->
                        <li>운영상태 : <span>{{header.displayText}}</span></li>
                        <li>원자력 출력 : <span>{{header.pwr}} %</span></li>
                        <li>터빈출력 : <span>{{header.tbn}} MWe</span></li>
<!--                         <li>안전모선 : <span class="situation green">정상</span></li> -->
                    </ul>
                </div>
                <div class="top_btar">
<!--                     <button type="button" class="on">RMX</button> -->
                    <button v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2' || npp.hogi == 'KRN3' || npp.hogi == 'KRN4'
                    || npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'UCN1' || npp.hogi == 'UCN2'"
                     is="care-main-header-status" name="Rx Trip" :value="tags.RX_TRIP" :taginfo="tagInfos.RX_TRIP">
                    <button v-else is="care-main-header-status" name="Rx Trip" :value="tags.RXTRIP" :taginfo="tagInfos.RXTRIP">
<!--                     <button type="button">LOV</button> -->
<!--                     <button type="button">SI</button> -->
                </div>
                <button type="button" class="close" v-on:click=unsubscribe()><i class="xi-close"></i></button>
            </div>
            
            <div class="contants">
                <div class="left">
                    <div class="box spa_alarm">
                        <p class="tit_mame">필수안전기능</p>
                        <table>
                            <colgroup>
                                <col width="auto">
                                <col width="30px;" style="text-align: center;">
                            </colgroup>
                                <tr v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-spades-status" name="미임계" :value="tags._U8110" :taginfo="tagInfos._U8110"/>
                                <tr v-else-if="npp.hogi == 'KRN2'" is="care-main-spades-status" name="미임계" :value="tags._US1SC" :taginfo="tagInfos._US1SC"/>
                                <tr v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'" is="care-main-spades-status" name="노심 반응도 관리" :value="tags.CFAXNORC" :taginfo="tagInfos.CFAXNORC"/>
                                <tr v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-spades-status" name="반응도 관리" :value="tags._MI_UA_540_01" :taginfo="tagInfos._MI_UA_540_01"/>
                                <tr v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-spades-status" name="미임계" :value="tags._U6110" :taginfo="tagInfos._U6110"/>
                                <tr v-else-if="npp.hogi == 'YGN3' || npp.hogi == 'YGN4' || npp.hogi == 'YGN5' || npp.hogi == 'YGN6' 
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-spades-status" name="노심 반응도 관리" :value="tags.CFAX1TOP" :taginfo="tagInfos.CFAX1TOP"/>
                                <tr v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-spades-status" name="미임계" :value="tags._SPD1001EU" :taginfo="tagInfos._SPD1001EU"/>
                                <tr v-else-if="npp.hogi == 'NUCN1'" is="care-main-spades-status" name="반응도 관리" :value="tags.NO_9_MI_UA_540_01" :taginfo="tagInfos.NO_9_MI_UA_540_01"/>
                                
                                <tr v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-spades-status" name="노심냉각" :value="tags._U8130" :taginfo="tagInfos._U8130"/>
                                <tr v-else-if="npp.hogi == 'KRN2'" is="care-main-spades-status" name="노심냉각" :value="tags._US1CC" :taginfo="tagInfos._US1CC"/>
                                <tr v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'" is="care-main-spades-status" name="노심 열 제거" :value="tags.CFAXNOPC" :taginfo="tagInfos.CFAXNOPC"/>
                                <tr v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-spades-status" name="주요 보조장치 " :value="tags._MI_UA_541_01" :taginfo="tagInfos._MI_UA_541_01"/>
                                <tr v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-spades-status" name="노심냉각" :value="tags._U6130" :taginfo="tagInfos._U6130"/>
                                <tr v-else-if="npp.hogi == 'YGN3' || npp.hogi == 'YGN4' || npp.hogi == 'YGN5' || npp.hogi == 'YGN6'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-spades-status" name="노심 열 제거" :value="tags.CFAX4TOP" :taginfo="tagInfos.CFAX4TOP"/>
                                <tr v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-spades-status" name="노심냉각" :value="tags._SPD1003EU" :taginfo="tagInfos._SPD1003EU"/>
                                <tr v-else-if="npp.hogi == 'NUCN1'" is="care-main-spades-status" name="주요 보조장치" :value="tags.NO_9_MI_UA_541_01" :taginfo="tagInfos.NO_9_MI_UA_541_01"/>
                                
                                <tr v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-spades-status" name="열 제거원" :value="tags._U8150" :taginfo="tagInfos._U8150"/>
                                <tr v-else-if="npp.hogi == 'KRN2'" is="care-main-spades-status" name="열 제거원" :value="tags._US1HS" :taginfo="tagInfos._US1HS"/>
                                <tr v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'" is="care-main-spades-status" name="냉각제 열 제거" :value="tags.CFAXNOCH" :taginfo="tagInfos.CFAXNOCH"/>
                                <tr v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-spades-status" name="냉각제 재고량 관리" :value="tags._MI_UA_542_01" :taginfo="tagInfos._MI_UA_542_01"/>
                                <tr v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-spades-status" name="열 제거원" :value="tags._U6150" :taginfo="tagInfos._U6150"/>
                                <tr v-else-if="npp.hogi == 'YGN3' || npp.hogi == 'YGN4' || npp.hogi == 'YGN5' || npp.hogi == 'YGN6'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-spades-status" name="냉각제 열 제거" :value="tags.CFAX5TOP" :taginfo="tagInfos.CFAX5TOP"/>
                                <tr v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-spades-status" name="열 제거원" :value="tags._SPD1002EU" :taginfo="tagInfos._SPD1002EU"/>
                                <tr v-else-if="npp.hogi == 'NUCN1'" is="care-main-spades-status" name="냉각제 재고량 관리" :value="tags.NO_9_MI_UA_542_01" :taginfo="tagInfos.NO_9_MI_UA_542_01"/>
                                
                                <tr v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-spades-status" name="냉각제 건전성" :value="tags._U8170" :taginfo="tagInfos._U8170"/>
                                <tr v-else-if="npp.hogi == 'KRN2'" is="care-main-spades-status" name="냉각제 건전성" :value="tags._US1IT" :taginfo="tagInfos._US1IT"/>
                                <tr v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'" is="care-main-spades-status" name="냉각제 건전성" :value="tags.CFAXNOIC" :taginfo="tagInfos.CFAXNOIC"/>
                                <tr v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-spades-status" name="냉각제 압력 관리" :value="tags._MI_UA_543_01" :taginfo="tagInfos._MI_UA_543_01"/>
                                <tr v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-spades-status" name="냉각제 건전성" :value="tags._U6170" :taginfo="tagInfos._U6170"/>
                                <tr v-else-if="npp.hogi == 'YGN3' || npp.hogi == 'YGN4' || npp.hogi == 'YGN5' || npp.hogi == 'YGN6'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-spades-status" name="냉각제 건전성" :value="tags.CFAX3TOP" :taginfo="tagInfos.CFAX3TOP"/>
                                <tr v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-spades-status" name="냉각제 건전성" :value="tags._SPD1004EU" :taginfo="tagInfos._SPD1004EU"/>
                                <tr v-else-if="npp.hogi == 'NUCN1'" is="care-main-spades-status" name="냉각제 압력 관리" :value="tags.NO_9_MI_UA_543_01" :taginfo="tagInfos.NO_9_MI_UA_543_01"/>
                                
                                <tr v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-spades-status" name="격납용기 건전성" :value="tags._U8190" :taginfo="tagInfos._U8190"/>
                                <tr v-else-if="npp.hogi == 'KRN2'" is="care-main-spades-status" name="격납용기 건전성" :value="tags._US1CT" :taginfo="tagInfos._US1CT"/>
                                <tr v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'" is="care-main-spades-status" name="냉각제 재고량" :value="tags.CFAXNOMO" :taginfo="tagInfos.CFAXNOMO"/>
                                <tr v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-spades-status" name="노심 열 제거" :value="tags._MI_UA_544_01" :taginfo="tagInfos._MI_UA_544_01"/>
                                <tr v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-spades-status" name="격납용기 건전성" :value="tags._U6190" :taginfo="tagInfos._U6190"/>
                                <tr v-else-if="npp.hogi == 'YGN3' || npp.hogi == 'YGN4' || npp.hogi == 'YGN5' || npp.hogi == 'YGN6'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-spades-status" name="냉각제 재고량" :value="tags.CFAX2TOP" :taginfo="tagInfos.CFAX2TOP"/>
                                <tr v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-spades-status" name="격납용기 건전성" :value="tags._SPD1005EU" :taginfo="tagInfos._SPD1005EU"/>
                                <tr v-else-if="npp.hogi == 'NUCN1'" is="care-main-spades-status" name="노심 열 제거" :value="tags.NO_9_MI_UA_544_01" :taginfo="tagInfos.NO_9_MI_UA_544_01"/>
                                
                                <tr v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-spades-status" name="냉각제 재고량" :value="tags._U8210" :taginfo="tagInfos._U8210"/>
                                <tr v-else-if="npp.hogi == 'KRN2'" is="care-main-spades-status" name="냉각제 재고량" :value="tags._US1IV" :taginfo="tagInfos._US1IV"/>
                                <tr v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'" is="care-main-spades-status" name="격납건물 건전성" :value="tags.CFAXNOCI" :taginfo="tagInfos.CFAXNOCI"/>
                                <tr v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-spades-status" name="냉각제 열제거" :value="tags._MI_UA_545_01" :taginfo="tagInfos._MI_UA_545_01"/>
                                <tr v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-spades-status" name="냉각제 재고량" :value="tags._U6210" :taginfo="tagInfos._U6210"/>
                                <tr v-else-if="npp.hogi == 'YGN3' || npp.hogi == 'YGN4' || npp.hogi == 'YGN5' || npp.hogi == 'YGN6'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-spades-status" name="격납건물 건전성" :value="tags.CFAX7TOP" :taginfo="tagInfos.CFAX7TOP"/>
                                <tr v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-spades-status" name="냉각제 재고량" :value="tags._SPD1006EU" :taginfo="tagInfos._SPD1006EU"/>
                                <tr v-else-if="npp.hogi == 'NUCN1'" is="care-main-spades-status" name="냉각제 열제거" :value="tags.NO_9_MI_UA_545_01" :taginfo="tagInfos.NO_9_MI_UA_545_01"/>
                                
                                <tr v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-spades-status" name="방사능 관리" :value="tags._U8230" :taginfo="tagInfos._U8230"/>
                                <tr v-else-if="npp.hogi == 'KRN2'" is="care-main-spades-status" name="방사능 관리" :value="tags._US1RA" :taginfo="tagInfos._US1RA"/>
                                <tr v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'" is="care-main-spades-status" name="방사능 관리" :value="tags.CFAXNOCT" :taginfo="tagInfos.CFAXNOCT"/>
                                <tr v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-spades-status" name="격납건물 격리" :value="tags._MI_UA_546_01" :taginfo="tagInfos._MI_UA_546_01"/>
                                <tr v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-spades-status" name="방사능 관리" :value="tags._U6230" :taginfo="tagInfos._U6230"/>
                                <tr v-else-if="npp.hogi == 'YGN3' || npp.hogi == 'YGN4' || npp.hogi == 'YGN5' || npp.hogi == 'YGN6'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-spades-status" name="방사능 관리" :value="tags.CFAX8TO" :taginfo="tagInfos.CFAX8TOP"/>
                                <tr v-else-if="npp.hogi == 'NUCN1'" is="care-main-spades-status" name="격납건물 격리" :value="tags.NO_9_MI_UA_546_01" :taginfo="tagInfos.NO_9_MI_UA_546_01"/>
                                
                                <tr v-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-spades-status" name="격납건물 온도 압력 관리" :value="tags._MI_UA_547_01" :taginfo="tagInfos._MI_UA_547_01"/>
                                <tr v-else-if="npp.hogi == 'NUCN1'" is="care-main-spades-status" name="격납건물 온도 압력 관리" :value="tags.NO_9_MI_UA_547_01" :taginfo="tagInfos.NO_9_MI_UA_547_01"/>
                                
                                <tr v-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-spades-status" name="방사능 방출관리" :value="tags._MI_UA_548_01" :taginfo="tagInfos._MI_UA_548_01"/>
                                <tr v-else-if="npp.hogi == 'NUCN1'" is="care-main-spades-status" name="방사능 방출관리" :value="tags.NO_9_MI_UA_548_01" :taginfo="tagInfos.NO_9_MI_UA_548_01"/>
                        </table>
                    </div>
                    
                    <div class="box_weather">
                        <p class="tit_mame">기상</p>
                        <div class="weather">
                            <div class="azimuth">
<!--                                 <i class="fas fa-location-arrow fa-3x" style="transform: rotate(100.5deg);"></i> -->
                                <i class="fas fa-location-arrow fa-3x" :style="getTransformDegree(weather.data['windDirection'])"></i>
                            </div>
                            <div class="weather_right">
                                <table>
                                    <tr>
                                        <th>풍향</th>
                                        <td>{{weather.data['windDirection']}} °({{getWindDirection(weather.data['windDirection'])}})</td>
                                    </tr>
                                    <tr>
                                        <th>풍속</th>
                                        <td>{{weather.data['windSpeed']}} m/s</td>
                                    </tr>
                                    <tr>
                                        <th>일강우량</th>
                                        <td>{{weather.data['rainfall']}} mm</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="box_rad information">
                        <p class="tit_mame">환경방사선</p>
                            <table class="">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr>
                                    <th>지점명</th>
                                    <th>값(μSv/h)</th>
                                    <th>상태</th>
                                </tr>
                            </table>
                        <div v-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4' || npp.hogi == 'NUCN1'" class="b mCscrollbar">
                            <table class="ant2">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr v-for="point in erms">
                                    <td>{{point.pointNm}}</td>
                                    <td>{{point.val.toFixed(2)}}</td>
                                    <td><span :class="point.status == 'Y' ? 'alarm step1' : 'alarm step2'"></span></td>
                                </tr>
                            </table>
                        </div>
                        <div v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" class="c mCscrollbar">
                            <table class="ant2">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr v-for="point in erms">
                                    <td>{{point.pointNm}}</td>
                                    <td>{{point.val.toFixed(2)}}</td>
                                    <td><span :class="point.status == 'Y' ? 'alarm step1' : 'alarm step2'"></span></td>
                                </tr>
                            </table>
                        </div>
                        <div v-else class="a mCscrollbar">
                            <table class="ant2">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr v-for="point in erms">
                                    <td>{{point.pointNm}}</td>
                                    <td>{{point.val.toFixed(2)}}</td>
                                    <td><span :class="point.status == 'Y' ? 'alarm step1' : 'alarm step2'"></span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            
                <div class="right org">
                
                	<div class="alarm step1"><p>정상</p></div>
                	<div class="alarm step2"><p>통신장애</p></div>
                	<div class="alarm step3"><p>주의</p></div>
                	<div class="alarm step4"><p>조치</p></div>
                    <div class="rbox_01">
                        <p>사용후연료저장조</p>
                        <table>
                            <tr>
                                <th>온도</th>
                                <td v-if="npp.hogi == 'KRN1'" is="care-main-tag" :value="tags._T1311A" :taginfo="tagInfos._T1311A"/>
                                <td v-else-if="npp.hogi == 'KRN2'" is="care-main-tag" :value="tags._T1040A" :taginfo="tagInfos._T1040A"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4' || npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" 
                                is="care-main-tag" :value="tags._T2900" :taginfo="tagInfos._T2900"/>
                                <td v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'YGN3' || npp.hogi == 'YGN4'
                                || npp.hogi == 'YGN5' || npp.hogi == 'YGN6'
                                || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4'
                                || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" :value="tags._FCT0007" :taginfo="tagInfos._FCT0007"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags._FC_TY0003B01" :taginfo="tagInfos._FC_TY0003B01">
                                <td v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" :value="tags._PTR032MT" :taginfo="tagInfos._PTR032MT">
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.B_9_463_J_TE_0003B_LCC" :taginfo="tagInfos.B_9_463_J_TE_0003B_LCC">
                            </tr>
                            <tr>
                                <th>깊이</th>
                                <td v-if="npp.hogi == 'KRN1'" is="care-main-tag" :value="tags._L1304A" :taginfo="tagInfos._L1304A"/>
                                <td v-else-if="npp.hogi == 'KRN2'" is="care-main-tag" :value="tags._L1401A" :taginfo="tagInfos._L1401A"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags._T2930" :taginfo="tagInfos._T2930"/>
                                <td v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'"
                                 is="care-main-tag" :value="tags.FCL0001" :taginfo="tagInfos.FCL0001"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.FC_LI0001A" :taginfo="tagInfos.FC_LI0001A">
                                <td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags._L2904" :taginfo="tagInfos._L2904">
                                <td v-else-if="npp.hogi == 'YGN3' || npp.hogi == 'YGN4' || npp.hogi == 'YGN5' || npp.hogi == 'YGN6'
                                || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4'" is="care-main-tag" :value="tags._FCL0001" :taginfo="tagInfos._FCL0001">
                                <td v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" :value="tags.PTR016MN" :taginfo="tagInfos.PTR016MN">
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.A_9_463_J_LIT_0005A_LCC" :taginfo="tagInfos.A_9_463_J_LIT_0005A_LCC">
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_02">
                        <p>격납건물</p>
                        <table>
                            <tr>
                                <th>압력</th>
                                <td v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2'" is="care-main-tag" :value="tags._U1000" :taginfo="tagInfos._U1000"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags.P1000" :taginfo="tagInfos.P1000"/>
                                <td v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'YGN3' || npp.hogi == 'YGN4'
                                || npp.hogi == 'YGN5' || npp.hogi == 'YGN6' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" :value="tags.CMP351A" :taginfo="tagInfos.CMP351A"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags._CX_CFPXCNPA" :taginfo="tagInfos._CX_CFPXCNPA"/>
                                <td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.CV_AIR_P" :taginfo="tagInfos.CV_AIR_P"/>
                                <td v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" :value="tags.ETY101MP" :taginfo="tagInfos.ETY101MP"/>
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.M_9_727_CFPXCNPA_IPS" :taginfo="tagInfos.M_9_727_CFPXCNPA_IPS"/>
                            </tr>
                            <tr>
                                <th>온도</th>
                                <td v-if="npp.hogi == 'KRN1'" is="care-main-tag" :value="tags._U4001" :taginfo="tagInfos._U4001"/>
                                <td v-else-if="npp.hogi == 'KRN2'" is="care-main-tag" :value="tags.CV_TEMP" :taginfo="tagInfos.CV_TEMP"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags._U1001" :taginfo="tagInfos._U1001"/>
                                <td v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'YGN3' || npp.hogi == 'YGN4'
                                || npp.hogi == 'YGN5' || npp.hogi == 'YGN6' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" :value="tags.CMTQAVG" :taginfo="tagInfos.CMTQAVG"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.CX_CFYCMTAV" :taginfo="tagInfos.CX_CFYCMTAV"/>
                                <td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.CV_AIR_T" :taginfo="tagInfos.CV_AIR_T"/>
                                <td v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" :value="tags.ETY001MT" :taginfo="tagInfos.ETY001MT"/>
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.M_9_727_CFYCMTAV_IPS" :taginfo="tagInfos.M_9_727_CFYCMTAV_IPS"/>
                            </tr>
                            <tr v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2' || npp.hogi == 'KRN3' || npp.hogi == 'KRN4'
                            || npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4' || npp.hogi == 'YGN1' || npp.hogi == 'YGN2'
                            || npp.hogi == 'UCN1' || npp.hogi == 'UCN2' || npp.hogi == 'NUCN1'">
								<th>습도</th>
								<td v-if="npp.hogi == 'KRN1'" is="care-main-tag" :value="tags.H0001A" :taginfo="tagInfos.H0001A"/>
								<td v-if="npp.hogi == 'KRN2'" is="care-main-tag" :value="tags.Y4200A" :taginfo="tagInfos.Y4200A"/>
								<td v-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4' || npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.Y5001" :taginfo="tagInfos.Y5001"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4' || npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.HUMID" :taginfo="tagInfos.HUMID"/>
                                <td v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" :value="tags.EVR202MZ" :taginfo="tagInfos.EVR202MZ"/>
							</tr>
                            <tr v-if="!(npp.hogi == 'UCN1' || npp.hogi == 'UCN2')">
                                <th>수소</th>
                                <td v-if="npp.hogi == 'KRN1'" is="care-main-tag" :value="tags.H0011A" :taginfo="tagInfos.H0011A"/>
                                <td v-else-if="npp.hogi == 'KRN2'" is="care-main-tag" :value="tags.Y0011A" :taginfo="tagInfos.Y0011A"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4' || npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.A5011" :taginfo="tagInfos.A5011"/>
                                <td v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'YGN3' || npp.hogi == 'YGN4'
                                || npp.hogi == 'YGN5' || npp.hogi == 'YGN6' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" :value="tags.CMA0005" :taginfo="tagInfos.CMA0005"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.CM_AY0005A02" :taginfo="tagInfos.CM_AY0005A02"/>
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.A_9_763_J_AT_0005A_LCC" :taginfo="tagInfos.A_9_763_J_AT_0005A_LCC"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_03">
                        <p>격납건물 방사능</p>
                        <table>
                            <tr>
                                <th>가스</th>
                                <td v-if="npp.hogi == 'KRN1'" is="care-main-tag" exponential="Y" :value="tags.R0032A"  :taginfo="tagInfos.R0032A" class="mtrv_btn mb_type02"/>
                                <td v-else-if="npp.hogi == 'KRN2'" is="care-main-tag" exponential="Y" :value="tags.R0012A" :taginfo="tagInfos.R0012A" class="mtrv_btn mb_type02"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4' || npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" exponential="Y" :value="tags.R5281" :taginfo="tagInfos.R5281" class="mtrv_btn mb_type02"/>
                                <td class="mtrv_btn mb_type02"v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'YGN3' || npp.hogi == 'YGN4'
                                || npp.hogi == 'YGN5' || npp.hogi == 'YGN6' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" exponential="Y" :value="tags.PRR0039G" :taginfo="tagInfos.PRR0039G" class="mtrv_btn mb_type02"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" exponential="Y" :value="tags.PR_RI0039G" :taginfo="tagInfos.PR_RI0039G" class="mtrv_btn mb_type02"/>
                                <td v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" exponential="Y" :value="tags.KRT009IK" :taginfo="tagInfos.KRT009IK" class="mtrv_btn mb_type02"/>
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" exponential="Y" :value="tags.I_9_761_J_RE_0039AG" :taginfo="tagInfos.I_9_761_J_RE_0039AG" class="mtrv_btn mb_type02"/>
                            </tr>
                            <tr v-if="!(npp.hogi == 'UCN1' || npp.hogi == 'UCN2')">
                                <th>옥소</th>
                                <td v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2'" is="care-main-tag" exponential="Y" :value="tags.R0031A"  :taginfo="tagInfos.R0031A"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4' || npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" exponential="Y" :value="tags.R5282"  :taginfo="tagInfos.R5282"/>
                                <td v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" exponential="Y" :value="tags.PRR0039D"  :taginfo="tagInfos.PRR0039D"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" exponential="Y" :value="tags.PR_RI0039I"  :taginfo="tagInfos.PR_RI0039I"/>
                                <td v-else-if="npp.hogi == 'YGN3' || npp.hogi == 'YGN4' || npp.hogi == 'YGN5' || npp.hogi == 'YGN6'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4'" is="care-main-tag" exponential="Y" :value="tags.PRR0039I"  :taginfo="tagInfos.PRR0039I"/>
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" exponential="Y" :value="tags.I_9_761_J_RE_0039AI"  :taginfo="tagInfos.I_9_761_J_RE_0039AI"/>
                            </tr>
                            <tr>
                                <th>입자</th>
                                <td v-if="npp.hogi == 'KRN1'" is="care-main-tag" exponential="Y" :value="tags.R0030A" :taginfo="tagInfos.R0030A"/>
                                <td v-else-if="npp.hogi == 'KRN2'" is="care-main-tag" exponential="Y" :value="tags.R0011A" :taginfo="tagInfos.R0011A"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4' || npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" exponential="Y" :value="tags.R5280" :taginfo="tagInfos.R5280"/>
                                <td v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'YGN3' || npp.hogi == 'YGN4'
                                || npp.hogi == 'YGN5' || npp.hogi == 'YGN6' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" exponential="Y" :value="tags.PRR0039P" :taginfo="tagInfos.PRR0039P"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" exponential="Y" :value="tags.PR_RI0039P" :taginfo="tagInfos.PR_RI0039P"/>
                                <td v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" exponential="Y" :value="tags.KRT008IK" :taginfo="tagInfos.KRT008IK"/>
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" exponential="Y" :value="tags.I_9_761_J_RE_0039AP" :taginfo="tagInfos.I_9_761_J_RE_0039AP"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_04">
                        <p>가압기</p>
                        <table>
                            <tr>
                                <th>수위</th>
                                <td v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2'" is="care-main-tag" :value="tags._U0483" :taginfo="tagInfos._U0483"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags.L0480" :taginfo="tagInfos.L0480"/>
                                <td v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'YGN3' || npp.hogi == 'YGN4'
                                || npp.hogi == 'YGN5' || npp.hogi == 'YGN6' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" :value="tags.RCL110XJ" :taginfo="tagInfos.RCL110XJ"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.RC_LI0110A02" :taginfo="tagInfos.RC_LI0110A02"/>
                                <td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.PZR_L" :taginfo="tagInfos.PZR_L"/>
                                <td v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" :value="tags._RCP007MN" :taginfo="tagInfos._RCP007MN"/>
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.M_9_431_J_LI_0110A_IPS" :taginfo="tagInfos.M_9_431_J_LI_0110A_IPS"/>
                            </tr>
                            <tr>
                                <th>압력</th>
                                <td v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2'" is="care-main-tag" :value="tags._U0482" :taginfo="tagInfos._U0482"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags.P0480" :taginfo="tagInfos.P0480"/>
                                <td v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'YGN3' || npp.hogi == 'YGN4'
                                || npp.hogi == 'YGN5' || npp.hogi == 'YGN6' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" :value="tags.RCP102A" :taginfo="tagInfos.RCP102A"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.RC_PT0100X_TXS" :taginfo="tagInfos.RC_PT0100X_TXS"/>
                                <td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.PZR_P" :taginfo="tagInfos.PZR_P"/>
                                <td v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" :value="tags.RCP005MP" :taginfo="tagInfos.RCP005MP"/>
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.M_9_431_J_PI_0100X_IPS" :taginfo="tagInfos.M_9_431_J_PI_0100X_IPS"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_05">
                        <p>증기발생기</p>
                        <table v-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'YGN3' || npp.hogi == 'YGN4'
                        || npp.hogi == 'YGN5' || npp.hogi == 'YGN6' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                        || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'
                        || npp.hogi == 'NUCN1' || npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'">
                            <tr>
								<th>S/G</th>
								<th>수위(WR)</th>
								<th>수위(NR)</th>
								<th>압력</th>
							</tr>
							<tr>
								<th>1</th>
								<td v-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.A_9_541_LT1113A_IPS" :taginfo="tagInfos.A_9_541_LT1113A_IPS"/>
								<td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.FW_LT1113A" :taginfo="tagInfos.FW_LT1113A"/>
								<td v-else is="care-main-tag" :value="tags.FWL1113A" :taginfo="tagInfos.FWL1113A"/>
								<td v-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.A_9_541_LT1114A_IPS" :taginfo="tagInfos.A_9_541_LT1114A_IPS"/>
								<td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags._FW_LT1114A" :taginfo="tagInfos._FW_LT1114A"/>
								<td v-else is="care-main-tag" :value="tags._FWL1114A" :taginfo="tagInfos._FWL1114A"/>
								<td v-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.A_9_521_PT1013A_IPS" :taginfo="tagInfos.A_9_521_PT1013A_IPS"/>
								<td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.MS_PT1013A01" :taginfo="tagInfos.MS_PT1013A01"/>
								<td v-else is="care-main-tag" :value="tags.MSP1013A" :taginfo="tagInfos.MSP1013A"/>
							</tr>
							<tr>
								<th>2</th>
								<td v-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.A_9_541_LT1123A_IPS" :taginfo="tagInfos.A_9_541_LT1123A_IPS"/>
								<td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.FW_LT1123A" :taginfo="tagInfos.FW_LT1123A"/>
								<td v-else is="care-main-tag" :value="tags.FWL1123A" :taginfo="tagInfos.FWL1123A"/>
								<td v-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.A_9_541_LT1124A_IPS" :taginfo="tagInfos.A_9_541_LT1124A_IPS"/>
								<td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags._FW_LT1124A" :taginfo="tagInfos._FW_LT1124A"/>
								<td v-else is="care-main-tag" :value="tags._FWL1124A" :taginfo="tagInfos._FWL1124A"/>
								<td v-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.A_9_521_PT1023A_IPS" :taginfo="tagInfos.A_9_521_PT1023A_IPS"/>
								<td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.MS_PT1023A01" :taginfo="tagInfos.MS_PT1023A01"/>
								<td v-else is="care-main-tag" :value="tags.MSP1023A" :taginfo="tagInfos.MSP1023A"/>
							</tr>
                        </table>
                        <table v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4' || npp.hogi == 'YGN1' || npp.hogi == 'YGN2'">
                            <tr>
								<th>S/G</th>
								<th>수위</th>
								<th>압력</th>
							</tr>
							<tr>
								<th>A</th>
								<td v-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags.L0400" :taginfo="tagInfos.L0400"/>
								<td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.A" :taginfo="tagInfos.A"/>
								<td v-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags._P0400" :taginfo="tagInfos._P0400"/>
								<td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.A" :taginfo="tagInfos.A"/>
							</tr>
							<tr>
								<th>B</th>
								<td v-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags.L0420" :taginfo="tagInfos.L0420"/>
								<td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.A" :taginfo="tagInfos.A"/>
								<td v-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags._P0420" :taginfo="tagInfos._P0420"/>
								<td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.A" :taginfo="tagInfos.A"/>
							</tr>
							<tr>
								<th>C</th>
								<td v-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags.L0440" :taginfo="tagInfos.L0440"/>
								<td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.A" :taginfo="tagInfos.A"/>
								<td v-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4'" is="care-main-tag" :value="tags._P0440" :taginfo="tagInfos._P0440"/>
								<td v-else-if="npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.A" :taginfo="tagInfos.A"/>
							</tr>
                        </table>
                        <table v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'">
                            <tr>
								<th>S/G</th>
								<th>수위</th>
								<th>압력</th>
							</tr>
							<tr>
								<th>1</th>
								<td is="care-main-tag" :value="tags.ARE010MN" :taginfo="tagInfos.ARE010MN"/>
								<td is="care-main-tag" :value="tags.VVP007MP" :taginfo="tagInfos.VVP007MP"/>
							</tr>
							<tr>
								<th>2</th>
								<td is="care-main-tag" :value="tags.ARE020MN" :taginfo="tagInfos.ARE020MN"/>
								<td is="care-main-tag" :value="tags.VVP008MP" :taginfo="tagInfos.VVP008MP"/>
							</tr>
							<tr>
								<th>3</th>
								<td is="care-main-tag" :value="tags.ARE030MN" :taginfo="tagInfos.ARE030MN"/>
								<td is="care-main-tag" :value="tags.VVP009MP" :taginfo="tagInfos.VVP009MP"/>
							</tr>
                        </table>
                        <table v-else>
                            <tr>
								<th>S/G</th>
								<th>수위</th>
								<th>압력</th>
							</tr>
							<tr>
								<th>A</th>
								<td v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2'" is="care-main-tag" :value="tags._U0415" :taginfo="tagInfos._U0415"/>
								<td v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2'" is="care-main-tag" :value="tags._U0414" :taginfo="tagInfos._U0414"/>
							</tr>
							<tr>
								<th>B</th>
								<td v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2'" is="care-main-tag" :value="tags._U0435" :taginfo="tagInfos._U0435"/>
								<td v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2'" is="care-main-tag" :value="tags._U0434" :taginfo="tagInfos._U0434"/>
							</tr>
                        </table>
                        
                    </div>
                    
                    <div class="rbox_06">
                        <p></p>
                        <table>
                            <tr>
                                <th>노심출력</th>
                                <td v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2'" is="care-main-tag" :value="tags.N0049A" :taginfo="tagInfos.N0049A"/>
                                <td v-else-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4' || npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.N0049" :taginfo="tagInfos.N0049"/>
                                <td v-else-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'" is="care-main-tag" :value="tags.CIJXBSCL" :taginfo="tagInfos.CIJXBSCL"/>
                                <td v-else-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.CX_CIJXBSCL" :taginfo="tagInfos.CX_CIJXBSCL"/>
                                <td v-else-if="npp.hogi == 'YGN3' || npp.hogi == 'YGN4' || npp.hogi == 'YGN5' || npp.hogi == 'YGN6'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" :value="tags.CTNJ" :taginfo="tagInfos.CTNJ"/>
                                <td v-else-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" :value="tags.RPN413EU" :taginfo="tagInfos.RPN413EU"/>
                                <td v-else-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.M_9_727_CIJXBSCL_IPS" :taginfo="tagInfos.M_9_727_CIJXBSCL_IPS"/>
                            </tr>
                            
                        </table>
                    </div>
                    
                    <div class="rbox_07">
                        <p>GEN발전기</p>
                        <table>
                            <tr>
                                <td v-if="npp.hogi == 'KRN1' || npp.hogi == 'KRN2'" is="care-main-tag" :value="tags.Q0340A" :taginfo="tagInfos.Q0340A"/>
                                <td v-if="npp.hogi == 'KRN3' || npp.hogi == 'KRN4' || npp.hogi == 'YGN1' || npp.hogi == 'YGN2'" is="care-main-tag" :value="tags.Q2813" :taginfo="tagInfos.Q2813"/>
                                <td v-if="npp.hogi == 'NKRN1' || npp.hogi == 'NKRN2' || npp.hogi == 'YGN3' || npp.hogi == 'YGN4'
                                || npp.hogi == 'YGN5' || npp.hogi == 'YGN6' || npp.hogi == 'NWSN1' || npp.hogi == 'NWSN2'
                                || npp.hogi == 'UCN3' || npp.hogi == 'UCN4' || npp.hogi == 'UCN5' || npp.hogi == 'UCN6'" is="care-main-tag" :value="tags.MPJ0001" :taginfo="tagInfos.MPJ0001"/>
                                <td v-if="npp.hogi == 'NKRN3' || npp.hogi == 'NKRN4'" is="care-main-tag" :value="tags.MP_JI0003" :taginfo="tagInfos.MP_JI0003"/>
                                <td v-if="npp.hogi == 'UCN1' || npp.hogi == 'UCN2'" is="care-main-tag" :value="tags.KKO003EU" :taginfo="tagInfos.KKO003EU"/>
                                <td v-if="npp.hogi == 'NUCN1'" is="care-main-tag" :value="tags.M_9_811_J_JI_0003_IPS" :taginfo="tagInfos.M_9_811_J_JI_0003_IPS"/>
                            </tr>
                        </table>
                    </div>
                
                    <div class="rbox_08">
                        <p>재장전수 저장탱크</p>
                    </div>
                    
                    <div class="rbox_09">
                        <p>격납용기살수펌프</p>
                    </div>
                    
                    <div class="rbox_10">
                        <p>안전주입펌프</p>
                    </div>
                
                    <div class="rbox_11">
                        <p>정지냉각펌프</p>
                    </div>
                    
<!--                     <div class="rbox_12"> -->
<!--                         <p>원자로보충수탱크<br>(IRWST)</p> -->
<!--                     </div> -->
                    
                    <div class="rbox_13">
                        <p>안전주입탱크</p>
                    </div>
                    
                    <div class="rbox_14">
                        <p>C/L 온도</p>
                    </div>
                    
                    <div class="rbox_15">
                        <p>원자로 냉각재 펌프</p>
                    </div>
                    
<!--                     <div class="rbox_16"> -->
<!--                         <p>화학 및 체적제어계통<br>CVCS</p> -->
<!--                     </div> -->
                    
                    <div class="rbox_17">
                        <p>주변압기</p>
                    </div>
                    
                    <div class="rbox_18">
                        <p>터빈</p>
                    </div>
                    
                    <div class="rbox_19">
                        <p>복수기</p>
                    </div>
                    
                    <div class="rbox_20">
                        <p>순환수펌프</p>
                    </div>
                    
                    <div class="rbox_21">
                        <p>주급수펌프</p>
                    </div>
                    
                    <div class="rbox_22">
                        <p>복수펌프</p>
                    </div>
                    
                    <div class="rbox_23">
                        <p>보조급수펌프</p>
                    </div>
                    
                    <div class="rbox_24">
                        <p>보조급수<br>저장탱크</p>
                    </div>
                    
                    <div class="rbox_25">
                        <p>해수</p>
                    </div>
                
                </div>
            </div>
            
            <div class="footer">
                <ul>
                    <li v-for="(npp, index) in nppFooterList" class="section">
                        <p class="name">{{npp.display}}</p>
                        <ul>
                            <li v-for="hogi in npp.hogiList" v-on:click="simple_atomic(hogi.hogi, hogi.dHogi )">
                                <div v-if="hogi.hogi == 'KNFC1'" class="ac_round dcNormal">
                                    <img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="animation: loading 0s linear infinite;">
                                    <img v-else src="/images/care/common/radi_01.png" alt="방사능이미지">
                                </div>
                                <div v-else class="ac_round" :class="hogi.cssText">
                                    <img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="animation: loading 0s linear infinite;">
                                    <img v-else :src="hogi.img" alt="방사능이미지">
                                </div>
                                <span v-if="hogi.hogi == 'NKRN3'" class="text">1호기</span>
                                <span v-else-if="hogi.hogi == 'NKRN4'" class="text">2호기</span>
                                <span class="text">{{hogi.text}}</span>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        
         <!--고리1 (영구정지)-->
        <div v-for="npp in nppKrn1List" class="relevantAgency" id="tab-KRN1">
            <div class="header">
                <div class="pile_name">{{npp.title}} UNIT {{npp.dHogi}}
                	<img v-if="header.failureTimeYn == 'Y'" style="margin-top: 12px;" src="/images/care/common/radi_06_color.png">
                    <div class="ac_round" :class="npp.cssText">
                        <img :src="npp.img" alt="방사능이미지">
                    </div>
                </div>
                <div v-if="header.changePiPms == 'Y'" class="summary">
                    <div v-if="header.failureTimeYn == 'Y'" class="day">{{header.now_workDate_pi}}</div>
                    <div v-else class="day">{{currentTime}}</div>
                    <ul class="summary_txt">
<!--                         <li>운영상태 : <span class="situation green">정상</span></li> -->
                        <li>운영상태 : <span>{{header.displayText}}</span></li>
<!--                         <li>원자력 출력 : <span>{{header.piPwr}} %</span></li> -->
<!--                         <li>터빈출력 : <span>{{header.piTbn}} MWe</span></li> -->
                        <li>원자력 출력 : <span>영구정지</span></li>
                        <li>터빈출력 : <span>영구정지</span></li>
<!--                         <li>안전모선 : <span class="situation green">정상</span></li> -->
                    </ul>
                </div>
                <div v-else class="summary">
                    <div v-if="header.failureTimeYn == 'Y'" class="day">{{header.now_workDate}}</div>
                    <div v-else class="day">{{currentTime}}</div>
                    <ul class="summary_txt">
<!--                         <li>운영상태 : <span class="situation green">정상</span></li> -->
                        <li>운영상태 : <span>{{header.displayText}}</span></li>
<!--                         <li>원자력 출력 : <span>{{header.pwr}} %</span></li> -->
<!--                         <li>터빈출력 : <span>{{header.tbn}} MWe</span></li> -->
						<li>원자력 출력 : <span>영구정지</span></li>
                        <li>터빈출력 : <span>영구정지</span></li>
<!--                         <li>안전모선 : <span class="situation green">정상</span></li> -->
                    </ul>
                </div>
                <button type="button" class="close" v-on:click=unsubscribe()><i class="xi-close"></i></button>
            </div>
            
            <div class="contants">
                <div class="left">
                    
                    <div class="box_weather">
                        <p class="tit_mame">기상정보</p>
                        <div class="weather">
                            <div class="azimuth">
                                <i class="fas fa-location-arrow fa-3x" :style="getTransformDegree(weather.data['windDirection'])"></i>
                            </div>
                            <div class="weather_right">
                                <table>
                                    <tr>
                                        <th>풍향</th>
                                         <td>{{weather.data['windDirection']}} °({{getWindDirection(weather.data['windDirection'])}})</td>
                                    </tr>
                                    <tr>
                                        <th>풍속</th>
                                        <td>{{weather.data['windSpeed']}} m/s</td>
                                    </tr>
                                    <tr>
                                        <th>일강우량</th>
                                        <td>{{weather.data['rainfall']}} mm</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="box_rad_wsn1 information">
                        <p class="tit_mame">환경방사능정보</p>
                            <table class="">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr>
                                    <th>지점명</th>
                                    <th>값(μSv/h)</th>
                                    <th>상태</th>
                                </tr>
                            </table>
                        <div class="mCscrollbar">
                            <table class="ant2">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr v-for="point in erms">
                                    <td>{{point.pointNm}}</td>
                                    <td>{{point.val.toFixed(2)}}</td>
                                    <td><span :class="point.status == 'Y' ? 'alarm step1' : 'alarm step2'"></span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            
            	<div class="trend_area" id="d1">
							<div class="ta_btn">
								<h3 class="ta_title"><i class="xi-spinner-4 xi-spin"></i><span id="ta_title"></span></h3>
								<div class="btn_g_ta">
									<!-- <button class="ta_btns bt2" @click="openTrend"><span>자세히</span><i class="xi-eye-o"></i></button> -->
                                    <button class="ta_btns" id="btn_x"><i class="xi-close"></i></button>
								</div>
							</div>
							<div class="ta_graph">
								<div id="tag_real_trend_container"></div>
							</div>
							<div class="window_controler" id="hr"></div>
						</div>

                <div class="right kori_No1">
                    <div class="alarm step1"><p>정상</p></div>
                	<div class="alarm step2"><p>통신장애</p></div>
                	<div class="alarm step3"><p>주의</p></div>
                	<div class="alarm step4"><p>조치</p></div>
                    
                    <div class="rbox_01">
                        <table>
                            <tr>
                                <th>깊이</th>
                                <td is="care-main-tag" :value="tags._L1304A" :taginfo="tagInfos._L1304A"/>
                            </tr>
                            <tr>
                                <th>온도</th>
                                <td is="care-main-tag" :value="tags._T1311A" :taginfo="tagInfos._T1311A"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_02">
                        <table>
                            <tr>
                                <th>A</th>
                                <td is="care-main-tag" :value="tags.A" :taginfo="tagInfos.A"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_03">
                        <table>
                            <tr>
                                <th>F</th>
                                <td is="care-main-tag" :value="tags.A" :taginfo="tagInfos.A"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_04">
                        <p>Sea Water</p>
                        <table>
                            <tr>
                                <th>온도</th>
                                <td is="care-main-tag" :value="tags._T3754A" :taginfo="tagInfos._T3754A"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_05">
                        <p>Spent Fuel Bay</p>
                    </div>
                
                </div>
            </div>
            
           <div class="footer">
                <ul>
                    <li v-for="(npp, index) in nppFooterList" class="section">
                        <p class="name">{{npp.display}}</p>
                        <ul>
                            <li v-for="hogi in npp.hogiList"  v-on:click="simple_atomic(hogi.hogi, hogi.dHogi )">
                                <div v-if="hogi.hogi == 'KNFC1'" class="ac_round dcNormal">
                                    <img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="animation: loading 0s linear infinite;">
                                    <img v-else src="/images/care/common/radi_01.png" alt="방사능이미지">
                                </div>
                                <div v-else class="ac_round" :class="hogi.cssText">
                                    <img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="animation: loading 0s linear infinite;">
                                    <img v-else :src="hogi.img" alt="방사능이미지">
                                </div>
                                <span v-if="hogi.hogi == 'NKRN3'" class="text">1호기</span>
                                <span v-else-if="hogi.hogi == 'NKRN4'" class="text">2호기</span>
                                <span class="text">{{hogi.text}}</span>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        
        <!--월성1 (영구정지)-->
        <div v-for="npp in nppWsn1List" class="relevantAgency" id="tab-WSN1">
            <div class="header">
                <div class="pile_name">{{npp.title}} UNIT {{npp.dHogi}}
                	<img v-if="header.failureTimeYn == 'Y'" style="margin-top: 12px;" src="/images/care/common/radi_06_color.png">
                    <div class="ac_round" :class="npp.cssText">
                        <img :src="npp.img" alt="방사능이미지">
                    </div>
                </div>
                <div v-if="header.changePiPms == 'Y'" class="summary">
                    <div v-if="header.failureTimeYn == 'Y'" class="day">{{header.now_workDate_pi}}</div>
                    <div v-else class="day">{{currentTime}}</div>
                    <ul class="summary_txt">
<!--                         <li>운영상태 : <span class="situation green">정상</span></li> -->
                        <li>운영상태 : <span>{{header.displayText}}</span></li>
                        <li>원자력 출력 : <span>영구정지</span></li>
                        <li>터빈출력 : <span>영구정지</span></li>
<!--                         <li>원자력 출력 : <span>{{header.piPwr}} %</span></li> -->
<!--                         <li>터빈출력 : <span>{{header.piTbn}} MWe</span></li> -->
<!--                         <li>안전모선 : <span class="situation green">정상</span></li> -->
                    </ul>
                </div>
                <div v-else class="summary">
                    <div v-if="header.failureTimeYn == 'Y'" class="day">{{header.now_workDate}}</div>
                    <div v-else class="day">{{currentTime}}</div>
                    <ul class="summary_txt">
<!--                         <li>운영상태 : <span class="situation green">정상</span></li> -->
                        <li>운영상태 : <span>{{header.displayText}}</span></li>
                        <li>원자력 출력 : <span>영구정지</span></li>
                        <li>터빈출력 : <span>영구정지</span></li>
<!--                         <li>원자력 출력 : <span>{{header.pwr}} %</span></li> -->
<!--                         <li>터빈출력 : <span>{{header.tbn}} MWe</span></li> -->
<!--                         <li>안전모선 : <span class="situation green">정상</span></li> -->
                    </ul>
                </div>
                <button type="button" class="close" v-on:click=unsubscribe()><i class="xi-close"></i></button>
            </div>
            
            <div class="contants">
                <div class="left">
                    
                    <div class="box_weather">
                        <p class="tit_mame">기상정보</p>
                        <div class="weather">
                            <div class="azimuth">
                                <i class="fas fa-location-arrow fa-3x" :style="getTransformDegree(weather.data['windDirection'])"></i>
                            </div>
                            <div class="weather_right">
                                <table>
                                    <tr>
                                        <th>풍향</th>
                                         <td>{{weather.data['windDirection']}} °({{getWindDirection(weather.data['windDirection'])}})</td>
                                    </tr>
                                    <tr>
                                        <th>풍속</th>
                                        <td>{{weather.data['windSpeed']}} m/s</td>
                                    </tr>
                                    <tr>
                                        <th>일강우량</th>
                                        <td>{{weather.data['rainfall']}} mm</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="box_rad_wsn1 information">
                        <p class="tit_mame">환경방사능정보</p>
                            <table class="">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr>
                                    <th>지점명</th>
                                    <th>값(μSv/h)</th>
                                    <th>상태</th>
                                </tr>
                            </table>
                        <div class="mCscrollbar">
                            <table class="ant2">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr v-for="point in erms">
                                    <td>{{point.pointNm}}</td>
                                    <td>{{point.val.toFixed(2)}}</td>
                                    <td><span :class="point.status == 'Y' ? 'alarm step1' : 'alarm step2'"></span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            
                <div class="right wos_No1">
                    <div class="alarm step1"><p>정상</p></div>
                	<div class="alarm step2"><p>통신장애</p></div>
                	<div class="alarm step3"><p>주의</p></div>
                	<div class="alarm step4"><p>조치</p></div>
                    
                    <div class="rbox_01">
                        <table>
                            <tr>
                                <th>깊이</th>
                                <td is="care-main-tag" :value="tags.AI0640" :taginfo="tagInfos.AI0640"/>
                            </tr>
                            <tr>
                                <th>온도</th>
                                <td is="care-main-tag" :value="tags.AI0642" :taginfo="tagInfos.AI0642"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_02">
                        <table>
                            <tr>
                                <th>A</th>
                                <td is="care-main-tag" :value="tags.AI1011" :taginfo="tagInfos.AI1011"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_03">
                        <table>
                            <tr>
                                <th>F</th>
                                <td is="care-main-tag" :value="tags.AI2644" :taginfo="tagInfos.AI2644"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_04">
                        <p>Sea Water</p>
                        <table>
                            <tr>
                                <th>온도</th>
                                <td is="care-main-tag" :value="tags.AI3170" :taginfo="tagInfos.AI3170"/>
                            </tr>
                            <tr>
                                <th>깊이</th>
                                <td is="care-main-tag" :value="tags.AI2737_UNION" :taginfo="tagInfos.AI2737_UNION"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_05">
                        <p>Spent Fuel Bay</p>
                    </div>
                
                </div>
            </div>
            
           <div class="footer">
                <ul>
                    <li v-for="(npp, index) in nppFooterList" class="section">
                        <p class="name">{{npp.display}}</p>
                        <ul>
                            <li v-for="hogi in npp.hogiList"  v-on:click="simple_atomic(hogi.hogi, hogi.dHogi )">
                                <div v-if="hogi.hogi == 'KNFC1'" class="ac_round dcNormal">
                                    <img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="animation: loading 0s linear infinite;">
                                    <img v-else src="/images/care/common/radi_01.png" alt="방사능이미지">
                                </div>
                                <div v-else class="ac_round" :class="hogi.cssText">
                                    <img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="animation: loading 0s linear infinite;">
                                    <img v-else :src="hogi.img" alt="방사능이미지">
                                </div>
                                <span v-if="hogi.hogi == 'NKRN3'" class="text">1호기</span>
                                <span v-else-if="hogi.hogi == 'NKRN4'" class="text">2호기</span>
                                <span class="text">{{hogi.text}}</span>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        
        <!--월성-->
        <div v-for="npp in nppWsnList" class="relevantAgency" :class="npp.cssText" :id="'tab-' + npp.hogi">
            <div class="header">
                <div class="pile_name">{{npp.title}} UNIT {{npp.dHogi}}
                	<img v-if="header.failureTimeYn == 'Y'" style="margin-top: 12px;" src="/images/care/common/radi_06_color.png">
                    <div class="ac_round" :class="npp.cssText">
                        <img :src="npp.img" alt="방사능이미지">
                    </div>
                </div>
                <div v-if="header.changePiPms == 'Y'" class="summary">
                    <div v-if="header.failureTimeYn == 'Y'" class="day">{{header.now_workDate_pi}}</div>
                    <div v-else class="day">{{currentTime}}</div>
                    <ul class="summary_txt">
<!--                         <li>운영상태 : <span class="situation green">정상</span></li> -->
                        <li>운영상태 : <span>{{header.displayText}}</span></li>
                        <li>원자력 출력 : <span>{{header.piPwr}} %</span></li>
                        <li>터빈출력 : <span>{{header.piTbn}} MWe</span></li>
<!--                         <li>안전모선 : <span class="situation green">정상</span></li> -->
                    </ul>
                </div>
                <div v-else class="summary">
                    <div v-if="header.failureTimeYn == 'Y'" class="day">{{header.now_workDate}}</div>
                    <div v-else class="day">{{currentTime}}</div>
                    <ul class="summary_txt">
<!--                         <li>운영상태 : <span class="situation green">정상</span></li> -->
                        <li>운영상태 : <span>{{header.displayText}}</span></li>
                        <li>원자력 출력 : <span>{{header.pwr}} %</span></li>
                        <li>터빈출력 : <span>{{header.tbn}} MWe</span></li>
<!--                         <li>안전모선 : <span class="situation green">정상</span></li> -->
                    </ul>
                </div>
                <div class="top_btar">
                    <button is="care-main-header-status" name="Rx Trip" :value="tags.RX_TRIP" :taginfo="tagInfos.RX_TRIP">
                </div>
                <button type="button" class="close" v-on:click=unsubscribe()><i class="xi-close"></i></button>
            </div>
            
            <div class="contants">
                <div class="left">
                    <div class="box spa_alarm">
                        <p class="tit_mame">필수안전기능</p>
                        <table>
                            <colgroup>
                                <col width="auto">
                                <col width="30px;" style="text-align: center;">
                            </colgroup>
                            <tr is="care-main-spades-status" name="반응도제어" :value="tags.A" :taginfo="tagInfos.A"/>
                            <tr is="care-main-spades-status" name="필수전원" :value="tags.A" :taginfo="tagInfos.A"/>
                            <tr is="care-main-spades-status" name="열수송계통 건전성" :value="tags.A" :taginfo="tagInfos.A"/>
                            <tr is="care-main-spades-status" name="열제거원" :value="tags.A" :taginfo="tagInfos.A"/>
                            <tr is="care-main-spades-status" name="방사능관리" :value="tags.A" :taginfo="tagInfos.A"/>
                        </table>
                    </div>
                    
                    <div class="box_weather">
                        <p class="tit_mame">기상정보</p>
                        <div class="weather">
                            <div class="azimuth">
                                <i class="fas fa-location-arrow fa-3x" :style="getTransformDegree(weather.data['windDirection'])"></i>
                            </div>
                            <div class="weather_right">
                                <table>
                                    <tr>
                                        <th>풍향</th>
                                         <td>{{weather.data['windDirection']}} °({{getWindDirection(weather.data['windDirection'])}})</td>
                                    </tr>
                                    <tr>
                                        <th>풍속</th>
                                        <td>{{weather.data['windSpeed']}} m/s</td>
                                    </tr>
                                    <tr>
                                        <th>일강우량</th>
                                        <td>{{weather.data['rainfall']}} mm</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="box_rad_wsn information">
                        <p class="tit_mame">환경방사능정보</p>
                            <table class="">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr>
                                    <th>지점명</th>
                                    <th>값(μSv/h)</th>
                                    <th>상태</th>
                                </tr>
                            </table>
                        <div class="mCscrollbar">
                            <table class="ant2">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr v-for="point in erms">
                                    <td>{{point.pointNm}}</td>
                                    <td>{{point.val.toFixed(2)}}</td>
                                    <td><span :class="point.status == 'Y' ? 'alarm step1' : 'alarm step2'"></span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            
                <div class="right wos">
                    <div class="alarm step1"><p>정상</p></div>
                	<div class="alarm step2"><p>통신장애</p></div>
                	<div class="alarm step3"><p>주의</p></div>
                	<div class="alarm step4"><p>조치</p></div>
                    
                    <div class="rbox_01">
                        <p>고압 안전주입 탱크</p>
                        <table>
                            <tr>
                                <th>수위</th>
                                <td is="care-main-tag" :value="tags.AI2130" :taginfo="tagInfos.AI2130"/>
                            </tr>
                            <tr>
                                <th>수위</th>
                                <td is="care-main-tag" :value="tags.AI2126" :taginfo="tagInfos.AI2126"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_02">
                        <p>중수저장탱크</p>
                        <table>
                            <tr>
                                <th>수위</th>
                                <td is="care-main-tag" :value="tags.AI2624" :taginfo="tagInfos.AI2624"/>
                            </tr>
                            <tr>
                                <th>압력</th>
                                <td is="care-main-tag" :value="tags.AI2640" :taginfo="tagInfos.AI2640"/>
                            </tr>
                        </table>
                    </div>
                                                        
                    <div class="rbox_03">
                        <p>탈기응축기</p>
                        <table>
                            <tr>
                                <th>압력</th>
                                <td is="care-main-tag" :value="tags._DTAB157" :taginfo="tagInfos._DTAB157"/>
                            </tr>
                            <tr>
                                <th>수위</th>
                                <td is="care-main-tag" :value="tags._DTAB151" :taginfo="tagInfos._DTAB151"/>
                            </tr>
                            <tr>
                                <th>온도</th>
                                <td is="care-main-tag" :value="tags.AI1412" :taginfo="tagInfos.AI1412"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_04">
                        <p>가압기</p>
                        <table>
                            <tr>
                                <th>압력</th>
                                <td is="care-main-tag" :value="tags._DTAB156" :taginfo="tagInfos._DTAB156"/>
                            </tr>
                            <tr>
                                <th>수위</th>
                                <td is="care-main-tag" :value="tags._DTAB150" :taginfo="tagInfos._DTAB150"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_05">
                        <p>증기 발생기</p>
                        <table>
                            <tr>
                                <th>S/G</th>
                                <th>수위</th>
                                <th>압력</th>
                            </tr>
                            <tr>
                                <th>1</th>
                                <td is="care-main-tag" :value="tags._DTAB210" :taginfo="tagInfos._DTAB210"/>
                                <td is="care-main-tag" :value="tags.AI1276" :taginfo="tagInfos.AI1276"/>
                            </tr>
                            <tr>
                                <th>2</th>
                                <td is="care-main-tag" :value="tags._DTAB211" :taginfo="tagInfos._DTAB211"/>
                                <td is="care-main-tag" :value="tags.AI2435" :taginfo="tagInfos.AI2435"/>
                            </tr>
                            <tr>
                                <th>3</th>
                                <td is="care-main-tag" :value="tags._DTAB212" :taginfo="tagInfos._DTAB212"/>
                                <td is="care-main-tag" :value="tags.AI1277" :taginfo="tagInfos.AI1277"/>
                            </tr>
                            <tr>
                                <th>4</th>
                                <td is="care-main-tag" :value="tags._DTAB213" :taginfo="tagInfos._DTAB213"/>
                                <td is="care-main-tag" :value="tags.AI2436" :taginfo="tagInfos.AI2436"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_06">
                        <table>
                            
                            <tr>
                                <th>노심출력</th>
                                <td is="care-main-tag" :value="tags.DT7" :taginfo="tagInfos.DT7"/>
                            </tr>
                        </table>
                    </div>
                                        
                    <div class="rbox_07">
                        <p>원자로실</p>
                    </div>
                    <div class="rbox_08">
                        <p>SPRAY</p>
                    </div>
<!--                     <div class="rbox_09"> -->
<!--                         <p>FM<br/>Vault</p> -->
<!--                     </div> -->
                    <div class="rbox_10">
                        <p>MVI.2</p>
                    </div>
                    <div class="rbox_11">
                        <p>RD</p>
                    </div>
                    <div class="rbox_12">
                        <p>제 2 정지냉각계통</p>
                    </div>
                    <div class="rbox_13">
                        <p>흡수봉</p>
                    </div>
                    <div class="rbox_14">
                        <p>정지봉 (제1 정지냉각계통)</p>
                    </div>
                    <div class="rbox_15">
                        <p>LZC</p>
                    </div>
                    
                    
                    <div class="rbox_20">
                        <p>STEAM LINE</p>
                        <table>
                            <tr>
                                <th>F1</th>
                                <td is="care-main-tag" :value="tags.AI2540" :taginfo="tagInfos.AI2540"/>
                            </tr>
                        </table>
                    </div>
                    <div class="rbox_21">
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags.AI1342" :taginfo="tagInfos.AI1342"/>
                            </tr>
                        </table>
                    </div>
                    <div class="rbox_22">
                        <p>Sea Water</p>
                        <table>
                            <tr>
                                <th>T</th>
                                <td is="care-main-tag" :value="tags.AI3170" :taginfo="tagInfos.AI3170"/>
                            </tr>
                            <tr>
                                <th>L</th>
                                <td is="care-main-tag" :value="tags.AI2737_UNION" :taginfo="tagInfos.AI2737_UNION"/>
                            </tr>
                        </table>
                    </div>
                    <div class="rbox_23">
                        <p>SFB</p>
                        <table>
                            <tr>
                                <th>L</th>
                                <td is="care-main-tag" :value="tags.AI0640" :taginfo="tagInfos.AI0640"/>
                            </tr>
                            <tr>
                                <th>T</th>
                                <td is="care-main-tag" :value="tags.AI0642" :taginfo="tagInfos.AI0642"/>
                            </tr>
                        </table>
                    </div>
                    <div class="rbox_24">
                        <p>MMSV</p>
                    </div>
                    <div class="rbox_25">
                        <p>ASDV</p>
                    </div>
                    <div class="rbox_26">
                        <p>HOT STEAM</p>
                    </div>
                    <div class="rbox_27">
                        <p>MSIV</p>
                    </div>
                    <div class="rbox_28">
                        <p>Feed<br/>WTR<br/>Line</p>
                    </div>
                    <div class="rbox_29">
                        <p>TBN</p>
                    </div>
                    <div class="rbox_30">
                        <p>CONDENSER</p>
                    </div>
                    <div class="rbox_31">
                        <p>CCW P/P</p>
                    </div>
                    <div class="rbox_32">
                        <p>MAIN<br/>BFP</p>
                    </div>
                    <div class="rbox_33">
                        <p>D/A TK</p>
                    </div>
                    <div class="rbox_34">
                        <p>CEP</p>
                    </div>
                    <div class="rbox_35">
                        <p>Spent Fuel Bay</p>
                    </div>
                    <div class="rbox_36">
                        <p>Ecc P/P</p>
                    </div>
                </div>             
            </div>
            
            
             <div class="footer">
                <ul>
                    <li v-for="(npp, index) in nppFooterList" class="section">
                        <p class="name">{{npp.display}}</p>
                        <ul>
                            <li v-for="hogi in npp.hogiList"  v-on:click="simple_atomic(hogi.hogi, hogi.dHogi )">
                                <div v-if="hogi.hogi == 'KNFC1'" class="ac_round dcNormal">
                                    <img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="animation: loading 0s linear infinite;">
                                    <img v-else src="/images/care/common/radi_01.png" alt="방사능이미지">
                                </div>
                                <div v-else class="ac_round" :class="hogi.cssText">
                                    <img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="animation: loading 0s linear infinite;">
                                    <img v-else :src="hogi.img" alt="방사능이미지">
                                </div>
                                <span v-if="hogi.hogi == 'NKRN3'" class="text">1호기</span>
                                <span v-else-if="hogi.hogi == 'NKRN4'" class="text">2호기</span>
                                <span class="text">{{hogi.text}}</span>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        
        
<!--    하나로 -->
        <div v-for="npp in nppHanList" class="relevantAgency" :class="npp.cssText" id="tab-HAN1">
            <div class="header">
                <div class="pile_name">HANARO
                	<img v-if="header.failureTimeYn == 'Y'" style="margin-top: 12px;" src="/images/care/common/radi_06_color.png">
                    <div class="ac_round" :class="npp.cssText">
                        <img :src="npp.img" alt="방사능이미지">
                    </div>
                </div>
                <div v-if="header.changePiPms == 'Y'" class="summary">
                    <div v-if="header.failureTimeYn == 'Y'" class="day">{{header.now_workDate_pi}}</div>
                    <div v-else class="day">{{currentTime}}</div>
                    <ul class="summary_txt">
<!--                         <li>운영상태 : <span class="situation green">정상</span></li> -->
                        <li>운영상태 : <span>{{header.displayText}}</span></li>
                        <li>원자력 출력 : <span>{{header.piPwr}} %</span></li>
                        <li>터빈출력 : <span>{{header.piTbn}} MWe</span></li>
<!--                         <li>안전모선 : <span class="situation green">정상</span></li> -->
                    </ul>
                </div>
                <div v-else class="summary">
                    <div v-if="header.failureTimeYn == 'Y'" class="day">{{header.now_workDate}}</div>
                    <div v-else class="day">{{currentTime}}</div>
                    <ul class="summary_txt">
<!--                         <li>운영상태 : <span class="situation green">정상</span></li> -->
                        <li>운영상태 : <span>{{header.displayText}}</span></li>
                        <li>원자력 출력 : <span>{{header.pwr}} %</span></li>
                        <li>터빈출력 : <span>{{header.tbn}} MWe</span></li>
<!--                         <li>안전모선 : <span class="situation green">정상</span></li> -->
                    </ul>
                </div>
                <div class="top_btar">
                    <button is="care-main-header-status" name="Rx Trip" :value="tags._RRS_TRIP" :taginfo="tagInfos._RRS_TRIP">
                </div>
                <button type="button" class="close" v-on:click=unsubscribe()><i class="xi-close"></i></button>
            </div>
            
            <div class="contants">
                <div class="left">
                    
                    <div class="box">
                        <p class="tit_mame">기상정보</p>
                        <div class="weather">
                            <div class="azimuth">
                                <i class="fas fa-location-arrow fa-3x" :style="getTransformDegree(weather.data['windDirection'])"></i>
                            </div>
                            <div class="weather_right">
                                <table>
                                    <tr>
                                        <th>풍향</th>
                                        <td>{{weather.data['windDirection']}} °({{getWindDirection(weather.data['windDirection'])}})</td>
                                    </tr>
                                    <tr>
                                        <th>풍속</th>
                                        <td>{{weather.data['windSpeed']}} m/s</td>
                                    </tr>
                                    <tr>
                                        <th>일강우량</th>
                                        <td>{{weather.data['rainfall']}} mm</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="box information_han">
                        <p class="tit_mame">환경방사능정보</p>
                            <table class="">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr>
                                    <th>지점명</th>
                                    <th>값(μSv/h)</th>
                                    <th>상태</th>
                                </tr>
                            </table>
                        <div class="mCscrollbar">
                            <table class="ant2">
                                <colgroup>
                                    <col width="200px">
                                    <col width="80px">
                                    <col width="30px">
                                </colgroup>
                                <tr v-for="point in erms">
                                    <td>{{point.pointNm}}</td>
                                    <td>{{point.val.toFixed(2)}}</td>
                                    <td><span :class="point.status == 'Y' ? 'alarm step1' : 'alarm step2'"></span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            
                <div class="right han">
                	<div class="alarm step1"><p>정상</p></div>
                	<div class="alarm step2"><p>통신장애</p></div>
                    <div class="rbox_01">
<!--                         <p>EWS 유속</p> -->
<!--                         <table> -->
<!--                             <tr> -->
<!--                                 <td is="care-main-tag" :taginfo="tagInfos._EWS"/> -->
<!--                             </tr> -->
<!--                         </table> -->
                    </div>
                    
                    <div class="rbox_02">
                        <p>원자로실</p>
                        <table>
                            <tr>
                                <th>입자</th>
                                <td is="care-main-tag" :value="tags._RE019P" :taginfo="tagInfos._RE019P"/>
                            </tr>
                            <tr>
                                <th>옥소</th>
                                <td is="care-main-tag" :value="tags._RE019I" :taginfo="tagInfos._RE019I"/>
                            </tr>
                            <tr>
                                <th>가스</th>
                                <td is="care-main-tag" :value="tags._RE019G" :taginfo="tagInfos._RE019G"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_03">
                        <p>핵연료파손감지</p>
                        <table>
                            <tr>
                                <th>A</th>
                                <td is="care-main-tag" :value="tags._FFDSA" :taginfo="tagInfos._FFDSA"/>
                            </tr>
                            <tr>
                                <th>B</th>
                                <td is="care-main-tag" :value="tags._FFDSB" :taginfo="tagInfos._FFDSB"/>
                            </tr>
                            <tr>
                                <th>C</th>
                                <td is="care-main-tag" :value="tags._FFDSC" :taginfo="tagInfos._FFDSC"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_04">
                        <p>2차 냉각수계통</p>
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags._RE016" :taginfo="tagInfos._RE016"/>
                            </tr>
                            
                        </table>
                    </div>
                    
                    <div class="rbox_05">
                        <p>가공시설 공간감마선량율</p>
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags._AREA01" :taginfo="tagInfos._AREA01"/>
                            </tr>
                            <tr>
                                <td is="care-main-tag" :value="tags._AREA02" :taginfo="tagInfos._AREA02"/>
                            </tr>
                            <tr>
                                <td is="care-main-tag" :value="tags._AREA03" :taginfo="tagInfos._AREA03"/>
                            </tr>
                            <tr>
                                <td is="care-main-tag" :value="tags._AREA04" :taginfo="tagInfos._AREA04"/>
                            </tr>
                            
                        </table>
                    </div>
                    
                    <div class="rbox_06">
                        <p></p>
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags._AREA05" :taginfo="tagInfos._AREA05"/>
                            </tr>
                            <tr>
                                <td is="care-main-tag" :value="tags._AREA06" :taginfo="tagInfos._AREA06"/>
                            </tr>
                            <tr>
                                <td is="care-main-tag" :value="tags._AREA07" :taginfo="tagInfos._AREA07"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_07">
                        <p>공조실</p>
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags._AREA24" :taginfo="tagInfos._AREA24"/>
                            </tr>
                        </table>
                    </div>
                
                    <div class="rbox_08">
                        <p>가공시설 공기오염도</p>
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags._CAM06" :taginfo="tagInfos._CAM06"/>
                            </tr>
                            <tr>
                                <td is="care-main-tag" :value="tags._CAM07" :taginfo="tagInfos._CAM07"/>
                            </tr>
                            <tr>
                                <td is="care-main-tag" :value="tags._CAM08" :taginfo="tagInfos._CAM08"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_09">
                        <p>배기공기오염도</p>
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags._CAM01" :taginfo="tagInfos._CAM01"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_11">
                        <p>원자로실 부압</p>
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags._RXPRESS" :taginfo="tagInfos._RXPRESS"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_12">
                        <p>원자로출력</p>
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags._P" :taginfo="tagInfos._P"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_13">
                        <p>첨니수 온도</p>
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags._T" :taginfo="tagInfos._T"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_14">
                        <p>SUMP 수위</p>
                        <table>
                            <tr>
                                <td is="care-main-tag" :value="tags._RXSUMP" :taginfo="tagInfos._RXSUMP"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_15">
                        <p>비상환기계통</p>
                        <table>
                            <tr>
                            	<th>입자</th>
                                <td is="care-main-tag" :value="tags._RE022P" :taginfo="tagInfos._RE022P"/>
                            </tr>
                            <tr>
                            	<th>옥소</th>
                                <td is="care-main-tag" :value="tags._RE022I" :taginfo="tagInfos._RE022I"/>
                            </tr>
                            <tr>
                            	<th>가스</th>
                                <td is="care-main-tag" :value="tags._RE022G" :taginfo="tagInfos._RE022G"/>
                            </tr>
                        </table>
                    </div>
                    
                    
                    <div class="rbox_16">
                        <p>정상환기계통</p>
                        <table>
                            <tr>
                            	<th>입자</th>
                                <td is="care-main-tag" :value="tags._RE023P" :taginfo="tagInfos._RE023P"/>
                            </tr>
                            <tr>
                            	<th>옥소</th>
                                <td is="care-main-tag" :value="tags._RE023I" :taginfo="tagInfos._RE023I"/>
                            </tr>
                            <tr>
                            	<th>가스</th>
                                <td is="care-main-tag" :value="tags._RE023G" :taginfo="tagInfos._RE023G"/>
                            </tr>
                        </table>
                    </div>
                    
                    
                    <div class="rbox_17">
                        <p>조사재시험시설</p>
                        <table>
                            <tr>
                            	<th>입자</th>
                                <td is="care-main-tag" :value="tags._RE024P" :taginfo="tagInfos._RE024P"/>
                            </tr>
                            <tr>
                            	<th>옥소</th>
                                <td is="care-main-tag" :value="tags._RE024I" :taginfo="tagInfos._RE024I"/>
                            </tr>
                            <tr>
                            	<th>가스</th>
                                <td is="care-main-tag" :value="tags._RE024G" :taginfo="tagInfos._RE024G"/>
                            </tr>
                        </table>
                    </div>
                    
                    <div class="rbox_18">
                        <p>새빛 연료동</p>
                    </div>
                    
                    <div class="rbox_19">
                        <p>냉각탑</p>
                    </div>
                    
                    <div class="rbox_20">
                        <p>Basin</p>
                    </div>
                    
                    <div class="rbox_21">
                        <p>열교환기</p>
                    </div>
                    
                    <div class="rbox_22">
                        <p>HEPA</p>
                    </div>
                    
                    <div class="rbox_23">
                        <p>CHAROOAL</p>
                    </div>
                    
                    <div class="rbox_24">
                        <p>DAMPER</p>
                    </div>
                    
                    <div class="rbox_25">
                        <p>비상환기계통</p>
                    </div>
                    
                    <div class="rbox_26">
                        <p>정상환기계통</p>
                    </div>
                
                </div>
            </div>
            
            <div class="footer">
                <ul>
                    <li v-for="(npp, index) in nppFooterList" class="section">
                        <p class="name">{{npp.display}}</p>
                        <ul>
                            <li v-for="hogi in npp.hogiList"  v-on:click="simple_atomic(hogi.hogi, hogi.dHogi )">
                                <div v-if="hogi.hogi == 'KNFC1'" class="ac_round dcNormal">
                                    <img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="animation: loading 0s linear infinite;">
                                    <img v-else src="/images/care/common/radi_01.png" alt="방사능이미지">
                                </div>
                                <div v-else class="ac_round" :class="hogi.cssText">
                                    <img v-if="hogi.failureTimeYn == 'Y'" src="/images/care/common/radi_06_color.png" alt="방사능이미지" style="animation: loading 0s linear infinite;">
                                    <img v-else :src="hogi.img" alt="방사능이미지">
                                </div>
                                <span v-if="hogi.hogi == 'NKRN3'" class="text">1호기</span>
                                <span v-else-if="hogi.hogi == 'NKRN4'" class="text">2호기</span>
                                <span class="text">{{hogi.text}}</span>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!--마우스팝업-->
	<div class="ly_help"><div id="ly1"></div><div id="ly2"></div></div>
	
</body>


<link rel="stylesheet" href="/css/com/uicdn.toast.com_editor_latest_toastui-editor.min.css" /> 
 <script src="/js/com/uicdn.toast.com_editor_latest_toastui-editor-all.min.js"></script>
<script>

	var editor;


	$(function(){
	    var responseMessage = "<c:out value="${message}" />";
	    if(responseMessage != ""){
	        alert(responseMessage)
	    }
	}); 

	var loader;		// 로딩 바 관련
	var vm;
	
	var sock = new SockJS("/ws-stomp");
	var ws = Stomp.over(sock); 
	ws.debug = function() { };	// debug 삭제
	
	//파스칼 형식으로 변경 해주는 펑션
	String.prototype.toPascalCase = function() {
	    const words = this.match(/[a-z0-9]+/gi);
	    if (!words) return "";
	    return words
	        .map(function(word, index) {
	        	if(index == 0) {
	        		return word.charAt(0).toLowerCase() + word.substr(1).toLowerCase();
	        	} else {
	        		return word.charAt(0).toUpperCase() + word.substr(1).toLowerCase();
	        	}
	        }).join("");
	};
	
	Vue.component('modal', { 
		template: '#modal-template',
	});  
	
	vm = new Vue({
	    el: '#app',
	    data: function() {
	    	return {
	    		currentTime : '',
	    		nowDateGetTime: '',
	    		bbsList: [],
	    		bbs : {},
	    		nppList: [	{ npp: 'KRN', display: '<strong>고리</strong> 원자력 본부' },
    						{ npp: 'SRN', display: '<strong>새울</strong> 원자력 본부' },
		    				{ npp: 'WSN', display: '<strong>월성</strong> 원자력 본부' },
		    				{ npp: 'YGN', display: '<strong>한빛</strong> 원자력 본부' },
		    				{ npp: 'UCN', display: '<strong>한울</strong> 원자력 본부' },
		    				{ npp: 'HAN', display: '원자력연구원' },
		    				{ npp: 'KNFC', display: '&nbsp' }
    			],
    			nppFooterList: [
    				{ npp: 'KRN', display: '고리' },
					{ npp: 'SRN', display: '새울' },
    				{ npp: 'WSN', display: '월성' },
    				{ npp: 'YGN', display: '한빛' },
    				{ npp: 'UCN', display: '한울' },
    				{ npp: 'HAN', display: '원자력연구원' },
    				{ npp: 'KNFC', display: '한전원자력연료'}
    			],
    			imgList: {
    				dcTest: { normal: '/images/care/common/radi_01.png', color: '/images/care/common/radi_01_color.png'},
    				dcNormal: { normal: '/images/care/common/radi_01.png', color: '/images/care/common/radi_01_color.png'},
    				dcPrvnMntn: { normal: '/images/care/common/radi_02_color.png' },
    				dcSuddenStop: { normal: '/images/care/common/radi_03_color.png', color: '/images/care/common/radi_03_color.png'},
    				dcPerStop: { normal: '/images/care/common/radi_04_color.png'},
    				dcReady: { normal: '/images/care/sub/radi_05x29.png' }
    			},
    			pendingRequest: false, 
    	    	showDetailModal: false,
    	    	file:{ 
    	    		fileList:[]
    	    	},
    	    	nppAllList: [],
    	    	nppWsnList: [],
    	    	nppWsn1List: [],
    	    	nppKrn1List: [],
    	    	nppHanList: [],
    	    	tagInfos: [],
    	    	erms: [],
    	    	weather: {
            		data: {},
            		params: {
            			HAN : { windDirection: 'WDR10', windSpeed: 'WSP10', rainfall: 'PRC' },
            			Other : { windDirection: 'ME006', windSpeed: 'ME005', rainfall: 'ME003' }
            		},
            		directionList: [
            			{ text: '북북동', start: 0.5, end: 1.5 },
            			{ text: '북동', start: 1.5, end: 2.5 },
            			{ text: '동북동', start: 2.5, end: 3.5 },
            			{ text: '동', start: 3.5, end: 4.5 },
            			{ text: '동남동', start: 4.5, end: 5.5 },
            			{ text: '남동', start: 5.5, end: 6.5 },
            			{ text: '남남동', start: 6.5, end: 7.5 },
            			{ text: '남', start: 7.5, end: 8.5 },
            			{ text: '남남서', start: 8.5, end: 9.5 },
            			{ text: '남서', start: 9.5, end: 10.5 },
            			{ text: '서남서', start: 10.5, end: 11.5 },
            			{ text: '서', start: 11.5, end: 12.5 },
            			{ text: '서북서', start: 12.5, end: 13.5 },
            			{ text: '북서', start: 13.5, end: 14.5 },
            			{ text: '북북서', start: 14.5, end: 15.5 },
            			{ text: '북', start: 15.5, end: 0.5 },
            		]
        		},
        		header: {
        			condition: '',
                	displayText: '',
                	pwr: 0,
                	tbn: 0,
                	piPwr: 0,
                	piTbn: 0
                },
                tags: {},
                updateKey : 0,
                id: '#KRN|1#',
                npp: 'KRN',
                hogi: '1',
    	    	
	    	}
	    },
	    created() {
	    	this.systemNtp();
	    	axios
		     	.post("/monitor/footer.ajax", {})
		     	.then(function (response) {
		     		
		     		vm.nppFooterList.forEach(function(npp) {
		     			var result = response.data.footer.find(function(dNpp) {
		     				return npp.npp == dNpp.npp;
		     			});
		     			
		     			if(result) {
		     				result.hogiList.forEach(function(hogi) {
		     					vm.buildHogiData(hogi, hogi);
		     				});
		     				npp = _.merge(npp, result);
		     			}
		     		});
		     		
		     		vm.nppList.forEach(function(npp) {
		     			var result = response.data.footer.find(function(dNpp) {
		     				return npp.npp == dNpp.npp;
		     			});
		     			
		     			if(result) {
		     				result.hogiList.forEach(function(hogi) {
		     					
		     					if(hogi.hogi == 'WSN1' || hogi.hogi == 'WSN2' || hogi.hogi == 'WSN3' || hogi.hogi == 'WSN4' || hogi.hogi == 'HAN1'){
		     						if(hogi.hogi == 'WSN1'){
		     							vm.nppWsn1List.push(hogi);
		     						}
		     						else if(hogi.hogi != 'HAN1'){
		     							vm.nppWsnList.push(hogi);
		     						}
		     						else{
		     							vm.nppHanList.push(hogi);
		     						}
		     					}
		     					else{
		     						if(hogi.hogi == 'KRN1'){
		     							vm.nppKrn1List.push(hogi);
		     						}
		     						else{
		     							vm.nppAllList.push(hogi);
		     						}
		     						
		     					}
		     					
		     					vm.buildHogiData(hogi, hogi);
		     				});
		     				npp = _.merge(npp, result);
		     			}
		     		});
		     		
		     		axios
			    	 	.get("/data/user")
			    	 	.then((response) => {
			    	 		vm.token = response.data.token;
			    			ws.connect(
			    				{ token: vm.token },
			    				function (frame) {
			    					console.log("소켓 연결 성공");
			    					vm.subscribe();
			    				},
			    				function (error) {
// 			    					alert("서버 연결에 실패 하였습니다. 다시 접속해 주십시요.");
			    					location.href = location.href;
			    				}
			    			);
			    		});
		     	});
	    	
	    	var startDate = null;
    		var endDate = null;
	    	
	    	axios
     		.post('/monitor/bbsList.do',{startDate:startDate, endDate:endDate })
     		.then(function(response) {
				vm.bbsList = response.data.list;
				
				axios
	     		.post('/monitor/modalList.ajax',{})
	     		.then(function(response) {
	     			if(response.data.modalList.length == '1'){
	     				vm.detailModal(response.data.modalList[0]);
	     			} 
				}, function(error) {
					alert("최근 공지 데이터를 가져오지 못했습니다.");
				});
				
				
			}, function(error) {
				alert("최근 공지 데이터를 가져오지 못했습니다.");
			});
	    	
	    	
	    	var sessionLv = '${member.lv}';
	    	if(sessionLv != ''){
	    		var arr = new Array(sessionLv.split('.'));
	    		
	    		axios.post('/monitor/errorList.do',{npp : arr[0][0], hogi : arr[0][1]}).then(function(response) {
					var totalCnt = response.data.cnt.totalCnt;
					
					if(totalCnt > 0){
						errorPopUp();
					}
					
				}, function(error) {
					alert("데이터를 가져오지 못했습니다.");
				});
	    	}
	    },
	    mounted() {
	    	setInterval(this.systemNtp, 1000);
	    },	    
	    methods : {
			simple_atomic : function(tabNm ,hogi){
				
				if(tabNm == 'KNFC1'){
					return true;
				}
				this.npp = tabNm.slice(0,-1);
				this.hogi = hogi;
				this.unsubscribe(this.id);
				this.id = '#' + this.npp + '|' + hogi + '#';
				this.simple_subscribe(this.id);
				
	   			axios
		     	.post("/monitor/list.ajax", { npp: this.npp, hogi: hogi })
		     	.then(function (response) {
		     		
		     	var tagInfos = {};
		     	var tags = {};
		     	response.data.tagList.forEach(function (e) {
		     		tags[e.tagNm] = e.val;
	     			tagInfos[e.tagNm] = e;
	     		});
		     	vm.tagInfos = tagInfos;
		     	vm.tags = tags;
		     	vm.updateKey += 1;
		     	
				vm.erms = response.data.erms[0].list;
				
				var weather = response.data.weather.find(function(w) {
	     			if(tabNm.slice(0,-1) == "NWSN"){
	     				return w.npp == "WSN";
	     			}
	     			else{
	     				return w.npp == tabNm.slice(0,-1);
	     			}
	     		});
	   			
				if(weather){
					var params = vm.weather.params.Other;
	     			if(tabNm.slice(0,-1) == "HAN") {
	     				params = vm.weather.params.HAN;
	     			}
	     			var _params = Object.keys(params);
	     			_params.forEach(function(key) {
						var tag = weather.list.find(function(d) {
							return d.tag == params[key];
						});
						
						vm.weather.data[key] = ( tag.val != undefined ? tag.val.toFixed(1) : '' );
					}); 
				}
	    		
				
				var nowDate = new Date();
	     		var header_now_workDate = new Date(response.data.nppData.workDate);
	     		var header_now_workDate_pi = new Date(response.data.nppData.workDatePi);
	     		var header_failureTime_PMS = vm.nowDateGetTime - header_now_workDate.getTime();
	     		var header_failureTime_PI = vm.nowDateGetTime - header_now_workDate_pi.getTime();
	     	
	     		
	     		if(header_failureTime_PMS > 3600000 && (header_failureTime_PI > 3600000 || response.data.nppData.workDatePi == undefined)){
	    			vm.header.failureTimeYn = "Y";
	    		}
	     		else{
	     			vm.header.failureTimeYn = "N";
	     		}
	     		
	     		if(header_failureTime_PMS > 600000){
	     			vm.header.changePiPms = "Y";
	     		}
	     		else{
	     			vm.header.changePiPms = "N";
	     		}
	     		
				vm.header = {
						npp : response.data.nppData.npp,
						hogi : response.data.nppData.hogi,
	     				condition: response.data.nppData.nowDiv,
	     				displayText: response.data.nppData.nowDivText,
	     				pwrTag: response.data.nppData.pwr,
	     				pwr: response.data.nppData.pwrVal.toFixed(2),
	     				piPwr: response.data.nppData.piPwrVal.toFixed(2),
	     				tbnTag: response.data.nppData.tbn,
	     				tbn: response.data.nppData.tbnVal.toFixed(1),
	     				piTbn: response.data.nppData.piTbnVal.toFixed(1),
	     				now_workDate: moment(header_now_workDate).format('YYYY년 MM월 DD일  A hh:mm:ss'),
	     				now_workDate_pi: moment(header_now_workDate_pi).format('YYYY년 MM월 DD일  A hh:mm:ss'),
	     				now_str: response.data.nppData.nowStr,
	     				now_end: response.data.nppData.nowEnd
	 				};
		     	
		     	});
	   			
	   			
	            var tab_id = 'tab-' + tabNm;
                $('.relevantAgency_area').fadeIn().css('display','flex');
                $('.relevantAgency').removeClass('current');
                $("#"+tab_id).addClass('current');

	            $(".relevantAgency .close").click(function () {
	                $('.relevantAgency').removeClass('current');
	                $('.relevantAgency_area').fadeOut();
	            });
	            
	            $('.mCscrollbar').mCustomScrollbar({ 
	     	       theme:"minimal-dark",
	     	       scrollInertia : 1500
	     	    }); 
	   		},
	   		getWindDirection : function(degree) {
	        	if(vm) {
	        		var div = degree / 22.5;
	        		var direction = vm.weather.directionList.find(function(d) {
	        			if(d.start <= div && d.end > div) 
	        				return true;
	        		});
	        		
	        		if(direction == undefined) {
	        			return '북';
	        		}
	        		return direction.text;
	        	}
	    	},
	    	getTransformDegree : function(degree) {
	    		return { transform: 'rotate(' + (degree - 226) + 'deg )' };
	    	}, 
	    	buildHogiData(hogi, data) {
	    		
	    		hogi.height = 0;
	    		hogi.nowDiv = data.NowDiv ? data.NowDiv : data.nowDiv;
	    		var _workDate = data.WorkDate ? data.WorkDate : data.workDate;
	    		var _workDatePi = data.WorkDatePi ? data.WorkDatePi : data.workDatePi;
	    		var _pwr = data.Pwr ? data.Pwr : data.pwr;
	    		var _pwrPi = data.PwrPi ? data.PwrPi : data.pwrPi;
	    		
	    		if(_pwr == undefined && data.Pwr == 0){
	    			_pwr = 0;
	    		}
	    		if(_pwrPi == undefined && data.PwrPi == 0){
	    			_pwrPi = 0;
	    		}
	    		
	    		var nowDate = new Date();
	    		var now_workDate = new Date(_workDate);
	    		var now_workDate_pi = new Date(_workDatePi);
	    		var failureTime_PMS = vm.nowDateGetTime - now_workDate.getTime();
	    		var failureTime_PI = vm.nowDateGetTime - now_workDate_pi.getTime();
	    		
	    		
	    		
	    		
	    		if(failureTime_PMS > 3600000 && (failureTime_PI > 3600000 || _workDatePi == undefined)){
	    			hogi.failureTimeYn = "Y";
	    		}
	    		else {
	    			hogi.failureTimeYn = "N";
	    		}
	    		
	    		if(vm.header.npp){
	    			if(hogi.hogi == vm.header.npp + vm.header.hogi){
	    				vm.header.failureTimeYn = hogi.failureTimeYn;
	    			}
	    		}
	    		
				if(failureTime_PMS > 600000){
	     			hogi.changePiPms = "Y";
	     		}
	     		else{
	     			hogi.changePiPms = "N";
	     		}
// 	    		hogi.failureTime = nowDate.getTime() - now_workDate.getTime();
	    		
	    		
				if(_workDatePi) {
					hogi.displayTimePi = moment(_workDatePi).format('MM-DD') + '<br/>' + moment(_workDatePi).format('HH:mm');
				} else {
					hogi.displayTimePi = '&nbsp;<br />&nbsp;';
				}
				
				if(_workDate) {
					hogi.displayTime = moment(_workDate).format('MM-DD') + '<br/>' + moment(_workDate).format('HH:mm');
				} else {
					hogi.displayTime = '&nbsp;<br />&nbsp;';
				}
				
				// 출력값 공백 처리
				if(_pwr == 0) hogi.pwr = _pwr;
				else if(!_pwr) hogi.pwr = '&nbsp;';
				else hogi.pwr = _pwr;
				
				// 예방정비 일 때 출력값 처리
				hogi.pwr = (hogi.nowDiv == 'DC_PRVN_MNTN') ? 'OH' : hogi.pwr;
				// 원자로 출력값 1이하 시 불시정지
				if(hogi.pwr < 1 && hogi.nowDiv == 'DC_TEST'){
					hogi.pwr = 0;
				}
				else if(hogi.pwr < 1 && hogi.nowDiv != 'DC_PER_STOP'){
					hogi.nowDiv = 'DC_SUDDEN_STOP';
					hogi.pwr = 0;
				}
				// 영구정지, 불시정지 일 때 출력값 처리
				hogi.pwr = (hogi.nowDiv == 'DC_PER_STOP') ? 0 : hogi.pwr;
				
				if(hogi.changePiPms == "Y"){
					// PI
					// 출력값 공백 처리
					if(_pwrPi == 0) hogi.pwrPi = _pwrPi;
					else if(!_pwrPi) hogi.pwrPi = '&nbsp;';
					else hogi.pwrPi = _pwrPi;
					
					// 예방정비 일 때 출력값 처리
					hogi.pwrPi = (hogi.nowDiv == 'DC_PRVN_MNTN') ? 'OH' : hogi.pwrPi;
					// 원자로 출력값 1이하 시 불시정지
					if(hogi.pwrPi < 1 && hogi.nowDiv == 'DC_TEST'){
						hogi.pwrPi = 0;
					}
					else if(hogi.pwrPi < 1 && hogi.nowDiv != 'DC_PER_STOP'){
						hogi.nowDiv = 'DC_SUDDEN_STOP';
						hogi.pwrPi = 0;
					}
					// 영구정지, 불시정지 일 때 출력값 처리
					hogi.pwrPi = (hogi.nowDiv == 'DC_PER_STOP') ? 0 : hogi.pwrPi;
					//PI
				}
				
								
				if(hogi.nowDiv) {
					
					hogi.cssText = hogi.nowDiv.toLowerCase().toPascalCase();
					hogi.img = vm.imgList[hogi.cssText].normal;
					
					//PI
					hogi.imgPi = vm.imgList[hogi.cssText].normal;
					
					if(hogi.nowDiv == 'DC_NORMAL' || hogi.nowDiv == 'DC_TEST' || hogi.nowDiv == 'DC_SUDDEN_STOP') {
						if(Number(hogi.pwr)) {
							hogi.pwr = hogi.pwr > 100 ? 100 : Number(hogi.pwr).toFixed(0);
							if(hogi.hogi == 'HAN1'){
								hogi.height = (hogi.pwr * 1.5 / 30 * 100).toFixed(0);
								if(hogi.pwr < 13.3 ) {
									hogi.img = vm.imgList[hogi.cssText].color;
								}
							}
							else{
								hogi.height = (hogi.pwr * 1.5).toFixed(0);
								if(hogi.pwr < 40) {
									hogi.img = vm.imgList[hogi.cssText].color;
								}
							}
						} else {
							hogi.img = vm.imgList[hogi.cssText].color;
						}
						
						//PI
						if(Number(hogi.pwrPi)) {
							hogi.pwrPi = hogi.pwrPi > 100 ? 100 : Number(hogi.pwrPi).toFixed(0);
							if(hogi.hogi == 'HAN1'){
								hogi.heightPi = (hogi.pwrPi * 1.5 / 30 * 100).toFixed(0);
								if(hogi.pwrPi < 13.3 ) {
									hogi.imgPi = vm.imgList[hogi.cssText].color;
								}
							}
							else{
								hogi.heightPi = (hogi.pwrPi * 1.5).toFixed(0);
								if(hogi.pwrPi < 40) {
									hogi.imgPi = vm.imgList[hogi.cssText].color;
								}
							}
						} else {
							hogi.imgPi = vm.imgList[hogi.cssText].color;
						}
						// PI
						
						
					}
				} else {
					hogi.img = '/images/care/common/radi_04_color.png';
					
					//PI
					hogi.imgPi = '/images/care/common/radi_04_color.png';
				}
				
				//시운전중 처리
				if(hogi.nowDiv == 'DC_TEST'){
					hogi.height = 150;
					hogi.img = '/images/care/common/radi_01.png';
					
					//PI
					hogi.heightPi = 150;
					hogi.imgPi = '/images/care/common/radi_01.png';
				}
		    },
	    	updateTime() {
	        	this.currentTime = moment().format('YYYY년 MM월 DD일  A hh:mm:ss');
	        },
	        subscribe: function() {
	    		ws.subscribe("/sub/data/npp_data/all", function(message) {
	                var recv = JSON.parse(message.body);
	                vm.recvNppData(recv);
	            });
	    		
	    	},
	    	unsubscribe: function(id) {
	    		ws.unsubscribe("/sub/data/now_data/"+this.id, function(message) {
	                var recv = JSON.parse(message.body);
	                vm.recvMessage(recv);
	            });
	    	},
	    	simple_subscribe: function(id){
	    		ws.subscribe("/sub/data/now_data/"+id, function(message) {
	                var recv = JSON.parse(message.body);
	                vm.recvMessage(recv);
	            });
	    		
	    		ws.subscribe("/sub/data/erms_data/ermsall", function(message) {
	                var recv = JSON.parse(message.body);
	                vm.recvErmsData(recv);
	            });
	    		ws.subscribe("/sub/data/weather_data/weatherall", function(message) {
	                var recv = JSON.parse(message.body);
	                var data = JSON.parse(recv.data);
	                var weather = data.find(function(w) {
		     			if(vm.npp == "NWSN"){
		     				return w.npp == "WSN";
		     			}
		     			else{
		     				return w.npp == vm.npp;
		     			}
		     		});
	                
	                vm.bindWeather(weather);
	            });
	    	},
	    	bindWeather(data) {
	        	var params = vm.weather.params.Other;
	 			if(vm.npp == "HAN") {
	 				params = vm.weather.params.HAN;
	 			}
	 			var _params = Object.keys(params);
	 			_params.forEach(function(key) {
					var tag = data.list.find(function(d) {
						return d.tag == params[key];
					});
					
					vm.weather.data[key] = ( 
							tag.val != undefined ? tag.val.toFixed(1) : '' );
				});
	        },
	    	recvErmsData: function(recv) {
	    		var data = JSON.parse(recv.data);
	    		var erms = data.find(function(r) {
	     			if(vm.npp == "NWSN"){
	     				return r.npp == "WSN";
	     			}
	     			else if(vm.npp == "NKRN" &&(vm.hogi == "1" || vm.hogi == "2")){
	     				return r.npp == "KRN";
	     			}
	     			else{
	     				return r.npp == vm.npp;
	     			}
	     			
	     		});
	     		
	    		vm.erms = erms.list;
	    		
	    	},
	    	recvNppData: function(recv) {
	    		var d = JSON.parse(recv.data);
	    		var Npp_sub;
	    		
	    		if(d.Hogi == '0' || d.Hogi == '8'){
	    			return true;
	    		}
	    		
	    		if(d.Npp.substring(0,1) == 'N'){
	    			if(d.Npp == 'NKRN' && (d.Hogi == '3' || d.Hogi == '4')){
	    				Npp_sub = d.Npp;
	    			}
	    			else{
	    				Npp_sub = d.Npp.substring(1,d.Npp.length);
	    			}
	    		}
	    		else{
	    			Npp_sub = d.Npp;
	    		}
	    		
	    		// 풋터 조정
	    		var npp = vm.nppList.find(function(f) {
	    			return f.dNpp == Npp_sub;
	    		});
	    		
	    		var hogi = npp.hogiList.find(function(h) {
	    			return h.hogi == d.Npp + d.Hogi;
	    		});
	    		
	    		if(hogi) {
	    			vm.buildHogiData(hogi, d);
	    		}
	    		
	    		if(hogi.hogi == this.npp + this.hogi){
	    			vm.recvMessage(d);
	    		}
	    	},
	    	recvMessage: function(recv) {
	    		if(recv.data) {
	    			vm.tags = JSON.parse(recv.data).tags;	
// 	    			vm.header.pwr = vm.tags[vm.header.pwrTag];
// 		    		vm.header.tbn = vm.tags[vm.header.tbnTag];
	    			vm.updateKey += 1;
	    		}
	    		else{
	    			var nowDate = new Date();
		     		var header_now_workDate = new Date(recv.WorkDate);
		     		var header_now_workDate_pi = new Date(recv.WorkDatePi);
		     		var header_failureTime_PMS = vm.nowDateGetTime - header_now_workDate.getTime();
		     		var header_failureTime_PI = vm.nowDateGetTime - header_now_workDate_pi.getTime(); //운영
		     		
		     		
		    		
		     		if(header_failureTime_PMS > 3600000 && (header_failureTime_PI > 3600000 || recv.WorkDatePi == undefined)){
		    			vm.header.failureTimeYn = "Y";
		    		}
		     		else{
		     			vm.header.failureTimeYn = "N";
		     		}
		     		
		     		if(header_failureTime_PMS > 600000){
		     			vm.header.changePiPms = "Y";
		     		}
		     		else{
		     			vm.header.changePiPms = "N";
		     		}
		     		
		     		if(recv.Npp){
		     			vm.header = {
								npp : recv.Npp,
								hogi : recv.Hogi,
			     				condition: recv.NowDiv,
			     				displayText: recv.NowDivText,
			     				pwr: recv.Pwr.toFixed(2),
			     				piPwr: recv.PwrPi.toFixed(2),
			     				tbn: recv.Tbn.toFixed(1),
			     				piTbn: recv.TbnPi.toFixed(1),
			     				now_workDate: moment(header_now_workDate).format('YYYY년 MM월 DD일  A hh:mm:ss'),
			     				now_workDate_pi: moment(header_now_workDate_pi).format('YYYY년 MM월 DD일  A hh:mm:ss')
			 			};
		     		}
		   			
	    		}
	    		
	        },
	    	detailModal: function(bbs) {
	    		var _this = this;
				vm.bbs = bbs;
	    		
	    		this.updateViews(bbs, function(){    
	    		}); 
	    		
	    		this.searchDetailFile(bbs, function(){ 
	    		});
	    		 
	    		this.showDetailModal = true;
	    		
	    		// 상세보기 스크롤 사용
	    		_this.$nextTick(function() {
	    			
	    			editor = new toastui.Editor.factory({
	    	    	    el: document.querySelector('#editSection'),
	    	    	    previewStyle: 'vertical',
	    	    	    initialEditType: 'wysiwyg',
	    	    	    height: '500px', 
	    	    	    viewer: true,
	    	    	    
	        		}); 
	    			
	    			$('.viewerScrollbar').mCustomScrollbar({ theme:"minimal-dark", scrollInertia:400 });
	    			
	    			var elem = $('div.detailmodal .modal-body div.detailCntn'); 
	    			$(elem).mCustomScrollbar({theme:'minimal-dark', scrollInertia: 400}); 
	    		});
	    		
	    	},
	    	searchDetailFile: function(bbs, callback) {
				var _this = this;
				axios.post('/monitor/detail/fileList.do',{artcNo: bbs.bbsSeq }).then(function(response) {
					_this.file.fileList = response.data.list;
					
					if(typeof callback === "function") {
						callback();						
					}					
				}, function(error) {
					alert("첨부파일을 가져오지 못했습니다.");
				});
			},
			updateViews: function(bbs, callback){
				var _this = this;
				axios.post('/monitor/detail/updateViews.do',{bbsSeq: bbs.bbsSeq }).then(function(response) {
				}, function(error) {
					alert("오류가 발생했습니다.");
				});
			},
	    	downloadFile: function(file){
		    	// POST 방식
// 		    	$('#downloadFile').submit();  
		    	$('#file' + file.sn).submit();
	   		},
	   		getNtp: function(){
	   			axios.post('/monitor/getNtp.do',{}).then(function(response) {
	   				vm.currentTime = moment(response.data.currentTime).format('YYYY년 MM월 DD일  A hh:mm:ss');
	   				vm.nowDateGetTime = response.data.currentTime;
				}, function(error) {
					console.log(error);
				});
	   		},
	   		systemNtp: function(){
	   			axios.post('/monitor/systemNtp.do',{}).then(function(response) {
	   				vm.currentTime = moment(response.data.currentTime).format('YYYY년 MM월 DD일  A hh:mm:ss');
	   				vm.nowDateGetTime = response.data.currentTime;
				}, function(error) {
					console.log(error);
				});
	   		}
			
// 	   		PrivacyIndex : function(){
// 	   			alert("협의를 통해 사전지정된 기관담당자가 소속기관의 실무반 계정을 관리하기 위해 최초 신청하는 페이지입니다.\n"+
// 	   					"방재요원의 주기적인 인사인동, 잦은 비밀번호 분실 등으로 인해 개인별 사용신청은 받지 않고, "+
// 	   					"소속기관 방사능방재 업무담당자에게 접속계정(ID, PW)를 문의하시기 바랍니다.")
// 	   			var link = '/com/PrivacyIndex.do';
// 	   			location.href = link;
// 	   		}
	    }
	});
</script>


<style>
	.not_use { color: #C8C8C8; text-decoration: line-through; }
	.contents > div.right { display: flex; height: 100%; }
	.contents > div.right > div { margin: auto 2rem auto auto; }
	div.search button:hover:enabled { background: #bbccf4 !important; color: white;}
	
	/** 모달 시작 **/
	.modal-mask { position: fixed; z-index: 9998; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); display: table; transition: opacity 0.3s ease; }
	.modal-wrapper { display: table-cell; vertical-align: middle; }
	.modal-container {font-weight: 300; vertical-align: middle; font-size: 15px; min-height: 258px; max-height: 800px; min-width: 600px; width: 50%; margin: 0px auto; padding: 60px 30px; background-color: #fff; border-radius: 2px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.33); transition: all 0.3s ease; }
	.modal-header h3 { margin-top: 0; color: #42b983; }
	.modal-body { margin: 0 0 20px 0; }
	.modal-default-button { float: right; }
	.modal-footer { min-height: 40px; }
	
	.modal-mask.detailmodal div.count { float: right; line-height: 45px; margin-right: 1rem; margin-top: 10px; }
	.modal-mask.detailmodal div.contents { max-height: 684px; } 

	.modal-enter { opacity: 0; }
	.modal-leave-active { opacity: 0; }
	.modal-enter .modal-container, .modal-leave-active .modal-container { -webkit-transform: scale(1.1); transform: scale(1.1); }
	/** 모달 끝 **/
	
	/** 취소 버튼 **/
	.pop_btn_cancle { background: #f0f0f0 !important; color: #426096 !important; }
	.pop_btn_cancle:hover:enabled { opacity: 0.2 !important; }
	
	/** 텍스트 Area **/
	.textarea2 { font-size: 14px; color: #426096; font-weight: 500; font-family: 'Noto Sans KR','Nanum Gothic', sans-serif,serif; }
	
	/** 코드 & 코드명 스타일 처리 **/
	table.normal td > span, table.sub_table td > span { cursor: pointer; }
	table.normal td > span:hover, table.sub_table td > span:hover { color: #426096; }
		
	table.hd_table input[type=text]:read-only { background-color: #f0f0f0; }
	
	/** 테이블 작업(수정, 삭제) 아이콘 **/
	table.normal td > span > i { font-size: 1.5rem; }  
	
	/** 체크 박스 **/
	input[type=checkbox] { zoom: 1.3; position: relative; top: 2px; left:0px; }
	
	/** 모달 버튼 **/ 
	.modal-container {padding-bottom: 60px; padding-top: 10px;}
	
	/* 상세보기화면 내용 사이즈 */ 
	
   	#detailCntn {max-height:400px; overflow-y: auto ; overflow-x: auto}; 
   	
   	/* mCustomScrollbar */
   	.mCustomScrollBox img {max-width: 100%;}
   	.mCustomScrollbar img {max-width: 100%;}
   	.mCustomScrollbar{ -ms-touch-action: pinch-zoom; touch-action: pinch-zoom;max-height: 400px; /* direct pointer events to js */ }
	.mCustomScrollbar.mCS_no_scrollbar, .mCustomScrollbar.mCS_touch_action { -ms-touch-action: auto; touch-action: auto;max-height: 400px; overflow-y: auto;  }
	
	/* 첨부파일 DIV 영역*/
	.fileDiv {height: 100px; overflow: auto; padding: 10px;}  
	.updateFileDiv {padding:10px; max-height: 100px; overflow-y: auto;}   
</style>

</html>