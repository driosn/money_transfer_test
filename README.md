# meru_test

A new Flutter project.

## Cómo correr el proyecto

Para este proyecto se utilizó

Flutter 3.32.6

Para correrlo abrir el proyecto en algún editor, ejecutar en la linea de comandos

`dart run build_runner build --delete-conflitcing-outputs`

Seleccionar dispositivo y correr

## Decisiones tomadas

1. Uso de datasources/services globales: Observé que en varias partes era necesario reutilizar llamadas de datasources y todo era exactamente igual pero con variaciones, preferí tener datasources globales para permitir la reutilización y aplicar lógica específica a cada caso en repositories por feature.

2. Funcionalidad sobre estructura de Widgets: Debido al tiempo tuve que sacrificar uno, tener mejor estructurados los widgets o hacer que todo funcione bien, preferí lo segundo, creo que estructurar widgets es bastante sencillo ya que si todo está bien armado queda en capa de presentación.

3. Eliminación de entities/dtos: Creo que este es un proyecto que realmente no lo necesita con tener algunas clases models, podemos realizar todo y que siga siendo mantenible.

4. Uso de Cubit: Elegir el gestor de estado fue importante, al no necesitar una gran trazabilidad debido a ser una app sencilla y de prueba, Cubit me pareció la mejor opción.

## Qué cosas mejoraría

1. Organizaría mejor los widgets para que no estén todos en un mismo archivo

2. Armaría un sistema de diseño para soportar whitelabeling o dark theming

3. Agregaría un mejor manejo de errores, creando diferentes tipos de errores con sealed classes o frezzed para cada feature

4. Agregaría get_it: Es un service locator para gestionar inyección de dependencias.





