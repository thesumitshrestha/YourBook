<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-user" class="content scaffold-create" role="main" style="margin: 0px auto;width:94%;">
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
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:userInstance, action:'save']" id="userform">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<div class="large ui buttons">
                    <br>
					<input type="submit" name="create" class="ui inverted blue button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>
