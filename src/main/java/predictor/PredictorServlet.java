package predictor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/predictor")
public class PredictorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Obtener parámetros y convertirlos a double
            double asistencia = Double.parseDouble(request.getParameter("asistencia"));
            double parcial = Double.parseDouble(request.getParameter("parcial"));
            double tarea = Double.parseDouble(request.getParameter("tarea"));

            // Llamar al modelo para predecir
            double resultado = Modelo.predecir(asistencia, parcial, tarea);

            // Verificar que la predicción sea válida (no -1)
            if (resultado == -1) {
                throw new Exception("La predicción no pudo ser calculada.");
            }

            // Formatear resultado a 2 decimales y enviar a JSP
            request.setAttribute("resultado", String.format("%.2f", resultado));
            request.getRequestDispatcher("resultado.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numéricos válidos.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error al procesar la solicitud: " + e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
