<html>
<head>
    <title>Simple GSP page</title>
    <g:javascript library="jquery" />
    <jqui:resources theme="darkness" />
    <meta name="layout" content="main">
    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#datepicker").datepicker({dateFormat: 'yy/mm/dd'});
        })
    </script>

</head>
<body>
<div>
    <p> Between <input type="text" id="datepicker"> </p>
</div>

</body>
</html>