<%@ page import="yourBook.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title>Edit Book</title>
        <script type="text/javascript">
            function validateForm(){
                var bookTitle=$("#bookTitle").val().replace(/ /g,'')
                if (/^[a-zA-Z]*$/.test(bookTitle) == false) {//validating
                    //sweetAlert("Oops...", "First Name should only contain alphabets!", "error");
                    alert("Invalid Book Title");
                    $("#bookTitle").css('background', 'rgba(247, 5, 5, 0.35)');
                    $("#bookTitle").focus()
                    return false
                }
                if (/^[a-zA-Z]*$/.test($("#author").val().replace(/ /g,'')) == false) {//validating last name
                    //sweetAlert("Oops...", "Last Name should only contain alphabets!", "error");
                    alert("Invalid Author Name");
                    $("#author").css('background', 'rgba(247, 5, 5, 0.35)');
                    $("#author").focus();
                    return false
                }
                if (/^[a-zA-Z]*$/.test($("#publication").val().replace(/ /g,'')) == false) {//validating last name
                    //sweetAlert("Oops...", "Last Name should only contain alphabets!", "error");
                    alert("Invalid  Publication");
                    $("#publication").css('background', 'rgba(247, 5, 5, 0.35)');
                    $("#publication").focus();
                    return false
                }
                if (/^[a-zA-Z]*$/.test($("#publisherName").val().replace(/ /g,'')) == false) {//validating last name
                    //sweetAlert("Oops...", "Last Name should only contain alphabets!", "error");
                    alert("Invalid  Publisher Name");
                    $("#publisherName").css('background', 'rgba(247, 5, 5, 0.35)');
                    $("#publisherName").focus();
                    return false
                }
                if (/^[0-9]*$/.test($("#isbn").val().replace(/ /g,'')) == false) {
                    alert("Invalid ISBN");
                    $("#isbn").css('background', 'rgba(247, 5, 5, 0.35)');
                    $("#isbn").focus();
                    return false
                }
                if (/^[0-9]*$/.test($("#copyRight").val().replace(/ /g,'')) == false) {
                    alert("Invalid Copyright Year");
                    $("#copyRight").css('background', 'rgba(247, 5, 5, 0.35)');
                    $("#copyRight").focus();
                    return false
                }
                if (/^[0-9]*$/.test($("#numBook").val().replace(/ /g,'')) == false) {
                    alert("Invalid Number of Books");
                    $("#numBook").css('background', 'rgba(247, 5, 5, 0.35)');
                    $("#numBook").focus();
                    return false
                }
                return true;
            }
        </script>
	</head>
	<body>
		<div id="edit-book" class="content scaffold-edit" role="main" style="margin: 0px auto;width: 1200px">
            <br>
			<h1 style="text-align: center"><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${bookInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${bookInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:bookInstance, action:'update']" method="PUT" onsubmit="return validateForm()">
				<g:hiddenField name="version" value="${bookInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
                </br>
                <div class="large ui buttons">
					<g:actionSubmit class="ui inverted blue button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>
