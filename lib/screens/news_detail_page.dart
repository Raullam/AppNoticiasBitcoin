import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/article.dart';

class NewsDetailPage extends StatelessWidget {
  final Article article;

  NewsDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    // Convertir la fecha de publicación desde ISO 8601 a un formato legible
    String publishedDate = article.publishedAt;

    // Reemplazar el "T" por un espacio y quitar el "Z" al final de la fecha
    String formattedDate =
        publishedDate.replaceAll('T', ' ').replaceAll('Z', '');

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de la Noticia"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
          onPressed: () => Get.back(), // Navegar hacia atrás
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                article.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Publicado: ${formattedDate}",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                article.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
