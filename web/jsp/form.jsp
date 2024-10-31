<%-- 
    Document   : form
    Created on : 28-oct-2024, 19:57:37
    Author     : rendo
--%>

<%@page import="Model.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    // Procesar datos solo si hay un POST
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        
        request.setCharacterEncoding("UTF-8");
    
        String nombre = request.getParameter("nombre");
        String autor = request.getParameter("autor");
        String pagesParam = request.getParameter("pages");
        String anio = request.getParameter("anio");

        if (nombre != null && autor != null && pagesParam != null && anio != null) {
            int pages = Integer.parseInt(pagesParam);

            // Crear el objeto Libro
            Libro nuevoLibro = new Libro(nombre, autor, pages, anio);

            // Obtener o inicializar la lista de libros en la sesión
            ArrayList<Libro> libros = (ArrayList<Libro>) session.getAttribute("libros");
            if (libros == null) {
                libros = new ArrayList<>();
            }

            // Agregar el nuevo libro a la lista
            libros.add(nuevoLibro);
            session.setAttribute("libros", libros);

            // Redirigir a la página de visualización
            response.sendRedirect("procesarC.jsp");
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro de Estudiante</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            .form-container {
                padding: 20px;
                display: flex;
                flex-direction: column ;
                width: 400px;
                margin: 0 auto;
                background: #fff;

                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #333;
            }
            label {
                display: block;
                margin: 10px 0 5px;
                color: #555;
            }
            input[type="text"],
            input[type="number"],
            input[type="datetime-local"],
            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #28a745;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
            }
            input[type="submit"]:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Registro de Libro</h1>
            <form role="form" name="persona" action="form.jsp"  method="POST">

                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" id="nombre" required>

                <label for="autor">Autor:</label>
                <input type="text" name="autor" id="autor" required>

                <label for="pages">Páginas: </label>
                <input type="number" name="pages" id="pages" required>

                <label for="anio">Año: </label>
                <input type="number" name="anio" id="anio" required>

                
                <input type="submit" value="Confirmar">
            </form>
        </div>
    </body>
</html>