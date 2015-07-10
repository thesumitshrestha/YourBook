<%@ page import="yourBook.Reserve" %>



<div class="fieldcontain ${hasErrors(bean: reserveInstance, field: 'book', 'error')} ">
	<label for="book">
		<g:message code="reserve.book.label" default="Book" />
		
	</label>
%{--
	<g:select name="book" from="${untitled.Book.list()}" multiple="multiple" optionKey="id" size="5" value="${reserveInstance?.book*.id}" class="many-to-many"/>
--}%
${bookId}</br>
${bookName}
</div>

<div class="fieldcontain ${hasErrors(bean: reserveInstance, field: 'member', 'error')} ">
	<label for="member">
		<g:message code="reserve.member.label" default="Member" />
		
	</label>
%{--
	<g:select name="member" from="${untitled.Member.list()}" multiple="multiple" optionKey="id" size="5" value="${reserveInstance?.member*.id}" class="many-to-many"/>
--}%

</div>

