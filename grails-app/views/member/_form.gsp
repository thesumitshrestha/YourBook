<%@ page import="yourBook.Member" %>


<div class="ui form">

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'rollNumber', 'error')} required">
	<label for="rollNumber">
		<g:message code="member.rollNumber.label" default="Roll Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rollNumber" type="number" value="${memberInstance.rollNumber}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="member.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${memberInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="member.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${memberInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="member.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${memberInstance.constraints.gender.inList}" required="" value="${memberInstance?.gender}" valueMessagePrefix="member.gender"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="member.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${memberInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'contact', 'error')} required">
	<label for="contact">
		<g:message code="member.contact.label" default="Contact" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="contact" type="number" value="${memberInstance.contact}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'batch', 'error')} required">
	<label for="batch">
		<g:message code="member.batch.label" default="Batch" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="batch" type="number" value="${memberInstance.batch}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="member.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${memberInstance?.email}"/>

</div>

%{--<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'borrow', 'error')} ">
	<label for="borrow">
		<g:message code="member.borrow.label" default="Borrow" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${memberInstance?.borrow?}" var="b">
    <li><g:link controller="borrow" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="borrow" action="create" params="['member.id': memberInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'borrow.label', default: 'Borrow')])}</g:link>
</li>
</ul>


</div>--}%

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="member.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${yourBook.Type.list()}" optionKey="id" required="" value="${memberInstance?.type?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: memberInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="member.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${yourBook.User.list()}" optionKey="id" required="" value="${memberInstance?.user?.id}" class="many-to-one"/>
</div>
</div>

