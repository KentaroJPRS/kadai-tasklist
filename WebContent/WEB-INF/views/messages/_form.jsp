<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" />
            <br />
        </c:forEach>
    </div>
</c:if>

<label for="title">タスク名</label>
<br />
<input type="text" name="title" value="${task.title}" />
<br />
<br />

<label for="content">タスク内容</label>
<br />
<textarea name="content" rows="3">${task.content}</textarea>
<br />
<br />

<c:choose>
    <c:when test="${task.status == 1}">
        <c:set var="status1_flag" value="Checked" />
    </c:when>
    <c:when test="${task.status == 2}">
        <c:set var="status2_flag" value="Checked" />
    </c:when>
    <c:when test="${task.status == 3}">
        <c:set var="status3_flag" value="Checked" />
    </c:when>
    <c:otherwise>
        <c:set var="status0_flag" value="Checked" />
    </c:otherwise>
</c:choose>

<label for="status">タスク状態</label>
<br />
<input type="radio" name="status" value="0" ${status0_flag}>未着手
<input type="radio" name="status" value="1" ${status1_flag}>実施中
<input type="radio" name="status" value="2" ${status2_flag}>完了
<input type="radio" name="status" value="3" ${status3_flag}>中止
<br />
<br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録・更新</button>