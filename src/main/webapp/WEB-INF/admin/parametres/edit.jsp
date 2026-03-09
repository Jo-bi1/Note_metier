<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>${titre}</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
        </head>

        <body>
            <div class="container">
                <jsp:include page="../../layout/navbar.jsp" />

                <div class="admin-form-container">
                    <h2 class="admin-title" style="text-align:center; margin-bottom: 32px;">
                        <i class="fas fa-sliders-h"></i> Configuration Globale
                    </h2>

                    <c:if test="${not empty message}">
                        <div class="message success"><i class="fas fa-check-circle"></i> ${message}</div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/admin/parametres" method="post">
                        <div class="form-group">
                            <label>Temps d'attente par défaut (min)</label>
                            <input type="number" name="tempsAttente" value="${tempsAttente}" step="1" required>
                            <small style="color:#888; display:block; margin-top:4px;">Appliqué si la voiture n'a pas de
                                configuration spécifique.</small>
                        </div>

                        <div class="form-group">
                            <label>Vitesse Moyenne par défaut (km/h)</label>
                            <input type="number" name="vitesseMoyenne" value="${vitesseMoyenne}" step="0.1" required>
                            <small style="color:#888; display:block; margin-top:4px;">Utilisée pour l'estimation des
                                trajets complexes.</small>
                        </div>

                        <div class="form-footer" style="padding-top:0; border-top:none;">
                            <button type="submit" class="btn btn-primary" style="width:100%; justify-content:center;">
                                Mettre à jour les paramètres
                            </button>
                        </div>
                    </form>
                </div>

                <div style="margin-top: 60px;">
                    <h3 style="margin-bottom:24px;"><i class="fas fa-database"></i> Registre des Clés</h3>
                    <div class="table-wrapper">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>Paramètre (Clé Système)</th>
                                    <th>Valeur Actuelle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${parametres}">
                                    <tr>
                                        <td style="font-family: 'SF Mono', monospace; font-size:12px;">${p.cle}</td>
                                        <td><strong>${p.valeur}</strong></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </body>

        </html>