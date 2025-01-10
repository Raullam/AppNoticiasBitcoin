import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/news_controller.dart';
import '../model/article.dart';
import 'news_detail_page.dart'; // Importar la página de detalle

class HomePage extends StatelessWidget {
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final NewsController newsController = Get.put(NewsController());
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Noticias API - GetX"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
            child: Obx(() {
              if (newsController.isLoading.value) {
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
                return const Center(child: CircularProgressIndicator());
              } else {
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
                return ListView.builder(
                  itemCount: newsController.currentNews.length,
                  itemBuilder: (context, index) {
                    Article article = newsController.currentNews[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => NewsDetailPage(article: article));
                      },
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => newsController.fetchNews(),
                child: const Icon(Icons.update),
              ),
              ElevatedButton(
                onPressed: () {
                  newsController.saveNews();

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
              ElevatedButton(
                onPressed: () => newsController.loadSavedNews(),
                child: const Text("Noticias Guardadas"),
              ),
            ],
          ),
          const Divider(),
          Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Noticias Guardadas: ${newsController.savedNews.length}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}
