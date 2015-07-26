<%@ page import="yourBook.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="edit-member" class="content scaffold-edit" role="main" style="margin: 0px auto;width:1200px">
			<h1 style="text-align: center"><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="ui center aligned segment">
                    <div class="ui positive message">
                        <div class="header">
                            <h1 style="text-align: center">${flash.message}</h1>
                        </div>
                    </div>
                </div>
            </g:if>
			<g:hasErrors bean="${memberInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${memberInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:memberInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${memberInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
                <div class="large ui buttons">
                    </br>
					<g:actionSubmit class="ui inverted blue button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>
