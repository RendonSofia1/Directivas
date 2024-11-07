<%-- 
    Document   : main
    Created on : 28-oct-2024, 19:57:26
    Author     : rendo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String mensaje = (String) request.getAttribute("mensaje");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <script>
            // Verifica si hay un mensaje y muestra la alerta
            <% if (mensaje != null) {%>
            alert("<%= mensaje%>");
            <% }%>
        </script>
    </head>
    <body>
        <div class="container" style="margin-top: 20px">
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover" >
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Autor</th>
                            <th scope="col">Páginas</th>
                            <th scope="col" >Año</th>
                            <th scope="col" >Acciones</th>
                        </tr>
                    </thead>
                    <tbody >

                        <c:forEach var="libro" items="${sessionScope.libros}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td> 
                                <td>${libro.nombre}</td>          
                                <td>${libro.autor}</td>          
                                <td>${libro.paginas}</td>          
                                <td>${libro.anio}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/crear_xml_servlet" method="POST">
                                        <input type="hidden" name="nombre" value="${libro.nombre}">
                                        <input type="hidden" name="autor" value="${libro.autor}">
                                        <input type="hidden" name="paginas" value="${libro.paginas}">
                                        <input type="hidden" name="anio" value="${libro.anio}">
                                        <input type="hidden" name="id" value="${status.index + 1}">
                                        <button class="btn btn-outline-primary" type="submit" >Generar XML</button>
                                    </form>

                                        <form class="mt-2" action="${pageContext.request.contextPath}/crear_xml_servlet" method="GET">
                                        <input type="hidden" name="paginas" value="${libro.paginas}">
                                        <input type="hidden" name="anio" value="${libro.anio}">
                                        <input type="hidden" name="id" value="${status.index + 1}">
                                        <button class="btn btn-outline-secondary" type="submit" >Ver</button>
                                    </form>
                                </td>

                            </tr>
                        </c:forEach>

                        <c:if test="${empty sessionScope.libros}">
                            <tr>
                                <td colspan="6">No se han agregado elementos todavía.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>  
            <a class="btn btn-warning" href="${pageContext.request.contextPath}/jsp/form.jsp">Agregar</a>
        </div>
    </body>
    
</html>
