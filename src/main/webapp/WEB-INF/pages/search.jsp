<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Users Page</title>

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
<a href="<c:url value="add"/>" style="font-weight: bold">Add User</a>

<br/>
<br/>

<h1>User list</h1>


<form action="/search">
    <input type="submit" value="Search"
           style="width: 60px; background-color: #71BC78; border-style: solid; border-color: #008000;
               border-width: 1px"/>

    <input type="text" id="name" name="name" placeholder="name"
           style="width: 159px; border-color: #008000; border-style: solid;
               border-width: 1px"/>
</form>

<form action="/users">
    <input type="submit" value="Cancel"
           style="width: 60px; background-color: #71BC78; border-style: solid; border-color: #008000;
               border-width: 1px"/>
</form>

<c:if test="${!empty listUsers}">
    <table class="tg">
        <tr>
            <th width="50">ID</th>
            <th width="150">Name</th>
            <th width="50">Age</th>
            <th width="80">Is Admin</th>
            <th width="150">Created Date</th>
            <th width="80">Edit</th>
            <th width="80">Delete</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.age}</td>
                <td>${user.admin}</td>
                <td>${user.createdDate}</td>
                <td><a href="<c:url value='edit/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/removeUser/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>


    <br/>

    <div id="pagination" align="center" style="width: 648px">

        <c:url value="search" var="prev">
            <c:param name="name" value="${name}"/>
            <c:param name="page" value="${page-1}"/>
        </c:url>
        <c:if test="${page > 1}">
            <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
        </c:if>

        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
            <c:choose>
                <c:when test="${page == i.index}">
                    <span class="pn">${i.index}</span>
                </c:when>
                <c:otherwise>
                    <c:url value="search" var="url">
                        <c:param name="name" value="${name}"/>
                        <c:param name="page" value="${i.index}"/>
                    </c:url>
                    <a href='<c:out value="${url}" />' class="pn">${i.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:url value="search" var="next">
            <c:param name="name" value="${name}"/>
            <c:param name="page" value="${page + 1}"/>
        </c:url>
        <c:if test="${page + 1 <= maxPages}">
            <a href='<c:out value="${next}" />' class="pn next">Next</a>
        </c:if>
    </div>
</c:if>

</body>
</html>
