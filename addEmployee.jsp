<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2021/6/9
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>添加员工</title>
    <link rel="stylesheet" href="css/addEmployee.css">
</head>
<%  List<String> IDList = (List<String>) request.getAttribute("IDList");%>
<body>
<br><br>
<h2 style="text-align: center">添加员工</h2>
<br>
<form style="text-align: center" action="AddEmployeeServlet" method="post" id="addEmployeeForm">
    <input type="text" name="empID" id="empID" placeholder="工号"><br>
    <input type="text" name="empName" id="empName" placeholder="姓名"><br>
    <select name="empGender">
            <option>男</option>
            <option>女</option>
         </select><br>
    <input type="text" name="empAge" id="empAge" placeholder="年龄"><br>
    <input type="text" name="empDuty" id="empDuty" placeholder="职务"><br>
    <input type="text" name="empSalary" id="empSalary" placeholder="工资"><br>
    <div id="msg">
        <img style="size: 12px; visibility: hidden;" src="image/警告.png" alt="">
        <span></span>
    </div><br>
    <button type="button" id="addBtn">保存</button>
    <button type="button" id="cancelBtn" onclick="window.location.href='index.jsp';">取消</button>
</form>
</body>
<script type="text/javascript" src="js/jquery.slim.js"></script>
<script type="text/javascript" src="js/hearts.js"></script>
<script type="text/javascript">

    $("#addBtn").click(function(){

        var empID = $("#empID").val();
        var empName = $("#empName").val();
        var empGender = $("#empGender").val();
        var empAge = $("#empAge").val();
        var empDuty = $("#empDuty").val();
        var empSalary = $("#empSalary").val();

        function hiddenAlarmMsg() {
            setTimeout(function(){
                $("#msg img").css("visibility","hidden");
                $("#msg span").html("");
            },3000);
        }

        function isDouble(str) {
            <%for(String ID:IDList) {%>
            if(str === "<%=ID%>") return true;
            <%}%>
            return false;
        }
        if(isEmpty(empID)) {
            $("#msg img").css("visibility","visible");
            $("#msg span").html("员工号不能为空！");
            hiddenAlarmMsg();
            return;
        }
        if(isDouble(empID)) {
            $("#msg img").css("visibility","visible");
            $("#msg span").html("员工号已存在！");
            hiddenAlarmMsg();
            return;
        }
        if(isEmpty(empName)) {
            $("#msg img").css("visibility","visible");
            $("#msg span").html("姓名不能为空！");
            hiddenAlarmMsg();
            return;
        }

        if(isEmpty(empAge)) {
            $("#msg img").css("visibility","visible");
            $("#msg span").html("年龄不能为空！");
            hiddenAlarmMsg();
            return;
        }
        if(isEmpty(empDuty)) {
            $("#msg img").css("visibility","visible");
            $("#msg span").html("职位不能为空！");
            hiddenAlarmMsg();
            return;
        }
        if(isEmpty(empSalary)) {
            $("#msg img").css("visibility","visible");
            $("#msg span").html("薪水不能为空！");
            hiddenAlarmMsg();
            return;
        }
        $("#addEmployeeForm").submit();
    });
    function isEmpty(str) {
        return str === null || str.trim() === "";
        //该行作用与下面代码一样
        // if(str===null||str.trim()===""){
        //     return true;
        // }
        // return false;
    }

</script>
</html>
