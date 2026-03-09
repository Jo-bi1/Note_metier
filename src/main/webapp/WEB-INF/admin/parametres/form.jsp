<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${action} Paramètre</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <jsp:include page="../../layout/navbar.jsp" />
    
    <div class="container" style="max-width: 600px;">
        <h1>${action} Paramètre</h1>
        
        <div class="card" style="margin-top: 20px;">
            <form action="${pageContext.request.contextPath}/admin/parametres/save" method="post">
                <input type="hidden" name="id" value="${parametre.id}">
                
                <div style="margin-bottom: 20px;">
                    <label for="id_matiere">Matière</label>
                    <select id="id_matiere" name="matiere.id" required>
                        <c:forEach var="m" items="${matieres}">
                            <option value="${m.id}" ${m.id == parametre.matiere.id ? 'selected' : ''}>${m.nom}</option>
                        </c:forEach>
                    </select>
                </div>

                <div style="margin-bottom: 20px;">
                    <label for="seuil">Seuil (Différence maximale)</label>
                    <input type="number" step="0.5" id="seuil" name="seuil" value="${parametre.seuil}" required>
                </div>

                <div style="margin-bottom: 20px;">
                    <label for="id_operateur">Opérateur</label>
                    <select id="id_operateur" name="operateur.id" required>
                        <c:forEach var="op" items="${operateurs}">
                            <option value="${op.id}" ${op.id == parametre.operateur.id ? 'selected' : ''}>${op.nom}</option>
                        </c:forEach>
                    </select>
                </div>

                <div style="margin-bottom: 20px;">
                    <label for="id_resolution">Résolution (si condition vraie)</label>
                    <select id="id_resolution" name="resolution.id" required>
                        <c:forEach var="res" items="${resolutions}">
                            <option value="${res.id}" ${res.id == parametre.resolution.id ? 'selected' : ''}>${res.nom}</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div style="display: flex; gap: 10px;">
                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                    <a href="${pageContext.request.contextPath}/admin/parametres" class="btn btn-secondary">Annuler</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
