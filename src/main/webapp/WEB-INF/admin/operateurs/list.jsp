<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${titre}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <jsp:include page="../../layout/navbar.jsp" />
    
    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
            <h1>${titre}</h1>
            <a href="${pageContext.request.contextPath}/admin/operateurs/nouveau" class="btn btn-primary">
                <i class="fas fa-plus"></i> Nouveau Opérateur
            </a>
        </div>

        <div class="card">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="o" items="${operateurs}">
                        <tr>
                            <td>${o.id}</td>
                            <td>${o.nom}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/operateurs/modifier/${o.id}" class="btn btn-secondary" style="padding: 4px 8px; font-size: 12px;">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
