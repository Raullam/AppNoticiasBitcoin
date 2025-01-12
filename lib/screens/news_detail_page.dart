// Importar el paquete material.dart

import 'package:flutter/material.dart';

// Importar el paquete GetX

import 'package:get/get.dart';

// Importar el modelo de datos Article
import '../model/article.dart';

// Clase para mostrar los detalles de un artículo de noticias

class NewsDetailPage extends StatelessWidget {
  final Article article; // Objeeto Article

  // Constructor que requiere un objeto Article como parámetro

  NewsDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    // Convertir la fecha de publicación desde ISO 8601 a un formato legible
    String publishedDate = article.publishedAt;

    // Reemplazar el "T" por un espacio y quitar el "Z" al final de la fecha
    String formattedDate =
        publishedDate.replaceAll('T', ' ').replaceAll('Z', '');

    // Esttructura de la página de detalles de la noticia

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de la Noticia"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
          onPressed: () => Get.back(), // Navegar hacia atrás usando GetX
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ),
      ),

      // Cuerpo de la página

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Comprueba si hay una URL válida para la imagen

            article.urlToImage.isNotEmpty
                ? Image.network(
                    article.urlToImage,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 250,
                    color: Colors.grey), // Placeholder para la imagen

            // Título del artículo

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                article.title, // Título del artículo
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Fecha de publicación

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Publicado: ${formattedDate}", // Fecha de publicación
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),

            // Descripción del artículo

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                article.description, // Descripción del artículo
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
