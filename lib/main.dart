// Importar los widgets básicos de Flutter

import 'package:flutter/material.dart';

// Importar la pantalla principal

import 'screens/pagina_principal.dart';

// Importar el paquete GetX

import 'package:get/get.dart';

// Ejecuta la aplicación

void main() {
  runApp(MyApp());
}

// Widget principal de la aplicación

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Configura la aplicación usando GetMaterialApp, parte del paquete GetX
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noticias con GetX', // Título de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Pantalla principal de la aplicación
    );
  }
}
