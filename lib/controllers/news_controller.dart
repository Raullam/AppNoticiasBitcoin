// Importar GetX

import 'package:get/get.dart';

// Importar la biblioteca HTTP para realizar solicitudes de red

import 'package:http/http.dart' as http;

// Importa para trabajar con datos JSON

import 'dart:convert';

// Importar el modelo de datos Article

import '../model/article.dart';

// Controlador para manejar el estado y la lógica de las notícias

class NewsController extends GetxController {
  var currentNews = <Article>[].obs; // Lista de artículos actuales
  var savedNews = <Article>[].obs; // Lista de artículos guardados
  var isLoading = false.obs; // Indicador de carga

  @override
  void onInit() {
    super.onInit();
    fetchNews(); // Cargar noticias al iniciar
  }

  int currentPage = 1; // Controlador de la página actual

  void fetchNews() async {
    try {
      isLoading(true); // Inicia el indicador de carga
      var api_key = "a8a15d2a0d254a48aa79467cbe4eadda"; // Clave de la API
      final response = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?q=bitcoin&language=es&pageSize=5&page=$currentPage&apiKey=$api_key'),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var articles = data['articles'] as List;

        // Filtrar los artículos con imágenes y convertirlos en objetos NewsArticle
        var newArticles = articles
            .where((article) =>
                article['urlToImage'] != null) // Solo artículos con imágenes
            .map((article) => Article.fromJson(article))
            .toList();

        // Limitar a las 5 primeras noticias
        List<Article> fiveNewArticles = newArticles.take(5).toList();

        // Actualizar la lista de noticias con las 5 nuevas (convirtiendo a RxList)
        currentNews.value =
            fiveNewArticles; // Asignar a una RxList usando .value
        currentPage++; // Incrementar la página para la siguiente actualización
      } else {
        print("Error: No se pudieron cargar las noticias.");
      }
    } catch (e) {
      print("Error al obtener noticias: $e");
    } finally {
      isLoading(false); // Detiene el indicador de carga
    }
  }

  // Método para guardar las noticias actuales

  void saveNews() {
    // Solo agrega las noticias actuales a la lista de noticias guardadas
    savedNews.addAll(currentNews);
  }

  // Método para cargar las noticias guardadas y agregarlas a las noticias actuales
  void loadSavedNews() {
    currentNews.assignAll(
        savedNews); // Sustituye las noticias actuales por las guardadas
  }
}
