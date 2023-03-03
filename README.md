# SwiftArquitecturas
Obtener conocimiento de las Arquitecturas más conocidas y utilizadas en Swift.

## Por qué utilizar una arquitectura?
- Una arquitectura bien diseñada puede ayudar a que la aplicación tenga una estructura solida y bien organizada.
- Puede facilitar su mantenimiento y ampliación en el futuro.
- Una buena arquitectura puede ayudar a que la aplicación sea fácil de entender y utilizar por otros developers.
- Puede ayudar a mejor el rendimiento, escalabilidad y testeabilidad de la aplicación.

## VIPER
- Se utiliza para organizar el código en módulos, estos módulos son pequeños y reutilizables.
- Cada módulo tiene una responsabilidad especifica:
-- Ayuda a mantener el código limpio y fácil de mantener.
-- Ayuda a testear mejor las diferentes capas de nuestra aplicación.
- VIPER se compone en: View - Interactor - Presenter - Entity - Router.
-- Todo esto se usa para crear una pantalla y esa pantalla es un módulo.
-- Cada pantalla es un módulo de VIPER.

### Definición de V-I-P-E-R
- `View`: es la vista que mostrara la información necesaria al usuario.
- `Presenter`: tiene una doble función en la arquitectura de VIPER:
-- Se encarga de recibir las acciones de la 'View'.
-- Se encarga de presentar los datos a la 'View', este realiza la lógica de presentación y la 'View' solo muestra lo que le pasa el 'Presenter'.
- `Interactor`: recibe las acciones que le pasa el 'Presenter' y sabe qué hacer para devolver lo que se le ha pedido.
-- Aquí se tiene la lógica del negocio, dentro de esta lógica se puede obtener la información de varias fuentes: petición HTTP o base de datos.
-- Busca la información que le pide el 'Presenter'.
- `Router`: permite navegar a otras pantallas dentro de la aplicación.
-- Son los encargados de recibir una orden del 'Presenter' indicando a dónde queremos navegar.
- `Entities`: son los modelos de la lógica del negocio.
-- Son los modelos con los que trabaja el 'Interactor'.
-- Un modelo puede ser la transformación de Json a un modelo de nuestro dominio.
-- Las struct para transformar el Json al modelo son las entities.

> Nota: algunos de los componentes (Presenter, Interactor, Router) se pueden comunicar entre ellos usando protocolos a través de interfaces. 
De esta manera el código está más desacoplado y se puede trabajar con 'Abstracciones' en vez de 'Implementaciones completas' haciendo más fácil testear el código.

> Nota: PRESENTER
. Las referencias del Presenter con el Interactor y Router son fuertes, y con la View es debil.
. No tiene la responsabilidad que saber cómo se pasa del Entity al ViewModel.

> Nota: VIEW
. Tiene una dependencia en el inicializafdor donde se le tiene que inyectar una instancia del Presenter.

## Inyeccion de Dependencias
 - Algunos componentes de VIPER se comunican mediante protocolos.
 - Es importante trabajar en 'Abstracciones' con protocolos, de esta manera, cualquier tipo que conforme el protocolo se puede sustituir e inyectar en el codigo.
- Al crear las 'Abstracciones' se puede intercambiar los tipos, donde cada tipo puede contener una implementacion diferente.
- Es muy util para realizar Test Unitarios o Test de Integracion.