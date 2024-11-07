<%-- 
    Document   : verArchivo
    Created on : 07-nov-2024, 0:19:50
    Author     : rendo
--%>

<%@page import="java.io.File"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container mt-4 p-4">
            <%
                String fileName = (String) request.getAttribute("mensaje");
                System.out.println(fileName);
                String filePath = "C:/Users/rendo/Documents/NetBeansProjects/Directivas/web/xmls/" + fileName + ".xml";

                File file = new File(filePath);

                if (file.exists()) {
                    String url = "http://localhost:8080/directivas/xmls/" + fileName + ".xml";
            %>
            <c:import var="bookInfo" url="<%= url%>" />
            <x:parse xml="${bookInfo}" var="output" />

            <h3 class="mb-3">Detalles del libro:</h3>
            <div>
                <ol class="list-group list-group">
                    <li class="list-group-item">
                        <b>Nombre:</b> <x:out select="$output/Libro/Nombre" />
                    </li>
                    <li class="list-group-item">
                        <b>Autor:</b> <x:out select="$output/Libro/Autor" />
                    </li>
                    <li class="list-group-item">
                        <b>Páginas:</b> <x:out select="$output/Libro/Paginas" />
                    </li>
                    <li class="list-group-item">
                        <b>Año:</b> <x:out select="$output/Libro/Anio" />
                    </li>
                </ol>
            </div>
            <%
            } else {
            %>
            <h2>Archivo no encontrado</h2>
            <p>El archivo XML solicitado no existe o no ha sido generado.</p>
            <%
                }
            %>
            <a class="btn btn-warning mt-3" href="${pageContext.request.contextPath}/jsp/procesarC.jsp">Regresar</a>
        </div>
    </body>
</html>
