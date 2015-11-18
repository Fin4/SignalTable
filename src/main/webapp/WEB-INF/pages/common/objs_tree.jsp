<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
    <style type="text/css">
        .treeview { padding: 0; clear: both; font-family: Arial, sans-serif; width: 100%; }
        .treeview * { font-size: 100.1%; }
        .treeview ul
        {
            overflow: hidden; width: 100%; margin: 0; padding: 0 0 1.5em 0;
            list-style-type: none;
        }
        .treeview ul ul { overflow: visible; width: auto; margin: 0 0 0 0; padding: 0 0 0 0.75em; }
        /* класс для ul после которых нет li в родительских ветках */
        .treeview ul.l { border-left: 1px solid; margin-left: -1px; }
        .treeview li.cl ul { display: none; }
        .treeview li { margin: 0; padding: 0; }
        .treeview li li { margin: 0 0 0 0.5em; border-left: 1px dotted; padding: 0; }
        .treeview li div { position: relative; height: 1.5em; min-height: 16px; //height: 1.3em; }
        .treeview li li div { border-bottom: 1px dotted; }
        .treeview li p
        {
            position: absolute; z-index: 1; top: 0.8em; //top: 0.65em; left: 1.75em;
            width: 100%; margin: 0; border-bottom: 1px dashed; padding: 0;
        }
        .treeview a { padding: 0.1em 0.2em; white-space: nowrap; //height: 1px; }
        .treeview img.i
        {
            border-right: 2px solid; border-bottom: 0.5em solid;
            margin-bottom: -0.5em; vertical-align: middle;
        }
        .treeview a.sc
        {
            position: absolute; top: 0.06em;
            margin-left: -1em; padding: 0; text-decoration: none;
        }

        /* colors */
        .treeview li p,
        .treeview img.i,
        .treeview .sc
        { background: #f5f5ea; }
        .treeview ul.l,
        .treeview li p,
        .treeview img.i
        { border-color: #f5f5ea; }
        .treeview ul li li,
        .treeview ul li li div
        { border-color: #999999; }
        .treeview a,
        .treeview a.sc,
        .treeview a.sc:hover
        { color: #000000; }
        .treeview a:hover
        { color: #cc0000; }
    </style>
    <script type="text/javascript">
        function UnHide( eThis ){
            if( eThis.innerHTML.charCodeAt(0) == 9658 ){
                eThis.innerHTML = '&#9660;'
                eThis.parentNode.parentNode.parentNode.className = '';
            }else{
                eThis.innerHTML = '&#9658;'
                eThis.parentNode.parentNode.parentNode.className = 'cl';
            }
            return false;
        }
    </script>
</head>
<body>
<div class="treeview">
    <ul>
        <li>
            <div><p><a href="#" class="sc" onclick="return UnHide(this)">&#9660;</a>
                <a href="#">Automation Control Objects</a></p></div>
            <c:forEach items="${directions}" var="direction">
                <ul>
                    <li class="cl">
                        <div>
                            <p>
                                <a href="#" class="sc" onclick="return UnHide(this)">&#9658;</a>
                                <a href="#">${direction.name}</a>
                            </p>
                        </div>
                        <c:forEach items="${direction.apcsObjects}" var="apcsObject">
                            <ul>
                                <li>
                                    <div>
                                        <p>
                                            <a href="<c:url value='/${apcsObject.id}-apcsObject' />">${apcsObject.name}</a>
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </c:forEach>
                    </li>
                </ul>
            </c:forEach>
        </li>
    </ul>
</div>
</body>
</html>
