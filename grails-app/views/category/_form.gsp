<%@ page import="yourBook.Category" %>


<div class="ui form">
    <div class="required field">
    <div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} required">
        <label for="name">
            <g:message code="category.name.label" default="Name" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="name" required="" placeholder="Create Book Category" value="${categoryInstance?.name}"/>
    </div>
    </div>
</div>
%{--
<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'book', 'error')} ">
	<label for="book">
		<g:message code="category.book.label" default="Book" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoryInstance?.book?}" var="b">
    <li><g:link controller="book" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="book" action="create" params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'book.label', default: 'Book')])}</g:link>
</li>
</ul>


</div>

--}%
