#  Configuración de Java para Flutter 3.24.3

Este documento explica cómo instalar y configurar Java JDK 17 para garantizar la compatibilidad con Flutter 3.24.3 y Gradle 8.3.

---

##  Requisitos

- Flutter 3.24.3
- Java JDK 17 (compatible con Gradle 8.3)
- Sistema operativo: Windows

---

##  Instalación de Java JDK 17

### 1. Descargar JDK

Se recomienda usar **Eclipse Temurin JDK 17**:

- Sitio oficial: [https://adoptium.net/es/temurin/releases/?version=17](https://adoptium.net/es/temurin/releases/?version=17)

Descarga el instalador para Windows y sigue los pasos de instalación.

### 2. Verificar instalación

Abre la terminal (CMD o PowerShell) y ejecuta:

```bash
java -version
```

##  Árbol de directorios

```bash
+---lib
|   |   main.dart
|   |
|   +---components
|   |   |   button.dart
|   |   |   custom_input.dart
|   |   |   error_load_api.dart
|   |   |   loader.dart
|   |   |   snack.dart
|   |   |
|   |   \---country_card_information
|   |           country_action_buttons.dart
|   |           country_detail_information.dart
|   |           country_information.dart
|   |
|   +---cubits
|   |       countries_information_api.dart
|   |       countries_information_db.dart
|   |       countries_information_search_api.dart
|   |
|   +---models
|   |       country_model.dart
|   |
|   +---services
|   |   +---API
|   |   |   |   main.dart
|   |   |   |
|   |   |   \---methods
|   |   |       \---countries
|   |   |               main.dart
|   |   |
|   |   +---BD
|   |   |       main.dart
|   |   |
|   |   \---configuration
|   |       +---envs
|   |       |       main.dart
|   |       |
|   |       \---styles
|   |               spaces_between.dart
|   |               text_styles.dart
|   |
|   \---views
|       +---countries_local
|       |       countries_page_main.dart
|       |       countries_states.dart
|       |
|       +---countries_online
|       |   +---main
|       |   |       countries_page_main.dart
|       |   |       countries_states.dart
|       |   |
|       |   \---search
|       |       |   countries_search_page.dart
|       |       |   countries_search_states.dart
|       |       |
|       |       \---components
|       |               search_bar.dart
|       |               search_body.dart
|       |
|       \---country_details
|               country_detail_page.dart
|
\---test
        widget_test.dart
```


---
# Lógica de Desarrollo y Estructura del Proyecto


Implementé el endpoint de países, pero debido a que no cuenta con paginación y devuelve una gran cantidad de información, configuré la solicitud para que solo obtenga una cantidad limitada de datos. Esto permite que la carga del endpoint sea más rápida y que, para esta prueba, se utilice menos espacio de almacenamiento.  

En escenarios reales, puede ser necesario almacenar grandes volúmenes de información, pero en este caso no resulta indispensable.  

En el componente, agregué un **booleano** que indica si la vista actual corresponde al modo “general”.  
- Cuando el valor es `true`, solo se muestran dos datos básicos.  
- Al cambiar a la pantalla de “ver detalles”, el booleano pasa a `false` y se muestra el resto de la información.  

Esta estrategia facilita reutilizar el modelo y **evitar peticiones adicionales al servidor**, ya que los datos se pueden pasar directamente a la pantalla de detalles. De esta forma, el componente ya está preparado para integrarse con el listado general, el buscador y el visualizador de información guardada en la base de datos.  

Además, agregué **clases globales** para estandarizar:
- Los estilos de texto,  
- Los espacios entre componentes, y  
- El consumo de servicios (como los endpoints).

#  Adicionales

En caso de ser necesario, se recomienda utilizar **FVM (Flutter Version Manager)** para manejar versiones específicas de Flutter y garantizar compatibilidad con el proyecto.

### 🔧 Instalación y configuración de FVM

```bash
dart pub global activate fvm
fvm install 3.24.3
fvm use 3.24.3
```
# Descargar APK

Haz clic en el botón o en el enlace para descargar el APK desde Google Drive.

> ⚠️ Asegúrate de que el archivo en Drive tenga permisos: **Cualquiera con el enlace puede ver/descargar**.

[⬇️ Descargar APK (enlace directo)](https://drive.google.com/file/d/13ad30hiFMprmFxAUqsouurrAd5dmoCnZ/view?usp=sharing)


