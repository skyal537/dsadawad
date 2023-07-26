<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

			<section id="container">
				<article class="lnb">
					<ul>
						<li class="option_box"><a href="" class="ob_title">Reactor Protection Signal</a>
							<table>
								<caption></caption>
								<colgroup>
									<col style="width:33.33%;">
									<col style="width:33.33%;">
									<col style="width:33.33%;">
								</colgroup>
								<thead></thead>
								<tbody>
									<tr>
										<td is="care-status" name="MANUAL" :value="tags.MANUAL" :taginfo="tagInfos.MANUAL" :key="updateKey"></td>
										<td is="care-status" name="SR HI FLUX" :value="tags._ND0036" :taginfo="tagInfos._ND0036" :key="updateKey"></td>
										<td is="care-status" name="IR HI FLUX" :value="tags._ND0024" :taginfo="tagInfos._ND0024" :key="updateKey"></td>
									</tr>
									<tr>
										<td is="care-status" name="PR HI FLUX LO S.P" :value="tags._ND0010" :taginfo="tagInfos._ND0010" :key="updateKey"></td>
										<td is="care-status" name="PR HI FLUX HI S.P" :value="tags._ND0005" :taginfo="tagInfos._ND0005" :key="updateKey"></td>
										<td is="care-status" name="PR HI FLUX RATE" :value="tags._ND0029" :taginfo="tagInfos._ND0029" :key="updateKey"></td>
									</tr>
									<tr>
										<td is="care-status" name="OT△T" :value="tags._TD0498" :taginfo="tagInfos._TD0498" :key="updateKey"></td>
										<td is="care-status" name="OP△T" :value="tags._TD0499" :taginfo="tagInfos._TD0499" :key="updateKey"></td>
										<td is="care-status" name="PZR Lo Pr" :value="tags._PD0488" :taginfo="tagInfos._PD0488" :key="updateKey"></td>
									</tr>
									<tr>
										<td is="care-status" name="PZR HI PR" :value="tags._PD0483" :taginfo="tagInfos._PD0483" :key="updateKey"></td>
										<td is="care-status" name="PZR HI LVL" :value="tags._LD0483" :taginfo="tagInfos._LD0483" :key="updateKey"></td>
										<td is="care-status" name="RCS LO FLOW" :value="tags.RCS_LO_FLOW" :taginfo="tagInfos.RCS_LO_FLOW" :key="updateKey"></td>
									</tr>
									<tr>
										<td is="care-status" name="RCP BUS U.V" :value="tags._VD0324" :taginfo="tagInfos._VD0324" :key="updateKey"></td>
										<td is="care-status" name="RCP BUS U.F" :value="tags._YD0324" :taginfo="tagInfos._YD0324" :key="updateKey"></td>
										<td is="care-status" name="S/G LO LO LVL" :value="tags.SG_LO_LO_LVL" :taginfo="tagInfos.SG_LO_LO_LVL" :key="updateKey"></td>
									</tr>
									<tr>
										<td is="care-status" name="SIAS" :value="tags.SIAS" :taginfo="tagInfos.SIAS" :key="updateKey"></td>
										<td is="care-status" name="TBN Trip" :value="tags._YD0390" :taginfo="tagInfos._YD0390" :key="updateKey"></td>
										<td is="care-status" name="ASTS" :value="tags._YD3600" :taginfo="tagInfos._YD3600" :key="updateKey"></td>
									</tr>
								</tbody>
							</table>
						</li>
						<li class="option_box"><a href="" class="ob_title">ESFAS Status</a>
							<table>
								<caption></caption>
								<colgroup>
									<col style="width:0%;">
									<col style="width:25%;">
									<col style="width:25%;">
									<col style="width:25%;">
									<col style="width:25%;">
								</colgroup>
								<thead></thead>
								<tbody>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="SIAS TRN A" :value="tags.MD1911" :taginfo="tagInfos.MD1911" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="SIAS TRN B" :value="tags.MD1921" :taginfo="tagInfos.MD1921" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="CSS TRN A" :value="tags.MD1913" :taginfo="tagInfos.MD1913" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="CSS TRN B" :value="tags.MD1923" :taginfo="tagInfos.MD1923" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="CIS-A TRN A" :value="tags.MD1912" :taginfo="tagInfos.MD1912" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="CIS-A TRN B" :value="tags.MD1922" :taginfo="tagInfos.MD1922" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="LOV TRN A" :value="tags._MD3213" :taginfo="tagInfos._MD3213" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="LOV TRN B" :value="tags._MD3223" :taginfo="tagInfos._MD3223" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="CIS-B TRN A" :value="tags.MD1913" :taginfo="tagInfos.MD1913" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="CIS-B TRN B" :value="tags.MD1923" :taginfo="tagInfos.MD1923" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="CPIS TRN A" :value="tags._MD3216" :taginfo="tagInfos._MD3216" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="CPIS TRN B" :value="tags._MD3226" :taginfo="tagInfos._MD3226" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="AFAS(MD) TRN A" :value="tags._MD3218" :taginfo="tagInfos._MD3218" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="AFAS(MD) TRN B" :value="tags._MD3228" :taginfo="tagInfos._MD3228" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="AFAS(TD) TRN A" :value="tags._MD3219" :taginfo="tagInfos._MD3219" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="AFAS(TD) TRN B" :value="tags._MD3229" :taginfo="tagInfos._MD3229" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="MSIS TRN A" :value="tags._MD3217" :taginfo="tagInfos._MD3217" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="MSIS TRN B" :value="tags._MD3227" :taginfo="tagInfos._MD3227" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="FWIS TRN A" :value="tags._MD1914" :taginfo="tagInfos._MD1914" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="FWIS TRN B" :value="tags._MD1924" :taginfo="tagInfos._MD1924" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="CREVS TRN A" :value="tags._MD2993" :taginfo="tagInfos._MD2993" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="CREVS TRN B" :value="tags._MD2994" :taginfo="tagInfos._MD2994" :key="updateKey"></td>
									</tr>
									<tr>
										<td></td>
										<td is="care-status" colspan="2" type="espas" name="FBEVS TRN A" :value="tags._MD2989" :taginfo="tagInfos._MD2989" :key="updateKey"></td>
										<td is="care-status" colspan="2" type="espas" name="FBEVS TRN B" :value="tags._MD2990" :taginfo="tagInfos._MD2990" :key="updateKey"></td>
									</tr>
								</tbody>
							</table>
						</li>
						<li class="option_box"><a href="" class="ob_title">SPDS</a>
							<table>
								<caption></caption>
								<colgroup>
									<col style="width:33.33%;">
									<col style="width:33.33%;">
									<col style="width:33.33%;">
								</colgroup>
								<thead></thead>
								<tbody>
									 <tr>
									 	<td is="care-spds-status" name="SUBCRITICALITY" name2="ko3_Subcriticality" tab="ko3sp1" :taginfo="tagInfos._U8110" :key="updateKey"></td>
									 	<td is="care-spds-status" name="CORECOLLING" name2="ko3_CoreCooling" tab="ko3sp2" :taginfo="tagInfos._U8130" :key="updateKey"></td>
									 	<td is="care-spds-status" name="HEAT SINK" name2="ko3_Heat_Sink" tab="ko3sp3" :taginfo="tagInfos._U8150" :key="updateKey"></td>
							        </tr>
							        <tr>
							        	<td is="care-spds-status" name="RCS INTEGRITY" name2="ko3_RCS_Integrity" tab="ko3sp4" :taginfo="tagInfos._U8170" :key="updateKey"></td>
									 	<td is="care-spds-status" name="CV INTEGRITY" name2="ko3_Containment_Integrity" tab="ko3sp5" :taginfo="tagInfos._U8190" :key="updateKey"></td>
									 	<td is="care-spds-status" name="RCS INVENTORY" name2="ko3_RCS_Inventory" tab="ko3sp6" :taginfo="tagInfos._U8210" :key="updateKey"></td>
							        </tr>
							        <tr>
							            <td is="care-spds-status" name="RADIOACTIVITY CONTROL" name2="ko3_Radioactivity_Control" :taginfo="tagInfos._U8230" tab="ko3sp7" :key="updateKey"></td>
							            <td></td>
							            <td></td>
							        </tr>
								</tbody>
							</table>
						</li>
						<li class="option_box_mes"><a href="" class="ob_title">Major Equipment Status</a>
							<table>
								<caption></caption>
								<colgroup>
									<col style="width:*;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
								</colgroup>
								<thead></thead>
								<tbody>
									<tr>
										<td></td>
										<td>A</td>
										<td>B</td>
										<td>C</td>
										<td>D</td>
										<td>E</td>
										<td>F</td>
									</tr>
									<tr is="care-equip" name="RCP" :key="updateKey" :tags="[tagInfos.YD0031,tagInfos.YD0032,tagInfos.YD0033]" />
									<tr is="care-equip" name="CHGP" :key="updateKey" :tags="[tagInfos._YD0101,tagInfos._YD0102,tagInfos._YD0123,tagInfos._YD0124]" />
									<tr is="care-equip" name="CCWP" :key="updateKey" :tags="[tagInfos._YD2713,tagInfos._YD2714,tagInfos._YD2715,tagInfos._YD2716]" />
									<tr is="care-equip" name="NSCWP" :key="updateKey" :tags="[tagInfos._YD3073,tagInfos._YD3074,tagInfos._YD3075,tagInfos._YD3076]" />
									<tr is="care-equip" name="MFWP" :key="updateKey" :tags="[tagInfos._PD2006,tagInfos._PD2007,tagInfos._PD2008]" />
									<tr is="care-equip" name="COP" :key="updateKey" :tags="[tagInfos._YD2513,tagInfos._YD2514,tagInfos._YD2515,tagInfos._YD2516]" />
									<tr is="care-equip" name="RHRP" :key="updateKey" :tags="[tagInfos.YD0614,tagInfos.YD0615]" />
									<tr is="care-equip" name="CSP" :key="updateKey" :tags="[tagInfos.YD0950,tagInfos.YD0951]" />
									<tr is="care-equip" name="AFWP" :key="updateKey" :tags="[tagInfos._YD2301,tagInfos._YD2302,tagInfos._YD2990]" />
									<tr is="care-equip" name="CWP" :key="updateKey" :tags="[tagInfos._YD2085,tagInfos._YD2086,tagInfos._YD2087,tagInfos._YD2088,tagInfos._YD2089,tagInfos._YD2090]" />
									<tr is="care-equip" name="EDG" :key="updateKey" :tags="[tagInfos.YD3007,tagInfos.YD3008]" />
								</tbody>
							</table>
						</li>
					</ul>
				</article>
				<article class="content_wrap">
					<div class="content">
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
						<div class="at_block" id="d2">
						
							<!-- 2021.11 고리3 RMS 추가 -->
                            <script>
                            $(function(){
                                $(".rms").click(function(){
                                    $(".kori03_rms").toggleClass("on");
                                    $(".at_area").toggleClass("none");
                                });
                                $(".close_bt").click(function(){
                                    $(".kori03_rms").toggleClass("on");
                                    $(".at_area").toggleClass("none");
                                    $(".rms").toggleClass("on");
                                });
                                
                            });
                            </script> 
                            <div class="kori03_rms">
                                <div class="close_bt"><button><i class="xi-close"></i></button></div>
                                
                                <div class="kori03_rms_area">
                                    <div class="kori03_left">
                                        <div class="w100">
                                            <div class="box01 rbo01 vbox">
                                                <p class="v_name">CG013</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0013G" :taginfo="tagInfos._R0013G"/>
