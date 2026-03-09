<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <nav class="navbar">
        <div class="navbar-container">
            <a href="${pageContext.request.contextPath}/" class="navbar-brand">
                <i class="fas fa-paper-plane" style="margin-right: 8px;"></i> NavetteApp
            </a>
            <div class="navbar-nav">
                <a href="${pageContext.request.contextPath}/notes" class="nav-link">
                    <i class="fas fa-graduation-cap"></i> Notes Finales
                </a>
                <a href="${pageContext.request.contextPath}/admin/matieres" class="nav-link admin">
                    <i class="fas fa-book"></i> Matières
                </a>
                <a href="${pageContext.request.contextPath}/admin/parametres" class="nav-link admin">
                    <i class="fas fa-sliders-h"></i> Paramètres
                </a>
                <a href="${pageContext.request.contextPath}/admin/resolutions" class="nav-link admin">
                    <i class="fas fa-cogs"></i> Résolutions
                </a>
                <a href="${pageContext.request.contextPath}/admin/operateurs" class="nav-link admin">
                    <i class="fas fa-equals"></i> Opérateurs
                </a>
            </div>
        </div>
    </nav>

    <style>
        .nav-link i {
            margin-right: 4px;
            font-size: 0.9em;
        }
    </style>