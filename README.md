# SwiftArquitecturas
Obtener conocimiento de las Arquitecturas mas conocidas y utilizadas en Swift.

## MVC + Coordinators
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
- `Coordinators`: es un patrón que se usa para desacoplar los 'ViewControllers' de la lógica de navegación; es decir, que la responsabilidad de administrar los flujos entre vistas no sea asumida por los ViewControllers.
-- Tiene muchas ventajas porque se puede usar navegaciones en otras partes de la navegación.
-- Crear navegación push o modal, etc.

### Vista Principal
- El `Model` tiene 3 archivos:
-- En el 'ApiClient' para realizar la peticiones HTTP y parsear la respuesta al modelo de la clase.
-- En el 'ModelResponse' que es el nombre que tiene el array.
-- En el 'Model' que son las propiedades que tiene el array y se va a parsear.
- La`View` tiene las vistas de la TableView y CellView.
-- En la 'CellView' están todos los elementos que se visualizará y los setea el modelo que recibirá.
-- En el 'TableView' se registra el 'CellView' para que se visualice en forma de lista.
- El `Controller` tiene la lógica para que se cargue la información dentro de la lista.
-- En la `ListView` llama a la lista 'TableView' y 'ApiClient' para relacionarlos y mostrar la información.
-- El el 'DataSource' se envía el modelo con los datos y esta los setea con la celda.
-- En el 'Delegate' mejoramos la vista de los elementos para que se vea ordenado.

### SubVista
- El `Model` no tiene ningún archivo porque se esta utilizando el modelo de la vista principal.
- El `View` tiene la creación de la vista de la subclase y el seteo del modelo que recibe con sus elementos.
- El `Controller` llama a la subvista para pasarle el modelo, aunque lo ideal es pasarle el 'Id' del modelo y esta llama el 'apiClient' para que reciba la nueva información y setearlo.

### Coordinator
Contendra 3 Coordinators para hacer las navegaciones:
- El `MainCoordinator` se llamará al lanzar la aplicación y mostrará el listado principal.
-- Tenemos que poner el identificador que se a creado en el 'Main.storyboard'
-- Agregamos el Coordinator en el 'SceneDelegate' para que pueda funcionar.
- El `PushCoordinator` mostrará en forma de navegación el detalle de la información.
-- Lo inicializamos para que reciba el NavigationController y el Modelo, y lo pasamos al su método para que lo cargue.
-- Llamamos al método que carga la vista del detalle en el Viewcontroller.
- El `ModalCoordinator` mostrará en forma modal 'sheet' el detalle de la información.
-- La diferencia con el 'Push' es que en vez de enviar un 'Navigation' se envia un 'View' y lo mostramos con el '.present'.

