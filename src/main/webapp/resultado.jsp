<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado</title>
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
            margin-top: 60px;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h1 {
            color: #333;
            font-weight: 700;
            margin-bottom: 25px;
        }

        h2 {
            color: #0078d7;
            font-weight: 700;
            margin-bottom: 30px;
            font-size: 1.6rem;
        }

        a {
            display: inline-block;
            background: #0078d7;
            color: white;
            padding: 12px 28px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background: #005ea2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Resultado</h1>
        <h2>La nota final estimada es: ${resultado}</h2>
        <a href="index.jsp">Volver</a>
    </div>
</body>
</html>
