package predictor;

import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;
import weka.core.Utils;
import weka.classifiers.Classifier;
import weka.classifiers.functions.LinearRegression;

public class Modelo {
    private static Classifier modelo;
    private static Instances estructura;

    static {
        try {
            System.out.println("Cargando estructura del archivo ARFF...");
            // Cargar estructura
            DataSource source = new DataSource(Modelo.class.getClassLoader().getResourceAsStream("datos/notas.arff"));
            estructura = source.getStructure();
            estructura.setClassIndex(estructura.numAttributes() - 1);

            System.out.println("Cargando datos completos...");
            // Cargar dataset completo para entrenamiento
            DataSource full = new DataSource(Modelo.class.getClassLoader().getResourceAsStream("datos/notas.arff"));
            Instances data = full.getDataSet();
            data.setClassIndex(data.numAttributes() - 1);

            System.out.println("Instancias cargadas: " + data.numInstances());
            System.out.println("Atributos: " + data.numAttributes());
            System.out.println("Entrenando modelo de regresión lineal...");
            modelo = new LinearRegression();
            modelo.buildClassifier(data);
            System.out.println("Modelo entrenado correctamente.");

        } catch (Exception e) {
            System.err.println("Error al entrenar el modelo:");
            e.printStackTrace();
        }
    }

    public static double predecir(double asistencia, double parcial, double tarea) {
        try {
            // Creamos arreglo para valores (atributos + clase)
            double[] valores = new double[estructura.numAttributes()];

            // Asignamos valores de entrada
            valores[0] = asistencia;
            valores[1] = parcial;
            valores[2] = tarea;
            valores[3] = Utils.missingValue(); // Valor missing para la clase (nota_final)

            // Creamos instancia con los valores
            Instance nueva = new weka.core.DenseInstance(1.0, valores);

            // Asociamos la instancia a la estructura (dataset)
            nueva.setDataset(estructura);

            // Obtenemos la predicción
            double prediccion = modelo.classifyInstance(nueva);

            System.out.println("Predicción generada: " + prediccion);
            return prediccion;

        } catch (Exception e) {
            System.err.println("Error al predecir:");
            e.printStackTrace();
            return -1;
        }
    }
}
