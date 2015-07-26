<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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
    <h1 style="text-align: center;color: #00335e">New Book </h1>
    <g:form url="[resource:bookInstance, action:'save']" onsubmit="return validateForm();">
        <g:render template="form"/>
        <div class="large ui buttons" style="margin: 0px auto;width: 1800px">
            <g:submitButton class="ui inverted blue button" name="create" value="Create" style="margin-left: 44px;margin-top: 14px;"/>
        </div>
    </g:form>
			<g:hasErrors bean="${bookInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${bookInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
		</div>
	</body>
</html>
