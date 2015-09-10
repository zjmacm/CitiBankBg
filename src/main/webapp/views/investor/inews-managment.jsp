<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<% Map<String, Object> userInfo = (Map<String, Object>) request.getAttribute("userInfo");%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="../public/stylesheets/font.css">
    <link rel="stylesheet" href="../public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/information-manage-edit.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/customer-footer.css">
    <title>资料管理-编辑</title>
</head>

<body>
    <jsp:include page="invest-header.jsp"></jsp:include>
    <div id="main">
        <div id="content">
            <div id="sitenav">
                <ul>
                    <li>
                        <p class="pageTitle">基本信息</p>
                    </li>
                    <li>
                        <a href=""><span>返回上一层</span></a>
                    </li>
                </ul>
            </div>
            <c:forEach var="investor" items="${investor }">
            <form method="post" enctype="multipart/form-data" name="form">
                <div id="baseInformation">
                    <div id="left-reg">
                        <table>
                            <tr>
                                <td>
                                    <ul>
                                    
                                        <li>
                                            <span class="labelLeft">投资者姓名：</span>
                                            <span class="reg-input"><%= userInfo.get("investorName") %></span>
                                        </li>
                                        <li>
                                            <span class="labelLeft">联系方式：</span>
                                            <input type="text" name="consultPhone" class="reg-input" value="<%= userInfo.get("consultPhone") %>">
                                        </li>
                                        <li>
                                            <span class="labelLeft">职位：</span>
                                            <input type="text" name="position" class="reg-input" value="<%= userInfo.get("position") %>" >
                                        </li>
                                        <li>
                                            <span class="labelLeft">资金额：</span>
                                            <input type="text" name="totalMoney" class="reg-input" value="<%= userInfo.get("totalMoney") %>">
                                        </li>
                                        <li>
                                            <span class="labelLeft">所在地区：</span>
                                            <input type="text" name="companyArea" class="reg-input" value="<%= userInfo.get("companyArea") %>">
                                        </li>
                                        <li>
                                            <span class="labelLeft">投资地区：</span>
                                            <input type="text" name="investArea" class="reg-input" value="<%= userInfo.get("investArea") %>">
                                        </li>
                                        <li>
                                            <span class="labelLeft" id="invest-filed"  data-index="<%= userInfo.get("investField") %>">投资领域：</span>
                                            <select class="reg-input" name="investField">
                                                <option value="0">金融投资</option>
                                                <option value="1">房地产</option>
                                                <option value="2">能源</option>
                                                <option value="3">化学</option>
                                            </select>
                                        </li>
                                        <li>
                                            <span class="labelLeft" id="invest-stage" data-index="<%= userInfo.get("investStage") %>">投资阶段：</span>
                                            <select class="reg-input" name="investStage">
                                                <option value="0">种子</option>
                                                <option value="1">初创</option>
                                                <option value="2">拓展前</option>
                                                <option value="3">拓展后</option>
                                                <option value="4">Pre-IPO</option>
                                            </select>
                                        </li>
                                        <li>
                                            <span class="labelLeft">投资周期：</span>
                                            <input type="text" name="investPeriod" class="reg-input" value="<%= userInfo.get("investPeriod") %>">
                                        </li>
                                    </ul>
                                </td>
                                <td>
                                    <ul>
                                        <li>
                                            <span class="labelRight">所在公司名称：</span>
                                            <input type="text" name="companyName" class="reg-input" value="<%= userInfo.get("companyName") %>">
                                        </li>
                                        <li>
                                            <span class="labelRight">公司注册地址：</span>
                                            <input type="text" name="address" class="reg-input" value="<%= userInfo.get("address") %>">
                                        </li>
                                        <li>
                                            <span class="labelRight">公司注册资本：</span>
                                            <input type="text" name="registeredCapital" class="reg-input" value="<%= userInfo.get("registeredCapital") %>">
                                        </li>
                                        <li>
                                            <span class="labelRight">法定代表人信息：</span>
                                            <input type="text" name="legalRepresentative" class="reg-input" value="<%= userInfo.get("legalRepresentative") %>">
                                        </li>
                                        <li>
                                            <span class="labelRight">法定代表人委托信息：</span>
                                            <input type="text" name="legalRepresentativeMandator" class="reg-input" value="<%= userInfo.get("legalRepresentativeMandator") %>">
                                        </li>
                                        <li>
                                            <span class="labelRight">公司规模：</span>
                                            <input type="text" name="companyScale" class="reg-input" value="<%= userInfo.get("companyScale") %>>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="right-reg" >
                        <div id="logo-show">
                            <div id="img">
                                <img src="<%= userInfo.get("logo")%>" style="width: 133px;height:183px">
                            </div>
                        </div>
                        <div id="file">
                            <span id="text-image">上传图片</span>
                            <input type="file" id="fileInput" name="image">
                        </div>
                    </div>
            </div>
            <div id="sitenav2">
                        <p class="pageTitle">更多信息</p>
            </div>
            <div id="moreInformation">
                <table>
                    <tr>
                        <td>股东背景：</td>
                        <td><input type="text" name="shareholderBackground" class="reg-input" value="<%= userInfo.get("shareholderBackground")%>"></td>
                    </tr>
                    <tr>
                        <td>管理基金：</td>
                        <td><input type="text" name="managedFund" class="reg-input" value="<%= userInfo.get("managedFund")%>"></td>
                    </tr>
                    <tr>
                        <td>投资行业：</td>
                        <td>
                            <select class="reg-input" name="investIndustry" data-index="<%= userInfo.get("investIndustry") %>" id="invest-industry">
                                                <option>金融投资</option>
                                                <option>房地产</option>
                                                <option>能源</option>
                                                <option>化学</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>投资意向金额：</td>
                        <td><input type="text" name="investMoney" class="reg-input" value="<%= userInfo.get("investMoney") %>"id="intention">&nbsp;万</td>
                    </tr>
                    <tr>
                        <td>投资类型：</td>
                        <td>
                            <select class="reg-input" name="investType" data-index="<%= userInfo.get("investType") %>" id="type" >
                                    <option value="0">股/债权投资</option>
                                    <option value="1">股权投资</option>
                                    <option value="2">债权投资</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>投资历史：</td>
                        
                        <td><textarea rows="10" cols="60" class="reg-input-big"  name="investHistory"><%= userInfo.get("investHistory") %></textarea></td>
                    </tr>
                    <tr>
                        <td>投资类型：</td>
                        <td>
                            <select class="reg-input" name="investType" data-index="<%= userInfo.get("investType") %>" id="type1">
                                <option value="0">传统型</option>
                                <option value="1">新兴型</option>
                                <option value="2">热点型</option>
                                <option value="3">前瞻型</option>
                                <option value="4">稳健型</option>
                                <option value="5">其他</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>投资历史：<a href="">点击查看</a></td>
                    </tr>
                </table>
            </div>
             <input type="button" id="btn" value="提交" />
        </form>
        </c:forEach>
        </div>
    </div>
    <div id="footer"></div>
    <script type="text/javascript" src="../public/javascripts/jq.js"></script>
    <script type="text/javascript" src="../public/javascripts/imd.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        imd.Event('#fileInput').on('change', function(e) {
            var fileReader = new FileReader();
            var file = imd.getElement('#fileInput').files[0];
            fileReader.onload = function() {
                var html = '<span><img src=' + '"' + fileReader.result + '"' + '></span>';
                $('#logo-show').append(html);
            }
            fileReader.readAsDataURL(file);
        });
        

	   imd.Event('#btn').on('click', function(e) {
           var form = document.forms.form,
                   data = new FormData(form);
		   imd.ajax({
			   type: 'POST',
			   async: true,
			   url: '/investor/saveUserInfo',
			   receiveType: 'json',
			   data: data,
			   success: function(result) {
				   alert(result.result);
			   },
			   error: function(e) {
				   alert('网络错误，稍后再试');
			   }
		   });
	   });
    });

    var filed_index = $("#invest-filed").data("index");
    var filed_select = "#invest-filed option:nth-child(" + filed_index +")";
    $(filed_select).attr("selected", "selected");

    var stage_index = $("#invest-stage").data("index");
    var stage_select = "#invest-stage option:nth-child(" + stage_index + ")";
    $(stage_select).attr("selected", "selected");

    var industry_index = $("#invest-industry").data("index");
    var industry_select = "#invest-industry option:nth-child(" + industry_index + ")";
    $(industry_select).attr("selected", "selected");

    var type_index = $("#type").data("index");
    var type_select = "#type option:nth-child(" + type_index + ")";
    $(type_select).attr("selected", "selected");


    var type1_index = $("#type1").data("index");
    var type1_select = "#type option:nth-child(" + type1_index + ")";
    $(type1_select).attr("selected", "selected");

    </script>
</body>

</html>
    