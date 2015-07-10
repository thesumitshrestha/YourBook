<%@ page import="yourBook.Type" %>



<div class="ui form">
    <div class="required field">
        <label> Type </label>
	<g:textField name="type" required="" placeholder="Type" value="${typeInstance?.type}"/>
    </div>
</div>
%{--
<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'member', 'error')} ">
	<label for="member">
		<g:message code="type.member.label" default="Member" />
		
	</label>--}%
%{--
<ul class="one-to-many">
<g:each in="${typeInstance?.member?}" var="m">
    <li><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="member" action="create" params="['type.id': typeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'member.label', default: 'Member')])}</g:link>
</li>
</ul>--}%
%{--


</div>

--}%
