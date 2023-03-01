# SwiftArquitecturas
Obtener conocimiento de las Arquitecturas mas conocidas y utilizadas en Swift.

## MVC
Apple lo tuvo presente por mucho tiempo con el Framework UIKit.
- `Model`: son los datos que se utilizan para obtener la información que se va a representar en las vistas de la aplicación.
-- Es reusable, se puede usar en varias partes de la aplicación.
- `View`: es una representación visual del modelo que se va a mostrar en las pantallas de la aplicación.
-- Es reusable, se puede usar en varias partes de la aplicación.
- `Controller`: es el mediador, es el que conecta la 'View' con el 'Model'.
-- Cuando se realiza una acción en la 'View', esta acción la recibe el 'Controller' y controla que lógica utilizar.
-- El Controller recibe la acción y ejecuta una de las tareas que tenga que realizar.
-- El Controller crea la vista y el modelo, y hace de mediador entre estas capas; nunca el modelo se conecta con la vista directamente y viceversa.
-- El Controller es la pieza más importante y la menos reusable.
