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
            <a href="${pageContext.request.contextPath}/admin/parametres/nouveau" class="btn btn-primary">
                <i class="fas fa-plus"></i> Nouveau Paramètre
            </a>
        </div>

        <div class="card">
            <table>
                <thead>
                    <tr>
                        <th>Matière</th>
                        <th>Seuil (Différence)</th>
                        <th>Opérateur</th>
                        <th>Résolution</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${parametres}">
                        <tr>
                            <td>${p.matiere.nom}</td>
                            <td>${p.seuil}</td>
                            <td>${p.operateur.nom}</td>
                            <td>${p.resolution.nom}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/parametres/modifier/${p.id}" class="btn btn-secondary" style="padding: 4px 8px; font-size: 12px;">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/admin/parametres/supprimer/${p.id}" class="btn btn-secondary" style="padding: 4px 8px; font-size: 12px; color: var(--danger-color);" onclick="return confirm('Supprimer ?')">
                                    <i class="fas fa-trash"></i>
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
