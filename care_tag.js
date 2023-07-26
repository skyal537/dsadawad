/**
 * 모니터링 화면 계통도 변수 관련 컴포넌트
 */

Vue.component('care-tag', {
	template: '<td :alt="alt" :char="char" :class="[ {is_condtion_on : conditionOne }, {is_condtion_two : conditionTwo }, {is_condtion_shadow : conditionfour}]" v-bind:title="name" @click="click" @mousemove="mousemove" @mouseout="mouseout"><span>{{ result }}</span></td>',
	props: {
		value: {
			type: Number,
			required: true
		},
		taginfo: {
			type: Object,
			required: false
		},
		trendTags: {
			type: String,
			required: false
		},
		name: {
			type: String,
			required: true
		},
		exponential: {
			type: String,
			required: true
		},
		/* 매핑 끝나고 필시 지울 것 Start */
		shouldbind: {
			type: Boolean,
			required: false
		},
		tagnm:{
			type: String,
			required: true
		}
		/* 매핑 끝나고 필시 지울 것 End */
	},
	computed: {
	    result: function () {
	    	
	    	/* 매핑 끝나고 필시 지울 것 Start */ 
//	    	if(this.shouldbind) return 'empty';
//	    	if(!this.taginfo) return 'empty';
	    	/* 매핑 끝나고 필시 지울 것  End*/
	    	
	    	if(!this.taginfo){
	    		return this.tagnm;
	    	}

	    	if(this.value != undefined) {	   		    		
//	    		if(this.taginfo.tagUnit == '%' && this.taginfo.tagNm == 'CTNJ') {
//	    			return (this.value * 100).toFixed(2) + ' ' + this.taginfo.tagUnit;		
//	    		} else if(this.taginfo.tagUnit) {
//	    			
//	    			if(this.value.toFixed(3) == 0){
//	    				return this.value + ' ' + this.taginfo.tagUnit;
//	    			} else {
//	    				return this.value.toFixed(2) + ' ' + this.taginfo.tagUnit;
//	    			}
//	    			
//	    		}
	    		
	    		// 월성 AT 13,14 => 0 정상 ,1 비정상 
	    		if(this.taginfo.npp == 'WSN'){
	    			if(this.taginfo.tagNm.includes("3167_0") || this.taginfo.tagNm.includes("3167_2")
	    					|| this.taginfo.tagNm.includes("3176_0") || this.taginfo.tagNm.includes("3176_2")
	    					|| this.taginfo.tagNm.includes("3210_0") || this.taginfo.tagNm.includes("3210_2")){
	    				if(this.value == '0'){
	    					return "정상";
	    				}
	    				else if(this.value == '1'){
	    					return "비정상";
	    				}
	    			}
	    		}
	    		
	    		if(this.taginfo.tagNm == '_St10m' || this.taginfo.tagNm == '_St38m' || this.taginfo.tagNm == '_Stb'){
	    			
	    			if(this.value <= -1.9){
	    				return this.value + "(심한 불안전,A)";
					}
					else if(this.value <= -1.7){
						return this.value + "(불안전,B)";
					}
					else if(this.value <= -1.5){
						return this.value + "(약한 불안정,C)";
					}
					else if(this.value <= -0.5){
						return this.value + "(중립,D)";
					}
					else if(this.value <= 1.5){
						return this.value + "(약한 안정,E)";
					}
					else if(this.value <= 4.0){
						return this.value + "(안정,F)";
					}
					else{
						return this.value + "(심한 안정,G)";
					}
	    		}
	    		
	    		
	    		// RCS 유량 및 증기 유량 //지수표기법
	    		if(this.exponential == "Y"){
	    			
	    			if(this.taginfo.tagUnit) {
		    			return this.value.toExponential(2) + ' ' + this.taginfo.tagUnit;
		    		}
		    		else{
		    			return this.value.toExponential(2);
		    		}
	    			
	    		}
	    		
	    			    			
	    		if(this.taginfo.tagUnit) {
	    			
	    			if(this.value.toFixed(3) == 0){
	    				return this.value + ' ' + this.taginfo.tagUnit;
	    			} else {
	    				return parseFloat(this.value.toFixed(2)) + ' ' + this.taginfo.tagUnit;
	    			}
	    			
	    		}
	    		else{
	    			if(this.value.toFixed(3) == 0){
	    				return this.value;
	    			} else {
	    				return parseFloat(this.value.toFixed(2));
	    			}
	    		}
	    		
	    		return this.value;
	    	}
	    	else 
	    		return ""
		},
		conditionfour: function() {
			if(this.taginfo){
				if(this.taginfo.npp == 'KRN' && this.taginfo.hogi == '1'){
					if(this.taginfo.tagNm == "L0440A" ||
						this.taginfo.tagNm == "T1311A" ||
						this.taginfo.tagNm == "_T1311A" ||
						this.taginfo.tagNm == "T1311A" ||
						this.taginfo.tagNm == "L1304A" ||
						this.taginfo.tagNm == "_L1304A" ||
						this.taginfo.tagNm == "T3754A" ||
						this.taginfo.tagNm == "_T3754A"
						){
						return "";
					}
					else{
						return true;
					}
				}
				return "";
			}
			return "";
		},
		conditionTwo: function() {
			if(this.taginfo) {
				
				var lolo = this.taginfo.tagLolo ? this.taginfo.tagLolo : "";
				var hihi = this.taginfo.tagHihi ? this.taginfo.tagHihi : "";

				if(lolo != "" || hihi != "")
	    		{
		    		if(parseFloat(this.value) >= parseFloat(hihi)) return true;
		    		if(parseFloat(this.value) <= parseFloat(lolo)) return true;
	    		}
		    	
			} 
			return "";
		},
		conditionOne: function() {
			if(this.taginfo) {
				
	    		var lo = this.taginfo.tagLo ? this.taginfo.tagLo : "";
				var hi = this.taginfo.tagHi ? this.taginfo.tagHi : "";
				var loCheck = this.taginfo.taglowCheck ? this.taginfo.taglowCheck : "";
				var hiCheck = this.taginfo.tagHiCheck ? this.taginfo.tagHiCheck : "";

				if(lo != "" || hi != "" || loCheck != "" || hiCheck != "" )
	    		{
		    		if(parseFloat(this.value) <= parseFloat(lo))	return true;
	    			if(parseFloat(this.value) >= parseFloat(hi)) return true;
	    			
	    		}
		    	
			} 
			return "";
		},
		alt: function() {
			if(this.taginfo) {
				
				//조합변수
				var union = "";
				var ref = ""; 
				var refNm = "";
				var refTag = "";
				
				if (this.taginfo.tagUnionCode)
				{
					union= "(조합)";		
				}
				
				if(this.taginfo.dataType == "PMS"){
					
					if(this.taginfo.tagNm.slice(0,2) == 'SC' && this.taginfo.npp == 'WSN'){
						refNm = '_SAVECORE' + this.taginfo.tagNm.slice(2);
					}
					else if(this.taginfo.tagNm.slice(0,2) == 'DT' && this.taginfo.npp == 'WSN'){
						refNm = '_DTAB' + this.taginfo.tagNm.slice(2);
					}
					else{
						refNm = '_' + this.taginfo.tagNm;
					}
					
					//RX출력 변수 PI는 _PWRRX_C
					if(this.taginfo.tagNm == 'CTNJ' || this.taginfo.tagNm == '_P' || this.taginfo.tagNm == '_CR101' || this.taginfo.tagNm == 'N0049'
						|| this.taginfo.tagNm == 'N0049A' || this.taginfo.tagNm == 'DT7' || this.taginfo.tagNm == 'CIJXBSCL' || this.taginfo.tagNm == 'M_9_731_J_PA_0048A09N_RX1'
							|| this.taginfo.tagNm == 'CX_CIJXBSCL' || this.taginfo.tagNm == 'RPN413EU'){
						
						if((this.taginfo.npp == 'NKRN' && (this.taginfo.hogi == '1' || this.taginfo.hogi == '2'))
								|| (this.taginfo.npp == 'NWSN' && (this.taginfo.hogi == '1' || this.taginfo.hogi == '2'))){
							refNm = '_pwrrx_C';
						}
						else if((this.taginfo.npp == 'UCN' && (this.taginfo.hogi == '5' || this.taginfo.hogi == '6'))
								|| (this.taginfo.npp == 'YGN' && (this.taginfo.hogi == '5' || this.taginfo.hogi == '6'))){
							refNm = '_pwrrx_c';
						}
						else{
							refNm = '_PWRRX_C';
						}
						
					}
					
					if(vm.tagInfos[refNm] != undefined){
						
						if(vm.tagInfos[refNm].tagUnit != undefined){
							ref = "</p><h5>PI데이터</h5><p>" + refNm + " : " + parseFloat(vm.tags[refNm].toFixed(2)) + ' ' + vm.tagInfos[refNm].tagUnit;
						}
						else{
							ref = "</p><h5>PI데이터</h5><p>" + refNm + " : " + parseFloat(vm.tags[refNm].toFixed(2));
						}
						
					}
				}
				else if(this.taginfo.dataType == "PI"){
					if(this.taginfo.tagNm.slice(0,9) == '_SAVECORE' && this.taginfo.npp == 'WSN'){
						refNm = 'SC' + this.taginfo.tagNm.slice(9);
					}
					else if(this.taginfo.tagNm.slice(0,5) == '_DTAB' && this.taginfo.npp == 'WSN'){
						refNm = 'DT' + this.taginfo.tagNm.slice(5);
					}
					else{
						refNm = this.taginfo.tagNm.substring(1);
					}
					
					if(vm.tagInfos[refNm] != undefined){
						
						if(vm.tagInfos[refNm].tagUnit != undefined){
							ref = "</p><h5>PMS데이터</h5><p>" + refNm + " : " + parseFloat(vm.tags[refNm].toFixed(2)) + ' ' + vm.tagInfos[refNm].tagUnit;
						}
						else{
							ref = "</p><h5>PMS데이터</h5><p>" + refNm + " : " + parseFloat(vm.tags[refNm].toFixed(2));
						}
						
					}
				}
				
				if(this.taginfo.tagRefDcr != undefined){
					refTag = "</p><h5>참조데이터</h5><p>" + this.taginfo.tagRefDcr;
				}
				
//				return "<h5>"+union+"변수명</h5><p>" + this.taginfo.tagNm + "</p>";
				
				if(this.taginfo.dataType == undefined){
					return "<h5>"+union+"변수명</h5><p>" + this.taginfo.tagNm + ref + refTag + "</p>";
				}
				else{
					return "<h5>"+union+"변수명</h5><p>" + this.taginfo.tagNm + "</p><h5>데이터타입</h5><p>" + this.taginfo.dataType + ref + refTag + "</p>";
				}
			} 
			return "";
		},
		char: function() {
			if(this.taginfo) {
							
				var eng = this.taginfo.tagEngDcr ? this.taginfo.tagEngDcr : "";
				var lo = this.taginfo.tagLo ? this.taginfo.tagLo : "";
				var lolo = this.taginfo.tagLolo ? this.taginfo.tagLolo : "";
				var hi = this.taginfo.tagHi ? this.taginfo.tagHi : "";
				var hihi = this.taginfo.tagHihi ? this.taginfo.tagHihi : "";
				var unionList = "";
				var unionUion = "";
				var groupList = [];
				var groupTags = [];
				var group = "";
				var groupUniques = [];
				var groupFound = {};
				var groupListTag = [];
				
				// 그룹변수 리스트 출력 start
				
//				if(this.taginfo.tagGroup){
//					var tagInfo = this.taginfo;
//					
//					vm.tagList.forEach(function (e) {
//						if(tagInfo.tagGroup == e.tagGroup){
//							groupList.push(e);	
//						}
//		     		});
//				}
//				
//				groupList.forEach(function(e){
//					var groupTag = "";
//					
//					if(e.dataType == "PMS"){
//						groupTag = e.tagNm;
//					}
//					if(e.dataType == "PI"){
//						groupTag = e.tagNm.substring(1, e.tagNm.length);
//					}
//					
//					groupListTag = groupList.filter((data) => {
//						
//						if(data.tagNm == groupTag){
//							return true;
//						}
//						else if(data.tagNm == "_" + groupTag){
//							return true;
//						}
//					});
//					
//					groupTags.push(groupListTag);
//				});
//				
//				for(var i = 0 ; i < groupTags.length ; i++){
//					var groupJson = JSON.stringify(groupTags[i]);
//					
//					if(groupFound[groupJson]){ continue;}
//					groupUniques.push(groupTags[i]);
//					groupFound[groupJson] = true;
//				}
//
//				groupTags = groupUniques;
//				
//				if(groupTags.length > 0){
//					
//					group = "<h5>그룹변수</h5><p>"
//					
//					groupTags.forEach(function(e){
//						
//						if(e[1]){
//							if(e[0].workDate >= e[1].workDate){
//								if(e[0].val.toFixed(3) != 0){
//				    				e[0].val = parseFloat(e[0].val.toFixed(2));
//				    			}
//								group += "(" + e[0].dataType + ") " + e[0].tagNm + " : " + e[0].val + " " + e[0].tagUnit + "<p>"; 
//							}
//							else{
//								if(e[1].val.toFixed(3) != 0){
//				    				e[1].val = parseFloat(e[1].val.toFixed(2));
//				    			}
//								group += "(" + e[1].dataType + ") " + e[1].tagNm + " : " + e[1].val + " " + e[1].tagUnit + "<p>";
//							}
//
//							
//						}
//						else{
//							if(e[0].val.toFixed(3) != 0){
//			    				e[0].val = parseFloat(e[0].val.toFixed(2));
//			    			}
//							group += "(" + e[0].dataType + ") " + e[0].tagNm + " : " + e[0].val + " " + e[0].tagUnit + "<p>";  
//						}
//					
//					});
//					
//					group = group.substr(0 , group.length - 3);
//				}
				
				group = '';
				
				// 그룹변수 리스트 출력 end
				
				if (this.taginfo.tagUnionCode)
				{
					unionList= "<h5>조합변수</h5><p>" + this.taginfo.tagUnionDcr;	
					unionUion= "<h5>조합규칙</h5><p>" + this.taginfo.tagUnionCode;						
				}
				
				return group + unionUion + unionList + "<h5>영문설명</h5><p>" + eng + "</p><h5>LOW</h5><p>" + lo + "</p><h5>LLOW</h5><p>" + lolo + 
					"</p><h5>HIGH</h5><p>" + hi + "</p><h5>HHIGH</h5><p>" + hihi + "</p>";
			}
			return "";
		},
		/* 매핑 끝나고 필시 지울 것 Start */
		noData: function() {
			if(this.taginfo) {
				return false;
			} else {
				return true;
			}
		}
		/* 매핑 끝나고 필시 지울 것 End */
	},    		
	watch: {
		value: function(newValue, oldValue) {
			if(oldValue != newValue) {
				this.tween();	
			}
		}
	},
	methods: {
		tween: function() {
			var _this = this;
			TweenMax.to(this.$el, 0.2, {alpha: 0, onComplete: function() {
				TweenMax.to(_this.$el, 0.2, {alpha: 1});
			}});
		},
		mousemove(e) {
	        $('#ly1').html(this.alt);
	        $('#ly2').html(this.char);
	        var ly_help_h = $('.ly_help').innerHeight() ;
	        if(e.pageY - ly_help_h < 80) {
	        	$('.ly_help').css({"top": e.pageY+"px","left": e.pageX+20+"px","background":"#fffc9d"});
	        } else {
	        	$('.ly_help').css({"top": e.pageY-ly_help_h+"px","left": e.pageX+20+"px","background":"#fffc9d"});	
	        }
	        
	        
	        $('.ly_help').stop().fadeIn(200);
		},
		mouseout() {
			$('.ly_help').stop().fadeOut(100);
		},
		click() {
			var _this = this;
			
			var finish = function(el) {
			//	custom.splitBarSetting();

				if ($(el).hasClass("mb_type02")) {
				/*	var ttt = $(el).parents(".vbox").find(".v_name")[0].textContent;
					$("#ta_title")[0].innerHTML = ttt;*/
				} else {
					document.getElementById("ta_title").innerHTML = el.title;
				}
				
				$('.ta_graph').mCustomScrollbar({theme:'minimal-dark', scrollInertia: 400});    
			};
			
			// 이전 구독 취소
		/*	for(var i=vm.recentSubscribeRawDataTags.length-1; i>=0; i--) {
				vm.raw_data_unsubscribe(vm.recentSubscribeRawDataTags[i].tagname, vm.recentSubscribeRawDataTags[i].type);
				vm.recentSubscribeRawDataTags.pop(vm.recentSubscribeRawDataTags[i]);
			}*/
			
//			for(var i=vm.recentSubscribeRawDataTags.length-1; i>=0; i--) {
//				vm.raw_data_unsubscribe(vm.recentSubscribeRawDataTags[i]);
//				vm.recentSubscribeRawDataTags.pop(vm.recentSubscribeRawDataTags[i]);
//			}
			
			$('#tag_real_trend_container').empty();
			var el = _this.$el;
			var shouldDrawChart = !$(el).hasClass("active");
			$(el).toggleClass("active");
			$(".mtrv_btn").not(el).removeClass("active");
			
			if(shouldDrawChart) {
				// 차트 그림
				this.drawChart(function() {
					document.getElementById("d1").style.height = "33%";
					document.getElementById("d2").style.height = "73%";
					
					finish(el);
				});
			} else {
				// 차트 숨김
				document.getElementById("d1").style.height = "0%";
				document.getElementById("d2").style.height = "100%";
				
				finish(el);
			}
		},
		drawChart(callback) {
			var _this = this; 
			
			if(this.taginfo == undefined) {
				return;
			}
			var tags = this.trendTags;
			if(!tags) {
				
				// 그룹변수 그래프 출력
//				if(this.taginfo.tagGroup){
//					tags = "";
//					
//					var tagList_length = vm.tagList.length;
//					
//					for(var i = 0 ; i < tagList_length ; i++){
//						if(vm.tagList[i].tagGroup == this.taginfo.tagGroup){
//							tags += "," + vm.tagList[i].tagNm;
//							if(vm.tagList[i].tagUnionDcr){
//								tags += "," + vm.tagList[i].tagUnionDcr;
//							}
//						}
//					}
//					
//					tags = tags.substr(1);
//				}
//				else{
//					if(this.taginfo.tagUnionDcr){
//						tags = this.taginfo.tagNm + "," + this.taginfo.tagUnionDcr;
//					}
//					else{
//
//						tags = this.taginfo.tagNm;
//					}
//					
//				}
				
//				if(this.taginfo.tagUnionDcr){
//					tags = this.taginfo.tagNm + "," + this.taginfo.tagUnionDcr;
//				}
				if(this.taginfo.tagRefDcr){
					tags = this.taginfo.tagNm + "," + this.taginfo.tagRefDcr;
				}
				else{

					tags = this.taginfo.tagNm;
				}
			}
			
			var arrTags = new Array(tags.split(','));
			
			var checkTags = new Array();
			
			var chk = true;
			
			//배열의 모든 데이터를 확인하기위한 반복문
			for(var i=0; i<arrTags[0].length; i++) {

			    //중복유무 초기화
			    chk = true;

			    //중복체크
			    //값을 담은 배열을 전체 반복하면서 담을 데이터와 담겨진 데이터를 비교
			    for(value in checkTags) {
			        //중복유무를 체크하여 값을 담을지 말지 결정
			        if(checkTags[value] == arrTags[0][i]) {
			            chk = false;
			        }
			    }

			    if(chk)
			    	checkTags.push(arrTags[0][i]);
			}
			
			// PI, PMS 이중화 표출
			var checkTagsSub = checkTags;
			var tagSub = "";
			for(var tag in checkTagsSub){
				if(vm.tagInfos[checkTags[tag]].dataType == 'PMS'){
					if(checkTags[tag].slice(0,2) == 'SC' && vm.tagInfos[checkTags[tag]].npp == 'WSN'){
						tagSub = '_SAVECORE' + checkTags[tag].slice(2);
						
						if(!(vm.tagInfos[tagSub] == undefined || vm.tagInfos[tagSub] == true)){
							checkTags.push(tagSub);
						}
					}
					else if(checkTags[tag].slice(0,2) == 'DT' && vm.tagInfos[checkTags[tag]].npp == 'WSN'){
						tagSub = '_DTAB' + checkTags[tag].slice(2);
						
						if(!(vm.tagInfos[tagSub] == undefined || vm.tagInfos[tagSub] == true)){
							checkTags.push(tagSub);
						}
					}
					else{
						//RX출력 변수 PI는 _PWRRX_C
						if(checkTags[tag] == 'CTNJ' || checkTags[tag] == '_P' || checkTags[tag] == '_CR101' || checkTags[tag] == 'N0049'
							|| checkTags[tag] == 'N0049A' || checkTags[tag] == 'DT7' || checkTags[tag] == 'CIJXBSCL' || checkTags[tag] == 'M_9_731_J_PA_0048A09N_RX1'
								|| checkTags[tag] == 'CX_CIJXBSCL' || checkTags[tag] == 'RPN413EU'){
							
							if((vm.tagInfos[checkTags[tag]].npp == 'NKRN' && (vm.tagInfos[checkTags[tag]].hogi == '1' || vm.tagInfos[checkTags[tag]].hogi == '2'))
									|| (vm.tagInfos[checkTags[tag]].npp == 'NWSN' && (vm.tagInfos[checkTags[tag]].hogi == '1' || vm.tagInfos[checkTags[tag]].hogi == '2'))){
								tagSub = '_pwrrx_C';
								checkTags.push(tagSub);
							}
							else if((vm.tagInfos[checkTags[tag]].npp == 'UCN' && (vm.tagInfos[checkTags[tag]].hogi == '5' || vm.tagInfos[checkTags[tag]].hogi == '6'))
									|| (vm.tagInfos[checkTags[tag]].npp == 'YGN' && (vm.tagInfos[checkTags[tag]].hogi == '5' || vm.tagInfos[checkTags[tag]].hogi == '6'))){
								tagSub = '_pwrrx_c';
								checkTags.push(tagSub);
							}
							else{
								tagSub = '_PWRRX_C';
								checkTags.push(tagSub);
							}
							
						}
						else{
							tagSub = '_' + checkTags[tag];
							
							if(!(vm.tagInfos[tagSub] == undefined || vm.tagInfos[tagSub] == true)){
								checkTags.push(tagSub);
							}
						}
					}
				}
				else if(vm.tagInfos[checkTags[tag]].dataType == 'PI'){
					if(checkTags[tag].slice(0,9) == '_SAVECORE' && vm.tagInfos[checkTags[tag]].npp == 'WSN'){
						tagSub = 'SC' + checkTags[tag].slice(9);

						if(!(vm.tagInfos[tagSub] == undefined || vm.tagInfos[tagSub] == true)){
							checkTags.push(tagSub);
						}
					}
					else if(checkTags[tag].slice(0,5) == '_DTAB' && vm.tagInfos[checkTags[tag]].npp == 'WSN'){
						tagSub = 'DT' + checkTags[tag].slice(5);

						if(!(vm.tagInfos[tagSub] == undefined || vm.tagInfos[tagSub] == true)){
							checkTags.push(tagSub);
						}
					}
					else{
						tagSub = checkTags[tag].substring(1);
						
						if(!(vm.tagInfos[tagSub] == undefined || vm.tagInfos[tagSub] == true)){
							checkTags.push(tagSub);
						}
					}
				}
			}
			
			
			tags = checkTags.join(",");
			
			axios.post('/monitor/realtime_trend.ajax',{npp:vm.npp, hogi: vm.hogi, tags: tags}).then(function(response) {
				if(typeof callback === 'function') {
					callback();
				} else {
					return;
				}
				
			 	var activity = response.data;
		        activity.tdata.forEach(function (dataset, i) {
		        	
		        	var titleNm;
		        	var titleTagNm;
		        	
		        	if(dataset.tagNm.charAt(0) == '_'){
		            	titleNm = dataset.tagNm.substring(1) + "(PI)";
		            	titleTagNm = dataset.tagNm.substring(1).toPascalCase() + "(pi)";
		            }
		            else{
		            	titleNm = dataset.tagNm;
		            	titleTagNm = dataset.tagNm.toPascalCase();
		            }
		        	
		        	
		            // Add X values (PMS)
//		            dataset.data = activity.cdata.map(function (row, j) {
//		            	
//		                return [row.workDate, parseFloat(row[dataset.tagNm.toPascalCase()])];
//		            });
		        	
		        	// Add X values (PMS/PI 나중에 삭제)
		        	dataset.data = activity.cdata[titleTagNm].map(function (row, j) {
		        		return [row.workDate, parseFloat(row.val)];
		        	});
		            //
		        	
		        	var dataLen = dataset.data.length;
		    		if(dataLen > 0){
		    			
		    			dataset.data.reverse();
		    			
		    			var difDate = dataset.data.length - 2
		    			var tmpData = [];
		    			
		    			/*if(npp == 'KNFC'){
		    				if(dataset.tagNm.includes('CR1') || dataset.tagNm.includes('CR2')){
		    					
		    					for(var j = 0 ; j <= difDate ; j++){
				    				
				    				if(dataset.data[j+1][0] - dataset.data[j][0] > 120000){
				    					
				    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
				    					
				    					var emptyDateDif = dataset.data[j][0];
				    					var emptyDateDifCnt = Math.floor((dataset.data[j+1][0] - dataset.data[j][0])/60000);
				    					for(var z = 0 ; z < emptyDateDifCnt ; z++){
				    						emptyDateDif = emptyDateDif + 60000;
				    						tmpData.push([emptyDateDif, null]);
				    					}
				    				}
				    				else{
				    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
				    				}
				    			}
		    					
		    				}
		    				else if(dataset.tagNm.includes('ERM')){
		    					
		    					for(var j = 0 ; j <= difDate ; j++){
				    				
				    				if(dataset.data[j+1][0] - dataset.data[j][0] > 600000){
				    					
				    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
				    					
				    					var emptyDateDif = dataset.data[j][0];
				    					var emptyDateDifCnt = Math.floor((dataset.data[j+1][0] - dataset.data[j][0])/300000);
				    					for(var z = 0 ; z < emptyDateDifCnt ; z++){
				    						emptyDateDif = emptyDateDif + 300000;
				    						tmpData.push([emptyDateDif, null]);
				    					}
				    				}
				    				else{
				    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
				    				}
				    			}
		    					
		    				}
		    				else if(dataset.tagNm.includes('ST101') || dataset.tagNm.includes('ST201') || dataset.tagNm.includes('ST202') || dataset.tagNm.includes('ST203')){
		    					
		    					for(var j = 0 ; j <= difDate ; j++){
				    				
				    				if(dataset.data[j+1][0] - dataset.data[j][0] > 3600000){
				    					
				    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
				    					
				    					var emptyDateDif = dataset.data[j][0];
				    					var emptyDateDifCnt = Math.floor((dataset.data[j+1][0] - dataset.data[j][0])/3600000);
				    					for(var z = 0 ; z < emptyDateDifCnt ; z++){
				    						emptyDateDif = emptyDateDif + 3600000;
				    						tmpData.push([emptyDateDif, null]);
				    					}
				    				}
				    				else{
				    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
				    				}
				    			}
		    					
		    				}
		    				else{
		    					
		    					for(var j = 0 ; j <= difDate ; j++){
				    				
				    				if(dataset.data[j+1][0] - dataset.data[j][0] > 900000){
				    					
				    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
				    					
				    					var emptyDateDif = dataset.data[j][0];
				    					var emptyDateDifCnt = Math.floor((dataset.data[j+1][0] - dataset.data[j][0])/600000);
				    					for(var z = 0 ; z < emptyDateDifCnt ; z++){
				    						emptyDateDif = emptyDateDif + 600000;
				    						tmpData.push([emptyDateDif, null]);
				    					}
				    				}
				    				else{
				    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
				    				}
				    			}
		    					
		    				}
		    			}*/
		    			/*else if(npp == 'HAN'){
		    				for(var j = 0 ; j <= difDate ; j++){
			    				
			    				if(dataset.data[j+1][0] - dataset.data[j][0] > 120000){
			    					
			    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
			    					
			    					var emptyDateDif = dataset.data[j][0];
			    					var emptyDateDifCnt = Math.floor((dataset.data[j+1][0] - dataset.data[j][0])/60000);
			    					for(var z = 0 ; z < emptyDateDifCnt ; z++){
			    						emptyDateDif = emptyDateDif + 60000;
			    						tmpData.push([emptyDateDif, null]);
			    					}
			    				}
			    				else{
			    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
			    				}
			    			}
		    			}*/
		    			if(npp != null) {
		    				for(var j = 0 ; j <= difDate ; j++){
			    				
			    				if(dataset.data[j+1][0] - dataset.data[j][0] > 60000){
			    					
			    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
			    					
			    					var emptyDateDif = dataset.data[j][0];
			    					var emptyDateDifCnt = Math.floor((dataset.data[j+1][0] - dataset.data[j][0])/10000);
			    					for(var z = 0 ; z < emptyDateDifCnt ; z++){
			    						emptyDateDif = emptyDateDif + 10000;
			    						tmpData.push([emptyDateDif, null]);
			    					}
			    				}
			    				else{
			    					tmpData.push([dataset.data[j][0], dataset.data[j][1]]);
			    				}
			    			}
		    			}
		    			
		    			//마지막 데이터값
		    			tmpData.push([dataset.data[difDate+1][0], dataset.data[difDate+1][1]]);
		    			
		    			var endDate = new Date().getTime();
		    			var startDate = new Date();
		    			startDate.setHours(startDate.getHours() - 3);
		    			startDate = startDate.getTime();
		    			
		    			//뒷부분 null 처리
		    			if(endDate - dataset.data[difDate+1][0] > 60000){
		    				var emptyCnt = Math.floor((endDate - dataset.data[difDate+1][0])/10000);
		    				var lastDate = dataset.data[difDate+1][0];
		    				
		    				for(var ii = 0 ; ii < emptyCnt ; ii++){
		    					lastDate += 10000;
		    					tmpData.push([lastDate, null]);
		    				}
		    			}
		    			
		    			//앞부분 null 처리
		    			if(dataset.data[0][0] - startDate > 60000){
		    				var emptyCnt = Math.floor((dataset.data[0][0] - startDate)/10000);
		    				var firstDate = startDate;
		    				for(var jj = 0 ; jj < emptyCnt ; jj++){
		    					firstDate += 10000;
		    					tmpData.push([firstDate, null]);
		    					
		    				}
		    			}
		    			
		    			//시간값 sort
		    			dataset.data = tmpData.sort((a, b) => a[0] + a[1] - (b[0] + b[1]));
		    			
//		    			dataset.data = tmpData;
		    		}
		        	
		            var _unit = dataset.tagUnit;
		    		if(_unit == undefined) _unit = '';

		            var chartDiv = document.createElement('div');
		            chartDiv.className = 'chart';				            
		            document.getElementById('tag_real_trend_container').appendChild(chartDiv);
		            
		            //var el = $('<div class="y-axis-adjust"><i class="fas fa-sliders-h"></i></div>');
		            //$(chartDiv).append(el);
		            
		            // 오더 부여	
		            var chart = Highcharts.chart(chartDiv, {
		                chart: {
		                    marginLeft: 40, // Keep all charts left aligned
		                    spacingTop: 20,
		                    spacingBottom: 20,
		                    isSynced: true,
		                    height: 180
		                },
		                exporting: { enabled: false },
		                title: {
		                    text: titleNm,
		                    align: 'left',
		                    margin: 0,
		                    x: 30
		                },
		                credits: {
		                    enabled: false
		                },
		                legend: {
		                    enabled: false
		                },
		                xAxis: {
		                    crosshair: true,
		                    type: 'datetime'
		                },
		                yAxis: {
//		                	min: 0,
		                    title: {
		                        text: null
		                    }
		                },
		                tooltip: {
		                    positioner: function () {
		                        return {
		                            // right aligned
		                            x: this.chart.chartWidth - this.label.width,
		                            y: 10 // align to title
		                        };
		                    },
		                    borderWidth: 0,
		                    backgroundColor: 'none',
		                    pointFormat: '{point.y}',
		                    headerFormat: '',
		                    shadow: false,
		                    style: {
		                        fontSize: '18px'
		                    },
		                    formatter:function(){
		                    		if(this.y.toFixed(3) == 0){
		                    			if(dataset.tagUnit == undefined){
		                    				return this.y;
		                    			}
		                    			else{
		                    				return this.y + ' ' + dataset.tagUnit;
		                    			}
			                    	} else{
			                    		if(dataset.tagUnit == undefined){
			                    			return this.y.toFixed(4);
			                    		}
			                    		else{
			                    			return this.y.toFixed(4) + ' ' + dataset.tagUnit;
			                    		}
				                        
			                    	}
		                        }
//		                    valueDecimals: 4
		                    
		                },
		                series: [{
		                    data: dataset.data,
		                    name: dataset.tagNm,
		                    type: 'spline',
		                    color: Highcharts.getOptions().colors[i],
		                    fillOpacity: 0.3,
		                    tooltip: {
		                        valueSuffix: ' ' + dataset.tagUnit
		                    }
	                	}]
	            	}, 
	            	function(chart) {
	            		var el = document.createElement('div');
			            el.className = 'y-axis-adjust';
			            el.innerHTML = '<i class="fas fa-sliders-h"></i>';
			            chartDiv.appendChild(el);
	            	});
		            
		            chart.tag = dataset.tagNm;
		            
//		            vm.raw_data_subscribe(dataset.tagNm);
//	   				vm.recentSubscribeRawDataTags.push(dataset.tagNm);
		            
		            vm.raw_data_subscribe(dataset.tagNm, dataset.dataType);
   					vm.recentSubscribeRawDataTags.push({tagname : dataset.tagNm, type : dataset.dataType});
	        	});
		        
		        const template = document.getElementById('y-axis-adjust-template');
				tippy('.y-axis-adjust', {
            		content: template.innerHTML,
            		allowHTML: true,
					trigger: 'click',
					interactive: true,
					onHide(instance) {
						var newMin = $(instance.popper).find('input[name=min]').val();
						var newMax = $(instance.popper).find('input[name=max]').val();
						if(!newMin && !newMax) return true;

						$(instance.reference).parent().highcharts().yAxis[0].update({min: newMin, max: newMax});
				  	},
			  	 	onShow(instance) {
				  		var yaxis = $(instance.reference).parent().highcharts().yAxis[0];
				  		$(instance.popper).find('input[name=min]').val(yaxis.min);
						$(instance.popper).find('input[name=max]').val(yaxis.max);
					}
				});
		       
        	}, function(response) {
        		console.log(response);
        		Toast.error("데이터 조회 중 에러가 발생하였습니다.");
        	});
		}
	}
});