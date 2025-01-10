# **Notícies API - Aplicació de Notícies amb GetX** 📱📰

Aquest projecte és una aplicació mòbil creada amb **Flutter** i **GetX** que permet als usuaris consultar, guardar i veure notícies en temps real. L'aplicació fa servir una **API de notícies** per obtenir articles sobre un tema específic (per exemple, "bitcoin") i mostrar informació detallada sobre cadascun d'ells. Els usuaris poden guardar notícies i veure-les a un apartat de "Notícies Guardades".

## **Característiques Principals** 🔑

- 📰 **Interfície neta i senzilla**: L'aplicació ofereix una interfície intuïtiva per mostrar les notícies obtingudes de l'API de forma clara i atractiva.
- 🔄 **Obtenció dinàmica de notícies**: Les notícies es poden actualitzar en temps real amb un botó d'actualització.
- 💾 **Guardar notícies favorites**: Els usuaris poden guardar notícies i consultar-les més tard a la secció de "Notícies Guardades".
- 📖 **Detalls de les notícies**: Es pot tocar sobre qualsevol notícia per veure'n més informació, incloent-hi la descripció completa, la data de publicació i la imatge de la notícia.
- 🛠️ **Controlador GetX**: El controlador `NewsController` gestiona la lògica de càrrega, emmagatzematge i visualització de les notícies.

## **Tecnologies Utilitzades** ⚙️

- **Flutter**: Framework per al desenvolupament d'aplicacions mòbils.
- **GetX**: Llibreria per a la gestió de l'estat i el cicle de vida de l'aplicació.
- **NewsAPI**: API per obtenir notícies de tot el món.
- **HTTP**: Per fer sol·licituds HTTP a l'API.
- **Dart**: Llenguatge de programació utilitzat per desenvolupar l'aplicació.

## **Instruccions d'Ús** 📚

### **Requisits Prèvies** 🔑

1. Tenir **Flutter** instal·lat a la teva màquina.
2. Tenir un **emulador de dispositiu** configurat o un dispositiu físic connectat.
3. Tenir accés a una **API Key** de NewsAPI. Pots obtenir-la registrant-te a [NewsAPI](https://newsapi.org/).

## **Tecnologies Utilitzades** ⚙️   
## **Instal·la les dependències: Assegura't d'estar a la carpeta arrel del projecte i executa:


## **Funcionalitats ✨
Obtenir Notícies: Al iniciar l'aplicació, es carreguen automàticament 5 notícies relacionades amb un tema (exemple: "bitcoin") i es mostren a la pantalla principal.

Guardar Notícies: Es poden guardar notícies tocant el botó de guardar. Aquestes notícies es guarden a la memòria de l'aplicació.

Veure Notícies Guardades: Es poden veure totes les notícies guardades tocant el botó "Notícies Guardades".

Detalls de la Notícia: En tocar una notícia, s'accedeix a una nova pantalla amb tota la informació detallada de la notícia, incloent-hi la descripció i la imatge (si està disponible).

## **Estructura del Projecte 📂
plaintext
Copiar código
lib/
├── controllers/
│   └── news_controller.dart       # Controlador principal de notícies
├── model/
│   └── article.dart              # Model de la notícia
├── pages/
│   ├── home_page.dart            # Pantalla principal
│   └── news_detail_page.dart     # Detalls de la notícia
assets/
└── images/                       # Conté imatges i altres recursos
Captures de Pantalla 📸
Aquí pots afegir algunes captures de pantalla de l'aplicació en funcionament:


## **Contribucions 🤝
Si vols contribuir a aquest projecte, pots fer un fork i crear un pull request amb els teus canvis. Assegura't de seguir l'estil de codi establert i proporcionar una descripció clara dels canvis realitzats.

## **Llicència 📝
Aquest projecte està licenciat sota la Llicència MIT. Consulta el fitxer LICENSE per obtenir més informació.

## **Resum del Codi Principal 🧑‍💻
NewsController:
El controlador NewsController és el responsable d'obtenir les notícies des de l'API, gestionar-les i mantenir les notícies guardades. Utilitza GetX per gestionar l'estat reactiu de les llistes de notícies.

HomePage:
La pàgina principal mostra una llista de notícies i ofereix botons per actualitzar les notícies, guardar-les i veure les notícies guardades.

NewsDetailPage:
Mostra els detalls complets d'una notícia quan l'usuari la selecciona de la llista, permetent veure'n el contingut complet i la imatge associada.


### **Instal·lació** 🚀

1. **Clona el repositori**:
   ```bash
   git clone <URL del repositori>
   cd <nom del repositori>

````bash
flutter pub get
Configura la teva API Key: Aneu al fitxer news_controller.dart i substituïu el valor de api_key amb la vostra pròpia clau de l'API de NewsAPI:

dart
var api_key = "LA_TUYA_API_KEY";
Executa l'aplicació: Amb l'emulador o dispositiu físic configurat, executa:

bash
flutter run
