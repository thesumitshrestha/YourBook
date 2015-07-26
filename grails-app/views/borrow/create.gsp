<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <g:javascript library="jquery" />
        <jqui:resources theme="darkness" />
        <r:require module="jquery-ui"/>
        <g:set var="entityName" value="${message(code: 'borrow.label', default: 'Borrow')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
            $(document).ready(function()
            {
                $("#datepicker").datepicker({dateFormat: 'yy/mm/dd'});
            })

        </script>
	</head>
	<body>
		<div id="create-borrow" class="content scaffold-create" role="main" style="margin: 0px auto;width: 1000px;">
			<h1 style="text-align: center"><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="ui center aligned segment">
                    <div class="ui positive message">
                        <div class="header">
                            <h1 style="text-align: center">${flash.message}</h1>
                        </div>
                    </div>
                </div>
            </g:if>
			<g:hasErrors bean="${borrowInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${borrowInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="borrow">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
                <div class="large ui buttons" style="margin: 0px auto;">
                    <br>
					<g:submitButton name="create"  style="margin-left: 144px;margin-top: 14px;" class="ui inverted blue button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>
