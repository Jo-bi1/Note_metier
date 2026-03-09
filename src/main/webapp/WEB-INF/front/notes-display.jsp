<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>${titre}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <jsp:include page="../layout/navbar.jsp" />
    
    <div class="container">
        <h1>${titre}</h1>
        <p style="color: var(--text-secondary); margin-bottom: 20px;"></p>
        
        <div class="card">
            <table>
                <thead>
                    <tr>
                        <th>Candidat</th>
                        <c:forEach var="matiere" items="${matieres}">
                            <th>${matiere.nom}</th>
                        </c:forEach>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="candidat" items="${candidats}">
                        <tr>
                            <td style="font-weight: 600;">${candidat.nom} ${candidat.prenom} (${candidat.matricule})</td>
                            <c:forEach var="matiere" items="${matieres}">
                                <td>
                                    <fmt:formatNumber value="${results[candidat.id][matiere.id]}" maxFractionDigits="2" />
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
