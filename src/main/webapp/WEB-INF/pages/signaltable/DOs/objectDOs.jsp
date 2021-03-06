<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${processControlObject.name}</title>
    <style>
        #menu {
            width: 100%;
            height: 100px;
            position: absolute;
            top:0;
        }
        #workspace {
            width: 100%;
            position: absolute;
            top: 102px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        table {
            color: #333;
            font-family: sans-serif;
            font-size: .9em;
            font-weight: 300;
            text-align: left;
            line-height: 40px;
            border-spacing: 0;
            border: 1px solid #428bca;
            width: 1000px;
            margin: 20px auto;
        }

        thead tr:first-child {
            background: #428bca;
            color: #fff;
            border: none;
        }

        th {font-weight: bold;}

        th:first-child, td:first-child {padding: 0 5px 0 15px;}

        thead tr:last-child th {border-bottom: 2px solid #ddd;}

        tbody tr:hover {background-color: #f0fbff;}
        tbody tr:last-child td {border: none;}
        tbody td {border-bottom: 1px solid #ddd; line-height: 25px}

        td:last-child {
            /*text-align: right;*/
            padding-right: 10px;
        }

        .button {
            border: none;
            color: #428bca;
            text-align: center;
            text-decoration: none;
            padding-left: 15px;
            background: transparent;
            font-size: .9em;
        }

        .button:hover {
            text-decoration: underline;
            cursor: pointer;
        }

        .mbutton {
            color: white;
            text-align: center;
            text-decoration: none;
            font-weight: normal;
            padding-left: 15px;
        }

        .mbutton:hover {
            text-decoration: underline;
            cursor: pointer;
        }
        .tablemenu {
            text-align: right;
            padding-right: 10px;
        }
        form {
            width: auto;
            margin: 0;
            padding: 0;
            display: inline;
        }
    </style>
</head>
<body>
<div id="menu"><%@include file="../menu.jsp"%></div>
<div id="workspace">
    <table>
        <tr>
            <th><h3>${processControlObject.name}</h3></th>
            <th><a href="<c:url value='/${processControlObject.name}/di'/>">DI</a></th>
            <th><a href="<c:url value='/${processControlObject.name}/ai'/>">AI</a></th>
            <th><a href="<c:url value='/${processControlObject.name}/do'/>">DO</a></th>
            <th><a href="<c:url value='/${processControlObject.name}/ao'/>">AO</a></th>
        </tr>
    </table>
    <table>
        <thead>
        <tr><th colspan="2">Дискретные выходы</th>
            <th class="tablemenu">
                <a href="<c:url value='/${processControlObject.name}-downloadExcel'/>" class="mbutton">excel</a>
                <a href="<c:url value='/${processControlObject.name}/do/new'/>" class="mbutton">add new</a>
            </th>
        </tr>
        <tr>
            <th>ID</th>
            <th>Symbol</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${digitalOutputs}" var="digitalOutput">
            <tr>
                <td>${digitalOutput.id} <a href="<c:url value='/${processControlObject.name}/do/${digitalOutput.id}-edit'/>" class="button">edit</a>
                    <c:url var="deleteURL" value='/${processControlObject.name}/do/${digitalOutput.id}-delete'/>
                    <form action="${deleteURL}" method="POST">
                        <input id="digitalOutput" name="digitalOutput" type="hidden" value="${digitalOutput.id}"/>
                        <input class="button" type="submit" value="delete" onClick="return confirm('Удалить элемент?')"/>
                    </form>
                </td>
                <td>${digitalOutput.symbol}</td>
                <td>${digitalOutput.description}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>