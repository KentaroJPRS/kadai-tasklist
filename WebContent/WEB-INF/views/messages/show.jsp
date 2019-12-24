<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${task.status == 1}">
                <c:set var="status_char" value="実施中" />
            </c:when>
            <c:when test="${task.status == 2}">
                <c:set var="status_char" value="完了" />
            </c:when>
            <c:when test="${task.status == 3}">
                <c:set var="status_char" value="中止" />
            </c:when>
            <c:otherwise>
                <c:set var="status_char" value="未着手" />
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${task != null}">
                <h2>タスクID : ${task.id} の詳細内容</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>タスク名</th>
                            <td><c:out value="${task.title}" /></td>
                        </tr>
                        <tr>
                            <th>タスク内容</th>
                            <td><c:out value="${task.content}" /></td>
                        </tr>
                        <tr>
                            <th>タスク状態</th>
                            <td><c:out value="${status_char}" /></td>
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td><fmt:formatDate value="${task.created_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td><fmt:formatDate value="${task.updated_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </tbody>
                </table>

                <p>
                    <a href="${pageContext.request.contextPath}/index">タスク一覧に戻る</a>
                </p>
                <p>
                    <a href="${pageContext.request.contextPath}/edit?id=${task.id}">このタスクを編集する</a>
                </p>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>