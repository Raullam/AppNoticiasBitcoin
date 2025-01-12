// Paquete principal para construir interfaces en Flutter

import 'package:flutter/material.dart';

// Importar GetX

import 'package:get/get.dart';

// Importar el controlador de noticias

import '../controllers/news_controller.dart';

// Importar el modelo de datos Article

import '../model/article.dart';

// Importar la página de detalle

import 'news_detail_page.dart';

// Página principal de la aplicación

class HomePage extends StatelessWidget {
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final NewsController newsController = Get.put(
      NewsController()); // Instancia del controlador de noticias usando GetX
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    // Estructura de la página principal

    return Scaffold(
      appBar: AppBar(
        title: const Text("Noticias API - GetX"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            // Observa cambios en el controlador usando Obx

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
            child: Obx(() {
              // Muestra un indicador de carga mientras las noticias se están cargando

              if (newsController.isLoading.value) {
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
                return const Center(child: CircularProgressIndicator());
              } else {
                // Si no hay noticias, muestra un mensaje
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
                if (newsController.currentNews.isEmpty) {
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  return const Center(
                    child: Text(
                      "No hi ha noticies disponibles.",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
                // Muestra la lista de noticias usando ListView.builder
                return ListView.builder(
                  itemCount:
                      newsController.currentNews.length, // Número de noticias
                  itemBuilder: (context, index) {
                    Article article =
                        newsController.currentNews[index]; // Artículo actual
                    return GestureDetector(
                      // Navegar a la página de detalles al hacer clic en una noticia
                      onTap: () {
                        Get.to(() => NewsDetailPage(article: article));
                      },
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Comprueba si hay una URL válida para la imagen
                            article.urlToImage.isNotEmpty
                                ? Image.network(
                                    article.urlToImage,
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    height: 180,
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: Icon(
                                        Icons.broken_image,
                                        size: 50,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ), // Placeholder si no hay imagen
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                article.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                article.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
          ),
          // Botones de acción para actualizar, guardar y cargar noticias
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Botón para actualizar las noticias
              ElevatedButton(
                onPressed: () =>
                    newsController.fetchNews(), // Actualizar noticias
                child: const Icon(Icons.update),
              ),
              // Botón para guardar las noticias
              ElevatedButton(
                onPressed: () {
                  newsController.saveNews(); // Guardar noticias

                  Get.dialog(
                    AlertDialog(
                      title: Text("S'han guardat 5 noticies."),
                      content: Text("Guardades Correctament."),
                      actions: [
                        TextButton(
                            onPressed: () => Get.back(), child: Text("Tancar")),
                      ],
                    ),
                  );
                },
                child: const Icon(Icons.save_alt_outlined),
              ),
              // Botón para cargar las noticias guardadas
              ElevatedButton(
                onPressed: () =>
                    newsController.loadSavedNews(), // Cargar noticias
                child: const Text("Noticias Guardadas"),
              ),
            ],
          ),
          const Divider(),
          // Muestra el número de noticias guardadas usando Obx
          Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Noticias Guardadas: ${newsController.savedNews.length}", // Número de noticias guardadas
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}
