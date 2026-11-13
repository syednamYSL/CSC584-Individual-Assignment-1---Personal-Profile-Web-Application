<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${empty name ? 'Profile' : name} - Personal Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <main class="card profile">
        <header class="profile-hero">
            <div class="avatar" aria-hidden="true">
                <c:out value="${empty name ? '?' : name.substring(0, 1).toUpperCase()}"/>
            </div>
            <h1><c:out value="${name}"/></h1>
            <p class="subtitle"><c:out value="${programme}"/></p>
        </header>

        <section class="details">
            <div class="detail-row">
                <span class="detail-label">Name</span>
                <span class="detail-value"><c:out value="${name}"/></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Student ID</span>
                <span class="detail-value"><c:out value="${studentId}"/></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Programme</span>
                <span class="detail-value"><c:out value="${programme}"/></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Email</span>
                <span class="detail-value">
                    <a href="mailto:<c:out value='${email}'/>"><c:out value="${email}"/></a>
                </span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Hobbies</span>
                <span class="detail-value">
                    <c:choose>
                        <c:when test="${not empty hobbyList}">
                            <c:forEach var="hobby" items="${hobbyList}">
                                <span class="tag"><c:out value="${hobby}"/></span>
                            </c:forEach>
                        </c:when>
                        <c:otherwise><em>Not provided</em></c:otherwise>
                    </c:choose>
                </span>
            </div>
        </section>

        <section class="intro">
            <h2>About Me</h2>
            <%-- c:out escapes HTML; the CSS keeps line breaks the user typed --%>
            <p class="intro-text"><c:out value="${intro}"/></p>
        </section>

        <div class="actions">
            <a href="${pageContext.request.contextPath}/index.html" class="btn btn-primary">Edit Profile</a>
            <button type="button" class="btn btn-secondary" onclick="window.print()">Print</button>
        </div>
    </main>
</body>
</html>
