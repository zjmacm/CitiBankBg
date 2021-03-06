<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="../public/stylesheets/business-header.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/task1.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/finacing-publish.css">
    <link rel="stylesheet" type="text/css" href="../public/stylesheets/customer-footer.css">
    <title>意向发布</title>
</head>

<body>
<jsp:include page="business-header.jsp"></jsp:include>
<div class="wrap">
    <jsp:include page="finance-publish-sidenav.jsp"></jsp:include>
    <div class="main">
        <form action="" method="post" name="form">
            <div class="basic_info">
                <p class="tit">基本信息</p>
                <% Map<String,Object> userInfo = (Map<String,Object>) request.getAttribute("userInfo");%>

                <div class="first">
                    <p >
                    <p>公司名称：<%=userInfo.get("companyName")%></p>
                    <p>公司注册时间：<%=userInfo.get("formedTime")%></p>
<%--
                    <p>产品类型：<%=userInfo.get("productType")%></p>
--%>

                </div>
                <div class="first">
                    <p >
                    <p>公司注册地区：<%=userInfo.get("baseAddress")%></p>
                    <p>公司注册资本：<%=userInfo.get("registerCapital")%></p>
                    <p>所属行业：<%=userInfo.get("workingFiled")%></p>
                </div>
                <div class="buttom">
                    <p>
                        发行金额：
                        <input type="text" name="investMoney"> <%--—
                        <input type="text" name="publishMoneyMax">--%> 万
                    </p>
                    <br/>
                    <p>

                        产品类型：
                       <%-- <input type="text" name="productType">--%> <%--—
                        <input type="text" name="publishMoneyMax">--%>
                        <select name="productType">
                            <option value="股权">股权</option>
                            <option value="债权">债权</option>

                        </select>
                    </p>
                    <br/>
                    <p>
                        <label>发行年限：</label>
                        <input type="text" id="year" name="investTime"> 年
                    </p>
                    <br/>
                    <label>投资地区：</label>
                    <input class="input" type="text" name="investArea" />
                    <br/>
                    <p>
                        <label <%--for="text"--%>>还本付息方式:</label>
                            <textarea id="textarea" cols=50 rows=6 name="backWay">
                            </textarea>
                    </p>
                    <%--<p>
                        <label for="text">发行完成:</label>
                            <textarea id="textarea" cols=50 rows=6 name="publishFinsh">
                            </textarea>
                    </p>--%>
                </div>
            </div>
            <div class="more_info">
                <p class="tit">更多信息</p>
                <div class="left fl">

                    <p>
                        年资金占用时长：
                        <input class="exit" type="text" name="exitMinTime" />
                    </p>
                    <p>
                        可提供风控:
                        <select name="riskControlDemand">
                            <option value=0>抵押</option>
                            <option value=1>看书</option>
                            <option value=2>运动</option>
                            <option value=3>购物</option>
                        </select>
                    </p>
                    <p>
                        担保方:
                        <input class="ensure" type="text" name="bondsman" />
                    </p>
                </div>
                <div class="right right1 fl">
                  <%--  <p>
                        企业当前净资产:
                        <input class="pro" type="text" name="netAsset" /> 万
                    </p>
                    <p>
                        去年营业额：
                        <input class="trunover" type="text" name="turnover"> 万
                    </p>
                    <p>
                        公司净利润：
                        <input class="profits" type="text" name="netProfit"> 万
                    </p>--%>
                    <p>
                        还款来源：
                        <input type="text" class="threshold" name="moneyFrom"> 万
                    </p>
                </div>
            </div>
            <input class="submit" type="button" value="发布" id="btn" />
        </form>
    </div>
</div>
<div id="footer">
    <div id="foot-list">
    </div>
</div>
<script type="text/javascript" src="../public/javascripts/imd.js"></script>
<script type="text/javascript">
    imd.initDocReady(function() {
        var sideItem = document.getElementsByClassName('side-item');
        sideItem[1].className = sideItem[1].className + ' on';


        imd.Event('#btn').on('click', function(e) {
            var form = document.forms.form,
                    data = new FormData(form);
            data.append("productType",2);
            data.append("flag",1);

            imd.ajax({
                type: 'POST',
                async: true,
                url: '/intention/intentionPublish',
                receiveType: 'json',
                data: data,
                success: function(res) {
                    alert(res.result);
                },
                error: function(e) {
                    alert('网络错误，稍后再试');
                }
            });
        });

    });
</script>
</body>

</html>
