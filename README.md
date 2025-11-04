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
