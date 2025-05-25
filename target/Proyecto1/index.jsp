<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nota Predictor</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f7f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            background: #fff;
            margin-top: 40px;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            max-width: 400px;
            width: 100%;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            font-weight: 700;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: 600;
        }

        input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1.8px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input[type="number"]:focus {
            border-color: #0078d7;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            background: #0078d7;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #005ea2;
        }

        .resultado {
            margin-top: 20px;
            background: #dff0d8;
            color: #3c763d;
            border: 1.5px solid #3c763d;
            padding: 12px 18px;
            border-radius: 6px;
            font-weight: 700;
            font-size: 1.1rem;
            text-align: center;
        }

        .error {
            margin-top: 20px;
            background: #f2dede;
            color: #a94442;
            border: 1.5px solid #a94442;
            padding: 12px 18px;
            border-radius: 6px;
            font-weight: 700;
            font-size: 1.1rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Nota Predictor</h1>
        <form action="predictor" method="post">
            <label for="asistencia">Asistencia (%):</label>
            <input type="number" id="asistencia" name="asistencia" step="0.1" required value="${param.asistencia}">

            <label for="parcial">Nota Parcial:</label>
            <input type="number" id="parcial" name="parcial" step="0.1" required value="${param.parcial}">

            <label for="tarea">Nota Tarea:</label>
            <input type="number" id="tarea" name="tarea" step="0.1" required value="${param.tarea}">

            <input type="submit" value="Predecir">
        </form>

        <c:if test="${not empty resultado}">
            <div class="resultado">
                Nota final estimada: ${resultado}
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="error">
                ${error}
            </div>
        </c:if>
    </div>
</body>
</html>
