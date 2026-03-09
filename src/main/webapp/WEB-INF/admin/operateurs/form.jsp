<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${action} Opérateur</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../../layout/navbar.jsp" />
    
    <div class="container" style="max-width: 600px;">
        <h1>${action} Opérateur</h1>
        
        <div class="card" style="margin-top: 20px;">
            <form action="${pageContext.request.contextPath}/admin/operateurs/save" method="post">
                <input type="hidden" name="id" value="${operateur.id}">
                
                <div style="margin-bottom: 20px;">
                    <label for="nom">Symbole de l'Opérateur (ex: <, >)</label>
                    <input type="text" id="nom" name="nom" value="${operateur.nom}" required>
                </div>
                
                <div style="display: flex; gap: 10px;">
                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                    <a href="${pageContext.request.contextPath}/admin/operateurs" class="btn btn-secondary">Annuler</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
