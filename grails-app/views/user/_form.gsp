<%@ page import="yourBook.User" %>


<div class="ui form">

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<input id="password" name="password" type="password" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="user.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" id="userName" required="" value="${userInstance?.userName}"/>
    <span id="userInfo"> UserName </span>

</div>
<br>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')} required">
    <div class="ui compact menu">
        <div class="ui simple dropdown item">
            <label for="role">
                <g:message code="user.role.label" default="Role" />
                <span class="required-indicator">*</span>
            </label>
            <i class="dropdown icon"></i>
                 <div class="menu">
                    <div class="item">	<g:select id="role" name="role" from="${userInstance.constraints.role.inList}" required="" value="${userInstance?.role}" valueMessagePrefix="user.role"/>
                </div>
            </div>
        </div>
    </div>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'member', 'error')} ">
	<label for="member">
		<g:message code="user.member.label" default="Member" />
		
	</label>
	
--}%%{--
<ul class="one-to-many">
<g:each in="${userInstance?.member?}" var="m">
    <li><g:link controller="member" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="member" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'member.label', default: 'Member')])}</g:link>
</li>
</ul>
--}%%{--


</div>--}%
</div>
