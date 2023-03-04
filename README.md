# SwiftArquitecturas
Obtener conocimiento de las Arquitecturas más conocidas y utilizadas en Swift.

## Por qué utilizar una arquitectura?
- Una arquitectura bien diseñada puede ayudar a que la aplicación tenga una estructura solida y bien organizada.
- Puede facilitar su mantenimiento y ampliación en el futuro.
- Una buena arquitectura puede ayudar a que la aplicación sea fácil de entender y utilizar por otros developers.
- Puede ayudar a mejor el rendimiento, escalabilidad y testeabilidad de la aplicación.

## MVVM: Model - View - ViewModel
- `Model`: presenta los datos y la lógica de la aplicación.
-- Obtiene los datos que se utiliza en la aplicación.
- `View`: es la representación visual que se obtiene del 'ViewModel'.
-- Se encarga de lanzar acciones al 'ViewModel'.
-- Se encarga de escuchar los cambios de modelo que recibe del 'ViewModel.
- `ViewModel`: es el mediador entre la 'View' y el 'ViewModel'.
-- Nutre a la vista con la información que le llega del 'Model'.
-- Se encarga de recibir acciones de la 'View'.

> Nota: Conexión de la View con ViewModel
El 'ViewModel' comunica cambios en los datos a la 'View' mediante 'Binding' y no por el 'Delegation Pattern'.
El 'Binding' se crea desde la 'View' y se utiliza el 'Patrón Observer'.
El 'ViewModel' sera un objeto observable por la 'View'.
La 'View' siempre escucha cambios que ocurran en el 'ViewModel'.

## Beneficios
- Se puede reutilizar el modelo en diferentes partes de la aplicación (código reutilizable).
- Mejora la testeabilidad, se puede testear el 'ViewModel' sin preocuparse de la 'View' o 'Model'.
- Buena escalabilidad del código, cuando agregamos nueva funcionalidad, se puede agregar nuevos componentes.