<!--                                                 <input type="text" class="nomal" value="2.451E+00" > -->
                                            </div>
                                            <div class="box01 rbo02 vbox">
                                                <p class="v_name">CG004</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0004G" :taginfo="tagInfos._R0004G"/>
                                            </div>
                                            <div class="box01 rbo03 vbox">
                                                <p class="v_name">BM410</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0410R" :taginfo="tagInfos._R0410R"/>
                                            </div>
                                            <div class="box01 rbo04 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0019R" :taginfo="tagInfos._R0019R"/>
                                                <p class="v_name">RC019</p>
                                            </div>
                                            <div class="box01 rbo05 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0029R" :taginfo="tagInfos._R0029R"/>
                                                <p class="v_name">RC029</p>
                                            </div>
                                            <div class="box01 rbo06 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0039R" :taginfo="tagInfos._R0039R"/>
                                                <p class="v_name">RC039</p>
                                            </div>
                                            <div class="box01 rbo07 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0001R" :taginfo="tagInfos._R0001R"/>
                                                <p class="v_name">GT001</p>
                                            </div>
                                            <div class="box01 rbo08 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0132R" :taginfo="tagInfos._R0132R"/>
                                                <p class="v_name">GT132</p>
                                            </div>
                                            <div class="box01 rbo09 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0119G" :taginfo="tagInfos._R0119G"/>
                                                <p class="v_name">GT119</p>
                                            </div>
                                            <div class="box01 rbo10 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0220R" :taginfo="tagInfos._R0220R"/>
                                                <p class="v_name">GT220</p>
                                            </div>
                                            <div class="box01 rbo40 vbox">
                                                <p class="v_name">AK164</p>
                                            </div>
                                            
                                            
                                            <div class="box01 rbo11 vbox">
                                                <p class="v_name">GH060</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0060R" :taginfo="tagInfos._R0060R"/>
                                            </div>
                                            <div class="box01 rbo12 vbox">
                                                <p class="v_name">GH061</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0061R" :taginfo="tagInfos._R0061R"/>
                                            </div>
                                            <div class="box01 rbo13 vbox">
                                                <p class="v_name">GH062</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0062R" :taginfo="tagInfos._R0062R"/>
                                            </div>
                                            <div class="box01 rbo14 vbox">
                                                <p class="v_name">GH063</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0063R" :taginfo="tagInfos._R0063R"/>
                                            </div>
                                            <div class="box01 rbo15 vbox">
                                                <p class="v_name">GH162</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0162R" :taginfo="tagInfos._R0162R"/>
                                            </div>
                                            <div class="box01 rbo16 vbox">
                                                <p class="v_name">GH031</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0031P" :taginfo="tagInfos._R0031P"/>
                                            </div>
                                            <div class="box01 rbo17 vbox">
                                                <p class="v_name">GH038</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0038G" :taginfo="tagInfos._R0038G"/>
                                            </div>
                                            <div class="box01 rbo18 vbox">
                                                <p class="v_name">GH041</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0041G" :taginfo="tagInfos._R0041G"/>
                                            </div>
                                            <div class="box01 rbo19 vbox">
                                                <p class="v_name">HA008</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0008G" :taginfo="tagInfos._R0008G"/>
                                            </div>
                                            <div class="box01 rbo20 vbox">
                                                <p class="v_name">FA017</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0017R" :taginfo="tagInfos._R0017R"/>
                                            </div>
                                            <div class="box01 rbo21 vbox">
                                                <p class="v_name">HB082</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0082R" :taginfo="tagInfos._R0082R"/>
                                            </div>
                                            <div class="box01 rbo22 vbox">
                                                <p class="v_name">HB082A</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R082AR" :taginfo="tagInfos._R082AR"/>
                                            </div>
                                            <div class="box01 rbo23 vbox">
                                                <p class="v_name">HE016</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0016R" :taginfo="tagInfos._R0016R"/>
                                            </div>
                                            <div class="box01 rbo41 vbox">
                                                <p class="v_name">GT211</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0211G" :taginfo="tagInfos._R0211G"/>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0211I" :taginfo="tagInfos._R0211I"/>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0211P" :taginfo="tagInfos._R0211P"/>
                                            </div>
                                            
                                            
                                            <div class="box01 rbo24 vbox">
                                                <p class="v_name">GT002</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0002R" :taginfo="tagInfos._R0002R"/>
                                            </div>
                                            <div class="box01 rbo25 vbox">
                                                <p class="v_name">GT133</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0133R" :taginfo="tagInfos._R0133R"/>
                                            </div>
                                            <div class="box01 rbo26 vbox">
                                                <p class="v_name">GT119A</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R119AG" :taginfo="tagInfos._R119AG"/>
                                            </div>
                                            <div class="box01 rbo27 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0054R" :taginfo="tagInfos._R0054R"/>
                                                <p class="v_name">GK054</p>
                                            </div>
                                            <div class="box01 rbo28 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0128G" :taginfo="tagInfos._R0128G"/>
                                                <p class="v_name">GK128</p>
                                            </div>
                                            <div class="box01 rbo29 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0228G" :taginfo="tagInfos._R0228G"/>
                                                <p class="v_name">GK228</p>
                                            </div>
                                            <div class="box01 rbo30 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0113R" :taginfo="tagInfos._R0113R"/>
                                                <p class="v_name">GG113</p>
                                            </div>
                                            <div class="box01 rbo31 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0213G" :taginfo="tagInfos._R0213G"/>
                                                <p class="v_name">GG213</p>
                                            </div>
                                            <div class="box01 rbo32 vbox">
                                                <p class="v_name">GG018</p>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0018R" :taginfo="tagInfos._R0018R"/>
                                            </div>
                                            <div class="box01 rbo33 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0364R" :taginfo="tagInfos._R0364R"/>
                                                <p class="v_name">EG364</p>
                                            </div>
                                            
                                            <div class="box01 rbo34 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0009R" :taginfo="tagInfos._R0009R"/>
                                                <p class="v_name">GX009</p>
                                            </div>
                                            <div class="box01 rbo35 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0087R" :taginfo="tagInfos._R0087R"/>
                                                <p class="v_name">GL087</p>
                                            </div>
                                            <div class="box01 rbo42 vbox">
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0015G" :taginfo="tagInfos._R0015G"/>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0015I" :taginfo="tagInfos._R0015I"/>
                                                <input is="care-tag" class="mb_type02 nomal" :value="tags._R0015P" :taginfo="tagInfos._R0015P"/>
                                                <p class="v_name">GL015</p>
                                            </div>
                                            <div class="box01 rbo43 vbox">
                                                <p class="v_name">GL069</p>
                                            </div>
                                            <div class="box01 rbo44 vbox">
                                                <p class="v_name">HJ001</p>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <!--  고리3 RMS 끝 -->
						
							<div class="at_area kori_04">
								<!-- 계통도 펌프 -->
								<div class="pump_box">
									<div is="care-pump-pipe" name="pump_right csp" sub_name="motor" :key="updateKey" :tags="[tagInfos.YD0950,tagInfos.YD0951]"/></div>
									<div is="care-pump-pipe" name="pump_right sip" sub_name="motor" :key="updateKey" :tags="[tagInfos._MD0911,tagInfos._MD0921]"/></div>
									<div is="care-pump-pipe" name="pump_right scp" sub_name="motor" :key="updateKey" :tags="[tagInfos.YD0614,tagInfos.YD0615]"/></div>
									<div is="care-pump-pipe" name="pump_left afwp" sub_name="motor" :key="updateKey" :tags="[tagInfos._YD2301,tagInfos._YD2302,tagInfos._YD2990]"/></div>
									<div is="care-pump-pipe" name="pump_left mfwp" sub_name="motor" :key="updateKey" :tags="[tagInfos._PD2006,tagInfos._PD2007,tagInfos._PD2008]"/></div>
									<div is="care-pump-pipe" name="pump_left cop" sub_name="motor" :key="updateKey" :tags="[tagInfos._YD2513,tagInfos._YD2514,tagInfos._YD2515,tagInfos._YD2516]"/></div>
									<div is="care-pump-pipe" name="pump_left cwp" sub_name="motor" :key="updateKey" :tags="[tagInfos._YD2085,tagInfos._YD2086,tagInfos._YD2087,tagInfos._YD2088,tagInfos._YD2089,tagInfos._YD2090]"/></div>
								</div>
								<!--계통도 파이프 -->
								<div class="pipe_road">
									<div is="care-pump-pipe" name="pipe pp01 type01" sub_name="water_flow" :key="updateKey" :tags="[tagInfos.YD0950,tagInfos.YD0951]"/></div>
									<div is="care-pump-pipe" name="pipe pp01 type02" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._MD0911,tagInfos._MD0921]"/></div>
									<div is="care-pump-pipe" name="pipe pp01 type03" sub_name="water_flow" :key="updateKey" :tags="[tagInfos.YD0614,tagInfos.YD0615]"/></div>
									<div is="care-pump-pipe" name="pipe pp02" sub_name="water_flow" :key="updateKey" :tags="[tagInfos.YD0950,tagInfos.YD0951]"/></div>
									<div is="care-pump-pipe" name="pipe pp03" sub_name="water_flow" :key="updateKey" :tags="[tagInfos.YD0950,tagInfos.YD0951]"/></div>
									<div is="care-pump-pipe" name="pipe pp04" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._MD0911,tagInfos._MD0921]"/></div>
									<div is="care-pump-pipe" name="pipe pp05" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._MD0911,tagInfos._MD0921]"/></div>
									<div class="pipe pp40 on">
										<div class="water_flow"></div>
									</div>
									<div class="pipe pp06 on">
										<div class="water_flow"></div>
									</div>
									<div class="pipe pp07 on">
										<div class="water_flow"></div>
									</div>
									<div class="pipe pp08 on">
										<div class="water_flow"></div>
									</div>
									<div is="care-pump-pipe" name="pipe pp09" sub_name="water_flow" :key="updateKey" :tags="[tagInfos.YD0614,tagInfos.YD0615]"/></div>
									<div is="care-pump-pipe" name="pipe pp10" sub_name="water_flow" :key="updateKey" :tags="[tagInfos.YD0614,tagInfos.YD0615]"/></div>
									<div is="care-pump-pipe" name="pipe pp11" sub_name="water_flow" :key="updateKey" :tags="[tagInfos.YD0614,tagInfos.YD0615]"/></div>
									<div is="care-pump-pipe" name="pipe pp41" sub_name="water_flow" :key="updateKey" :tags="[tagInfos.YD0614,tagInfos.YD0615]"/></div>
									<div class="pipe pp12 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp13 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp14 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp15 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp16 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp17 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp18 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp19 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp20 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp21 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp22 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp23 on">
										<div class="water_flow high"></div>
									</div>
									<div class="pipe pp24 on">
										<div class="water_flow"></div>
									</div>
									<div class="pipe pp25 on">
										<div class="water_flow"></div>
									</div>
									<div class="pipe pp26 on">
										<div class="water_flow"></div>
									</div>
									<div is="care-pump-pipe" name="pipe pp27" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._YD2513,tagInfos._YD2514,tagInfos._YD2515,tagInfos._YD2516]"/></div>
									<div is="care-pump-pipe" name="pipe pp28" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._YD2513,tagInfos._YD2514,tagInfos._YD2515,tagInfos._YD2516]"/></div>
									<div is="care-pump-pipe" name="pipe pp29" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._PD2006,tagInfos._PD2007,tagInfos._PD2008]" :sub_tags="[tagInfos._YD2513,tagInfos._YD2514,tagInfos._YD2515,tagInfos._YD2516]"/></div>
									<div is="care-pump-pipe" name="pipe pp30" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._PD2006,tagInfos._PD2007,tagInfos._PD2008]" :sub_tags="[tagInfos._YD2513,tagInfos._YD2514,tagInfos._YD2515,tagInfos._YD2516]"/></div>
									<div is="care-pump-pipe" name="pipe pp31" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._PD2006,tagInfos._PD2007,tagInfos._PD2008]" :sub_tags="[tagInfos._YD2513,tagInfos._YD2514,tagInfos._YD2515,tagInfos._YD2516]"/></div>
									<div is="care-pump-pipe" name="pipe pp39" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._YD2301,tagInfos._YD2302,tagInfos._YD2990]"/></div>
									<div is="care-pump-pipe" name="pipe pp32" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._YD2301,tagInfos._YD2302,tagInfos._YD2990]"/></div>
									<div is="care-pump-pipe" name="pipe pp33" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._YD2301,tagInfos._YD2302,tagInfos._YD2990]"/></div>
									<div is="care-pump-pipe" name="pipe pp34" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._YD2301,tagInfos._YD2302,tagInfos._YD2990]"/></div>
									<div class="pipe pp35 on">
										<div class="water_flow"></div>
									</div>
									<div is="care-pump-pipe" name="pipe pp36" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._YD2085,tagInfos._YD2086,tagInfos._YD2087,tagInfos._YD2088,tagInfos._YD2089,tagInfos._YD2090]"/></div>
									<div is="care-pump-pipe" name="pipe pp37" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._YD2085,tagInfos._YD2086,tagInfos._YD2087,tagInfos._YD2088,tagInfos._YD2089,tagInfos._YD2090]"/></div>
									<div is="care-pump-pipe" name="pipe pp38" sub_name="water_flow" :key="updateKey" :tags="[tagInfos._YD2085,tagInfos._YD2086,tagInfos._YD2087,tagInfos._YD2088,tagInfos._YD2089,tagInfos._YD2090]"/></div>
								</div>
								<!-- 해수 -->
								<div class="wave_wrap">
									<div class="wave wi_01"></div>
									<div class="wave wi_02"></div>
									<div class="wave wi_03"></div>
								</div>
								<!--전력계통도-->
								<div class="at_el kori_03_04">
									<div class="system_box">
										<div class="h_line l_01"></div>
										
										
										<div is="care-sbo-status" cla="hd_line l_02 mtrv_btn tooltip_01" name="Class 4.16 kV" :value="tags._VD3009" :taginfo="tagInfos._VD3009" :key="updateKey" ></div>
										<div is="care-sbo-status" cla="hd_line l_03 mtrv_btn tooltip_01 info_left" name="Class 4.16 kV" :value="tags._VD3010" :taginfo="tagInfos._VD3010" :key="updateKey" ></div>
										<div class="hd_line l_04 mtrv_btn" ></div>
										<div class="hd_line l_05 mtrv_btn" ></div>
										<div class="hd_line l_06 mtrv_btn info_left" ></div>
										<div class="hd_line l_07 mtrv_btn info_left" ></div>
										
										<div class="hd_line l_08 mtrv_btn" ></div>
										<div class="hd_line l_09 mtrv_btn" ></div>
										<div class="hd_line l_10 mtrv_btn info_left" ></div>
										<div class="hd_line l_11 mtrv_btn info_left" ></div>
										
                                        <div class="v_line l_12"></div>
										<div class="v_line l_13"></div>
										<div class="v_line l_14"></div>
										
										<div class="v_line l_15"></div>
										<div class="v_line l_16"></div>
										<div class="v_line l_17"></div>
										
										<div class="v_line l_18"></div>
										<div class="v_line l_19"></div>
                                        
										<div class="v_line l_27"></div>
										<div class="v_line l_28"></div>
										<div class="v_line l_29"></div>
                                        
										<div class="v_line l_30"></div>
										<div class="v_line l_31"></div>
										<div class="v_line l_32"></div>
										<div class="v_line l_33"></div>
										<div class="v_line l_34"></div>
										<div class="v_line l_35"></div>
										<div class="v_line l_36"></div>
										<div class="v_line l_37"></div>
										<div class="w_line l_38"></div>
										<div class="w_line l_39"></div>
										<div class="w_line l_40"></div>
										<div class="w_line l_41"></div>
										<div class="w_line l_42"></div>
										<div class="w_line l_43"></div>
										<div class="w_line l_44"></div>
										<div class="w_line l_45"></div>
										<div class="v_line l_46"></div>
										<div class="v_line l_47"></div>
										<div class="v_line l_48"></div>
										<div class="v_line l_49"></div>
										
										<div class="v_line l_50"></div>
										<div class="v_line l_51"></div>
										<div class="v_line l_52"></div>
										<div class="v_line l_53"></div>
										<div class="v_line l_54"></div>
										<div class="v_line l_55"></div>
										<div class="v_line l_56"></div>
										<div class="v_line l_57"></div>
										<div class="w_line l_58"></div>
										<div class="w_line l_59"></div>
										<div class="w_line l_60"></div>
										<div class="w_line l_61"></div>
										<div class="w_line l_62"></div>
										<div class="w_line l_63"></div>
										<div class="w_line l_64"></div>
										<div class="w_line l_65"></div>
										<div class="v_line l_66"></div>
										<div class="v_line l_67"></div>
										<div class="v_line l_68"></div>
										<div class="v_line l_69"></div>
										
										
										<div class="g_icon gic_01">G</div>
										<div is="care-sbo-status" cla="g_icon gic_02" name="EDG'A" number="G" :value="tags._YD3007" :taginfo="tagInfos._YD3007" :key="updateKey"></div>
										<div is="care-sbo-status" cla="g_icon gic_03" name="EDG'B" number="G" :value="tags._YD3008" :taginfo="tagInfos._YD3008" :key="updateKey"></div>
                                        
											<div is="care-sbo-status" cla="el_icon_b ic_01 mtrv_btn tooltip_01" name="SUT #1 OFF site" number="1" :value="tags._YD3137" :taginfo="tagInfos._YD3137" :key="updateKey"></div>
											<div is="care-sbo-status" cla="el_icon_w ic_02 mtrv_btn tooltip_01" name="EDG'A" number="2" :value="tags._YD3141" :taginfo="tagInfos._YD3141" :key="updateKey"></div>
											<div is="care-sbo-status" cla="el_icon_w ic_03 mtrv_btn tooltip_01" name="SUT #2 OFF site" number="3" :value="tags._YD3139" :taginfo="tagInfos._YD3139" :key="updateKey"></div>
											<div class="hd_line ic_04 mtrv_btn"><span class="el_number">4</span></div>
											<div class="hd_line ic_05 mtrv_btn"><span class="el_number">5</span></div>
											<div is="care-sbo-status" cla="el_icon_b ic_06 mtrv_btn tooltip_01" name="SUT #2 OFF site" number="6" :value="tags._YD3138" :taginfo="tagInfos._YD3138" :key="updateKey"></div>
											<div is="care-sbo-status" cla="el_icon_w ic_07 mtrv_btn tooltip_01" name="EDG'B" number="7" :value="tags._YD3142" :taginfo="tagInfos._YD3142" :key="updateKey"></div>
											<div is="care-sbo-status" cla="el_icon_w ic_08 mtrv_btn tooltip_01" name="SUT #1 OFF site" number="8" :value="tags._YD3140" :taginfo="tagInfos._YD3140" :key="updateKey"></div>
											<div class="hd_line ic_09 mtrv_btn" ><span class="el_number">9</span></div>
											<div is="care-sbo-status" cla="el_icon_b ic_10 mtrv_btn tooltip_01" number="10" :value="tags._MD3023" :taginfo="tagInfos._MD3023" :key="updateKey"></div>
											<div class="hd_line ic_11 mtrv_btn" ><span class="el_number">11</span></div>
											<div is="care-sbo-status" cla="el_icon_b ic_12 mtrv_btn tooltip_01" number="12" :value="tags._MD3021" :taginfo="tagInfos._MD3021" :key="updateKey"></div>
											<div class="hd_line ic_13 mtrv_btn" ><span class="el_number">13</span></div>
											<div is="care-sbo-status" cla="el_icon_b ic_14 mtrv_btn tooltip_01" number="14" :value="tags._MD3025" :taginfo="tagInfos._MD3025" :key="updateKey"></div>
											<div class="hd_line ic_15 mtrv_btn" ><span class="el_number">15</span></div>
											<div is="care-sbo-status" cla="el_icon_b ic_16 mtrv_btn tooltip_01" number="16" :value="tags._MD3013" :taginfo="tagInfos._MD3013" :key="updateKey"></div>
											<div class="hd_line ic_17 mtrv_btn" ><span class="el_number">17</span></div>
											<div is="care-sbo-status" cla="el_icon_b ic_18 mtrv_btn tooltip_01" number="18" :value="tags._MD3024" :taginfo="tagInfos._MD3024" :key="updateKey"></div>
											<div class="hd_line ic_19 mtrv_btn" ><span class="el_number">19</span></div>
											<div is="care-sbo-status" cla="el_icon_b ic_20 mtrv_btn tooltip_01" number="20" :value="tags._MD3022" :taginfo="tagInfos._MD3022" :key="updateKey"></div>
											<div class="hd_line ic_21 mtrv_btn" ><span class="el_number">21</span></div>
											<div is="care-sbo-status" cla="el_icon_b ic_22 mtrv_btn tooltip_01" number="22" :value="tags._MD3026" :taginfo="tagInfos._MD3026" :key="updateKey"></div>
											<div class="hd_line ic_23 mtrv_btn"><span class="el_number">23</span></div>
											<div is="care-sbo-status" cla="el_icon_b ic_24 mtrv_btn tooltip_01" number="24" :value="tags._MD3014" :taginfo="tagInfos._MD3014" :key="updateKey"></div>
											
									</div>
                                    
                                    
                                    
									<div class="el_font">
										<span class="el_name en_01">UAT<br>unit</span>
										<span class="el_name en_02">EDG'A'</span>
										<span class="el_name en_03">SAT<br>OFF site</span>
										<span class="el_name en_04">ACC D/G</span>
										<span class="el_name en_05">UAT<br>unit</span>
                                        <span class="el_name en_06">EDG'B'</span>
										<span class="el_name en_07">SAT<br>OFF site</span>
										<span class="el_name en_08">Class<br>4.16 kV</span>
										<span class="el_name en_09">Class 1E<br>480v LC</span>
										
									</div>
								</div>
								<!-- 계통도 테이블 값 -->
								<div class="value_box">
									<div class="vb_01 vbox">
										<h4 class="v_name">재장전수 저장탱크</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>L</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L0960" :taginfo="tagInfos.L0960"/>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_02 vbox">
										<h4 class="v_name">원자로보충수탱크</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>L</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._L2903" :taginfo="tagInfos._L2903"/>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_03 vbox">
										<h4 class="v_name">붕산수저장탱크<br>(BAT)</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>A</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._L5100" :taginfo="tagInfos._L5100"/>
												</tr>
												<tr>
													<th>B</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._L5101" :taginfo="tagInfos._L5101"/>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_04 vbox">
										<h4 class="v_name">사용후연료저장조 (SFP)</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>T</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._T2900" :taginfo="tagInfos._T2900" />
												</tr>
												<tr>
													<th>L</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._T2930" :taginfo="tagInfos._T2930" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_05 vbox">
										<h4 class="v_name">격납용기살수펌프<br>(CSP)</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>F</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.F5200" :taginfo="tagInfos.F5200" />
												</tr>
												<tr>
													<th>F</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.F5210" :taginfo="tagInfos.F5210" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_06 vbox">
										<h4 class="v_name">안전주입펌프<br>(SIP)</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>F</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.F5111" :taginfo="tagInfos.F5111" />
												</tr>
												<tr>
													<th>F</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.F5110" :taginfo="tagInfos.F5110" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_07 vbox">
										<h4 class="v_name">정지냉각펌프<br>(SCP)</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>F</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.F0626" :taginfo="tagInfos.F0626"/>
												</tr>
												<tr>
													<th>F</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.F0627" :taginfo="tagInfos.F0627"/>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_08 vbox">
										<h4 class="v_name">CV AIR</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>P</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.P1000" :taginfo="tagInfos.P1000" />
												</tr>
												<tr>
													<th>T</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._U1001" :taginfo="tagInfos._U1001" />
												</tr>
												<tr>
													<th>Humid</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.Y5001" :taginfo="tagInfos.Y5001" />
												</tr>
												<tr>
													<th>H<sub>2</sub></th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.A5011" :taginfo="tagInfos.A5011" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_09 vbox">
										<h4 class="v_name">CV RAD</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>GAS</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.R5281" :taginfo="tagInfos.R5281" />
												</tr>
												<tr>
													<th>lod</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.R5282" :taginfo="tagInfos.R5282" />
												</tr>
												<tr>
													<th>part</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.R5280" :taginfo="tagInfos.R5280" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_10 vbox">
										<h4 class="v_name">안전주입탱크<br>SIT</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>SIT</th>
													<th>L(NR)</th>
													<th>P(NR)</th>
												</tr>
												<tr>
													<th>A</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L5010" :taginfo="tagInfos.L5010" />
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._P5010" :taginfo="tagInfos._P5010" />
												</tr>
												<tr>
													<th>B</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L5020" :taginfo="tagInfos.L5020" />
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._P5020" :taginfo="tagInfos._P5020" />
												</tr>
												<tr>
													<th>C</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L5030" :taginfo="tagInfos.L5030" />
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._P5030" :taginfo="tagInfos._P5030" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_11 vbox">
										<h4 class="v_name">가압기 PZR</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>L</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L0480" :taginfo="tagInfos.L0480" />
												</tr>
												<tr>
													<th>P</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.P0480" :taginfo="tagInfos.P0480" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_12 vbox">
										<h4 class="v_name">증기발생기 SG</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>S/G</th>
													<th>L</th>
													<th>P</th>
												</tr>
												<tr>
													<th>A</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L0400" :taginfo="tagInfos.L0400" />
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._P0400" :taginfo="tagInfos._P0400" />
												</tr>
												<tr>
													<th>B</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L0420" :taginfo="tagInfos.L0420" />
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._P0420" :taginfo="tagInfos._P0420" />
												</tr>
												<tr>
													<th>C</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L0440" :taginfo="tagInfos.L0440" />
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._P0440" :taginfo="tagInfos._P0440" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_13 vbox">
										<h4 class="v_name">C/L 온도</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>1</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.T0406" :taginfo="tagInfos.T0406"/>
												</tr>
												<tr>
													<th>2</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.T0426" :taginfo="tagInfos.T0426"/>
												</tr>
												<tr>
													<th>3</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.T0446" :taginfo="tagInfos.T0446"/>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_14 vbox">
										<h4 class="v_name"></h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>Rx출력</th>
													<td colspan="2" is="care-tag" class="mtrv_btn mb_type02" :value="tags.N0049" :taginfo="tagInfos.N0049" />
												</tr>
												<tr>
													<th>C<sub>B</sub> </th>
													<td colspan="2" is="care-tag" class="mtrv_btn mb_type02" :value="tags.A5000" :taginfo="tagInfos.A5000" />
												</tr>
												<tr>
													<th>Rod.P</th>
													<td colspan="2" is="care-tag" class="mtrv_btn mb_type02" :value="tags._C0070" :taginfo="tagInfos._C0070" />
												</tr>
												<tr>
													<th rowspan="2">CET</th>
													<th>MAX</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._U0093" :taginfo="tagInfos._U0093"/>
												</tr>
												<tr>
													<th>REP</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._U0091" :taginfo="tagInfos._U0091"/>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_15_2 vbox">
										<h4 class="v_name">H/L 온도</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>1</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.T0419" :taginfo="tagInfos.T0419"/>
												</tr>
												<tr>
													<th>2</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.T0439" :taginfo="tagInfos.T0439"/>
												</tr>
												<tr>
													<th>3</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.T0459" :taginfo="tagInfos.T0459"/>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_16 vbox">
										<h4 class="v_name">격납건물수위<br>CNMT Water Level</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>A</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._L5270" :taginfo="tagInfos._L5270" />
												</tr>
												<tr>
													<th>B</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._L5271" :taginfo="tagInfos._L5271" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_17 vbox">
										<h4 class="v_name">충전유량<br>CHG FLOW</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>F</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._U2809" :taginfo="tagInfos._U2809" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_18 vbox">
										<h4 class="v_name">RCS유량</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<td is="care-tag" exponential="Y" class="mtrv_btn mb_type02" :value="tags.F0400" :taginfo="tagInfos.F0400" />
												</tr>
												<tr>
													<td is="care-tag" exponential="Y" class="mtrv_btn mb_type02" :value="tags.F0420" :taginfo="tagInfos.F0420" />
												</tr>
												<tr>
													<td is="care-tag" exponential="Y" class="mtrv_btn mb_type02" :value="tags.F0440" :taginfo="tagInfos.F0440" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_19 vbox">
										<h4 class="v_name">유출유량<br>LTDN FLOW</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._U2810" :taginfo="tagInfos._U2810" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_20 vbox">
										<h4 class="v_name">체적제어 탱크수위<br>VCT Level</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>L</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L0112" :taginfo="tagInfos.L0112" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_21 vbox">
										<h4 class="v_name">SGLR(N-16)</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>A</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.A6500" :taginfo="tagInfos.A6500" />
												</tr>
												<tr>
													<th>B</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.A6501" :taginfo="tagInfos.A6501" />
												</tr>
												<tr>
													<th>C</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.A6502" :taginfo="tagInfos.A6502" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_22 vbox">
										<h4 class="v_name">증기유량</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>F</th>
													<td is="care-tag" exponential="Y" class="mtrv_btn mb_type02" :value="tags.F0405" :taginfo="tagInfos.F0405" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_23 vbox">
										<h4 class="v_name">Air Rad</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<td style="display: none;"></td>												
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._R5120" :taginfo="tagInfos._R5120" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_24 vbox">
										<h4 class="v_name">Vac</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>P</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._U2005" :taginfo="tagInfos._U2005" />
												</tr>
												<tr>
													<th>P</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._U2006" :taginfo="tagInfos._U2006" />
												</tr>
												<tr>
													<th>P</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._U2007" :taginfo="tagInfos._U2007" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_25 vbox">
										<h4 class="v_name">급수유량 / 압력</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>F</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.F0403" :taginfo="tagInfos.F0403" />
												</tr>
												<tr>
													<th>P</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._P2546" :taginfo="tagInfos._P2546" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_26 vbox">
										<h4 class="v_name">보조급수유량</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th rowspan="1">A</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.F5000" :taginfo="tagInfos.F5000" />
												</tr>
												<tr>
													<th rowspan="1">B</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.F5010" :taginfo="tagInfos.F5010" />
												</tr>
												<tr>
													<th rowspan="1">C</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.F5020" :taginfo="tagInfos.F5020" />
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_27 vbox">
										<h4 class="v_name">보조급수저장탱크</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>L</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L2506" :taginfo="tagInfos.L2506"/>
												</tr>
												<tr>
													<th>L</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.L2508" :taginfo="tagInfos.L2508"/>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_28 vbox">
										<h4 class="v_name">해수<br>Sea Water</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<th>L</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._L2406" :taginfo="tagInfos._L2406"/>
												</tr>
												<tr>
													<th>T</th>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags._T2544" :taginfo="tagInfos._T2544"/>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="vb_29">
										<h4>MFWP<br>주급수펌프</h4>
									</div>
									<div class="vb_30">
										<h4>AFWP<br>보조급수펌프</h4>
									</div>
									<div class="vb_31">
										<h4>COP<br>복수펌프</h4>
									</div>
									<div class="vb_32">
										<h4>CWP<br>순환수펌프</h4>
									</div>
									<div class="vb_33">
										<h4>화학 및 체적제어계통<br>CVCS</h4>
									</div>
									<div class="vb_34">
										<h4>RCP</h4>
									</div>
									<div class="vb_36">
										<h4>복수기COND</h4>
									</div>
									<div class="vb_37">
										<h4>터빈TBN</h4>
									</div>
									<div class="vb_38">
										<h4>주변압기<br>M-XFMR</h4>
									</div>
									<div class="vb_39 vbox">
										<h4 class="v_name">GEN발전기</h4>
										<table>
											<caption></caption>
											<colgroup>
												<col>
												<col>
											</colgroup>
											<thead></thead>
											<tbody>
												<tr>
													<td style="display: none;"></td>
													<td is="care-tag" class="mtrv_btn mb_type02" :value="tags.Q2813" :taginfo="tagInfos.Q2813"/>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="parameter_trends">
							<div style="padding:25px;">
								<h2>Parameter Trends</h2>
								<div style ="float: right; margin-bottom: 6px">
									<label style="font-size: 15px;">검색(변수명) : </label>
									<input style="width:90px;" type="text" :value="search" v-on:input="searchTyping"> 
								</div>
								<ul class="td_menu clearfix">
									<li style="margin-top: 26px;" data-tab="td_tab1" class="tm01 on" ><a href="#none">변수리스트</a></li>
									<li data-tab="td_tab2" class="tm02"><a href="#none">선택변수 Trend View</a></li>
								</ul>
								<div id="td_tab1" class="td_list_wrap tabcontent on">
									<div class="td_list_title">
										<span class="number">번호</span>
										<span class="en_type">구분</span>
										<span class="name">(변수그룹)변수설명</span>
										<span class="code">변수명(조합) </span>
										<span class="check_img"></span>
									</div>
									<div class="td_list" v-if="searchData.length > 0">
										<div>
											<template v-for="tag in searchData">
												<input type="checkbox" :id="'check_' + tag.tagSeq" :value="tag.tagNm" v-model="rawTrendTags">
												<label :for="'check_' + tag.tagSeq">
													<span class="number">{{tag.num}}</span>
													<span class="en_type">{{tag.tagType}}</span>
													<span class="name">{{tag.tagGroupCode}} {{tag.tagEngDcr}}</span>
													<span class="code">{{tag.tagNm}} {{tag.tagUnionCode}}</span>
													<span class="check_img"></span>
												</label>
											</template>
										</div>
									</div>
								</div>
								<div id="td_tab2" class="tabcontent">
									<div class="date_search">
										<input type="text" class="daterange"/>
										<div class="gr_radio">
											<input type="radio" id="each" value="each" v-model="chartType" />
											<label for="each">일반차트</label>
											<input type="radio" id="integrated" value="integrated" v-model="chartType" />
											<label for="integrated">통합차트</label>
										</div>
										<button type="button" class="btn_search" @click="drawRawTrend">조회</button>										
									</div>
									<div class="trend_view"></div>
								</div>
								<div class="td_btn_box">
									<button type="button" class="btn_close">Close</button>
									<button type="button" class="btn_print"></button>
									<button type="button" class="btn_excel"></button>
									<button type="button" class="btn_check_clear" @click="rawTrendTags = []">Check Clear</button>
									<button type="button" class="btn_td_view" @click="openCheckTrend">Trend View</button>
								</div>
							</div>
						</div>
						<tiles:insertAttribute name="footer"/>
					</div>
				</article>
			</section>
			
			<modal v-if="chartOptions.showModal" @close="chartOptions.showModal = false" class="chart_option_modal">   	
		   		<div slot="header">
		   			<h3>차트옵션 설정</h3>
	   			</div>   		
		   		<div slot="body">			
					<div class="chart_option_contents">
						<ul class="option-items">
							<li v-for="s in chartOptions.series">
								<div>{{s.name}} Y축 최소/최대 값</div>
								<div><input type="text" v-model="s.min" /> ~ <input type="text" v-model="s.max" /></div>
							</li>
							<li>
								<div>데이터 그룹핑 방법</div>
								<div>
									<select v-model="chartOptions.groupingType">
										<option value="average">평균</option>
										<option value="high">최대</option>
										<option value="low">최소</option>
									</select>
								</div>
							</li>
						</ul>
					</div>
				</div>   		
				<div class="btn_list" slot="footer">
					<ul class="right">
						<li><button class="pop_btn_cancle" @click="chartOptions.showModal = false">취소</button></li>
						<li><button class="pop_btn" @click="updateChart">수정</button></li>
					</ul>
				</div>
		 	</modal>
		 	
		 	<div id="y-axis-adjust-template" style="display: none">
				<input type="text" name="min"/> ~ <input type="text" name="max" />
			</div>
	
	<style>
        .mCSB_inside > .mCSB_container { margin-right: 10px;}
    </style>
    
    <div class="spades_bg">
        <div class="sp_area" id="ko3sp1">
            <button class="close_spades"><i class="xi-close-thin"></i></button>
            <div class="title">고리 3호기 미임계 (Subcriticality)</div>
            
            <div class="ven2">
                <div is="krn3-subcriticality" :taginfos="tagInfos"></div>
            </div>
        </div>
        
        <div class="sp_area" id="ko3sp2">
            <button class="close_spades"><i class="xi-close-thin"></i></button>
            <div class="title">고리 3호기 노심냉각 (Core Cooling)</div>
                
            <div class="ven2">
                <div is="krn3-corecooling" :taginfos="tagInfos"></div>
            </div>    
        </div>
        
        <div class="sp_area" id="ko3sp3">
            <button class="close_spades"><i class="xi-close-thin"></i></button>
            <div class="title">고리 3호기 열제거원 (Heat Sink)</div>
            
            <div class="ven2">
                <div is="krn3-heatsink" :taginfos="tagInfos"></div>
            </div>
        </div>
        
        <div class="sp_area" id="ko3sp4">
            <button class="close_spades"><i class="xi-close-thin"></i></button>
            <div class="title">고리 3호기 냉각재건전성 (RCS Integrity)</div>
            
            <div class="ven2">
                <div is="krn3-rcsintegrity" :taginfos="tagInfos" :rccltps="rccltps"></div>
            </div>
        </div>
        
        <div class="sp_area" id="ko3sp5">
            <button class="close_spades"><i class="xi-close-thin"></i></button>
            <div class="title">고리 3호기 격납용기 (Containment Integrity)</div>
            
            <div class="ven2">
                <div is="krn3-cvintegrity" :taginfos="tagInfos"></div>
            </div>

        </div>
        
        <div class="sp_area" id="ko3sp6">
            <button class="close_spades"><i class="xi-close-thin"></i></button>
            <div class="title">고리 3호기 냉각재재고량 (RCS Inventory)</div>
            
            <div class="ven2">
                <div is="krn3-rcsinventory" :taginfos="tagInfos"></div>
            </div>
        </div>
        
        <div class="sp_area" id="ko3sp7">
            <button class="close_spades"><i class="xi-close-thin"></i></button>
            <div class="title">고리 3호기 방사선 관리 (Radioactivity Control)</div>
            
            <div class="ven2">
                <div is="krn3-radioactivitycontrol" :taginfos="tagInfos"></div>
            </div>
        </div>
    </div>