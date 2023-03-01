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

### Vista Principal
- El `Model` tiene 3 archivos:
-- En el 'ApiClient' para realizar la peticiones HTTP y parsear la respuesta al modelo de la clase.
-- En el 'ModelResponse' que es el nombre que tiene el array.
-- En el 'Model' que son las propiedades que tiene el array y se va a parsear.
- La`View` tiene las vistas de la TableView y CellView.
-- En la 'CellView' están todos los elementos que se visualizara y los setea el modelo que recibirá.
-- En el 'TableView' se registra el 'CellView' para que se visualice en forma de lista.
- El `Controller` tiene la lógica para que se cargue la información dentro de la lista.
-- En la `ListView` llama a la lista 'TableView' y 'ApiClient' para relacionarlos y mostrar la información. También tiene la responsabilidad de mostrar la subvista, pero con los 'Coordinators' se quita esta responsabilidad.
-- El el 'DataSource' se envía el modelo con los datos y esta los setea con la celda.
-- En el 'Delegate' mejoramos la vista de los elementos para que se vea ordenado.

### SubVista
- El `Model` no tiene ningún archivo porque se esta utilizando el modelo de la vista principal.
- El `View` tiene la creación de la vista de la subclase y el seteo del modelo que recibe con sus elementos.
- El `Controller` llama a la subvista para pasarle el modelo, aunque lo ideal es pasarle el 'Id' del modelo y esta llama el 'apiClient' para que reciba la nueva información y setearlo.
