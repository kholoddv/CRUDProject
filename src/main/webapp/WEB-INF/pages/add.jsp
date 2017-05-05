<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Add user</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #008000;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #008000;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: bold;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #008000;
            color: #333;
            background-color: #98FB98;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

        .pn {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<a href="../../index.jsp" style="font-weight: bold">Back to main menu</a>
<br/>
<br/>
<a href="<c:url value="users"/>" style="font-weight: bold">User List</a>

<br/>
<br/>

<h1>Add user</h1>

<c:url var="addAction" value="addUser"/>

<form:form action="${addAction}" commandName="user">

    <br/>

    <input type="submit"
           value="<spring:message text="Add"/>"
           style="width: 90px; background-color: #71BC78;
                      border-style: solid; border-color: #008000;
                      border-width: 1px"/>

    <br/>
    <br/>

    <table>
        <tr>
            <td width="90px">
                <form:label path="name">
                    <spring:message text="name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"
                            style="width: 159px; border-color: #008000; border-style: solid;
                                   border-width: 1px"
                            type="text"
                            required="1"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"
                            style="width: 159px; border-color: #008000; border-style: solid;
                                   border-width: 1px"
                            type="number"
                            min="0"
                            required="1"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="admin">
                    <spring:message text="isAdmin"/>
                </form:label>
            </td>
            <td>
                <form:select path="admin"
                             style="width: 159px; border-color: #008000; border-style: solid;
                                   border-width: 1px">
                    <option>false</option>
                    <option>true</option>
                </form:select>
            </td>
        </tr>

    </table>
</form:form>

</body>
</html>
