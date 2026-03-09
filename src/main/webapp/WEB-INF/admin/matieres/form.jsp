<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${action} Matière</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../../layout/navbar.jsp" />
    
    <div class="container" style="max-width: 600px;">
        <h1>${action} Matière</h1>
        
        <div class="card" style="margin-top: 20px;">
            <form action="${pageContext.request.contextPath}/admin/matieres/save" method="post">
                <input type="hidden" name="id" value="${matiere.id}">
                
                <div style="margin-bottom: 20px;">
                    <label for="nom">Nom de la Matière</label>
                    <input type="text" id="nom" name="nom" value="${matiere.nom}" required>
                </div>
                
                <div style="display: flex; gap: 10px;">
                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                    <a href="${pageContext.request.contextPath}/admin/matieres" class="btn btn-secondary">Annuler</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
