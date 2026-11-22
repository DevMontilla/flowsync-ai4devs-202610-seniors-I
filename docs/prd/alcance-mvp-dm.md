# FlowSync - PRD

#### Versión del documento: v0.2 — alcance acotado en el interrogatorio

> «Quiero que FlowSync sea una herramienta para que los equipos remotos sepan en qué está trabajando cada uno sin tener que hacer reuniones de sincronización. Algo tipo tareas compartidas pero más en tiempo real y menos rollo que Jira.»

---

## 1. El terreno que ya existe

FlowSync ya tiene construida la autenticación completa con token: registro, login, logout y perfil, con la sesión guardada en el navegador. El modelo de datos solo tiene users (nombre, email único y contraseña con hash) y los tokens de acceso. No existe todavía ninguna entidad de tareas, equipo o espacio, ni ningún mecanismo de tiempo real. Las tareas se construyen desde cero sobre el usuario autenticado, que es quien puede hacer de responsable.

---

## 2. El interrogatorio, con las respuestas decididas

1. **¿Qué estados tiene una tarea?** Existe el estado *bloqueada*. Las tareas *terminadas* siguen visibles en la lista, pero no se pueden coger.
2. **¿Quién puede quedarse una tarea?** Cada persona solo se asigna tareas a sí misma; nadie asigna trabajo a otro. Una tarea tiene un único responsable.
3. **¿Estado actual o "qué cambió desde mi última visita"?** Basta con ver la lista al día.
4. **¿Se ve la antigüedad de la información?** Sí: cada tarea muestra su fecha de creación y su fecha de última modificación.
5. **¿Cómo se entra al espacio único?** Registro abierto: quien se registra entra al espacio. Se acepta como riesgo abierto del caso de estudio.

---

## 3. Alcance del MVP

### Problema

En un equipo remoto pequeño nadie ve en qué está cada uno sin interrumpir a alguien. El coste se paga dos veces: en la ronda de "¿en qué estás?" de la daily, que se come la mitad de los 15 minutos, y en el goteo de preguntas por chat. Cuando esa información no llega, se pierde trabajo de verdad: dos personas tocaron el mismo módulo la misma semana porque una empezó sin que la otra lo supiera. Fueron dos días perdidos.

### Usuarios

- **Quién:** pares de un equipo remoto de 3 a 10 personas, todos con el mismo rol. Todos ven lo mismo y nadie tiene permisos especiales; lo que se puede hacer sobre una tarea depende solo de si eres su responsable (ver supuestos).
- **Caso de estudio (no es un cliente real):** equipo de producto SaaS de 6 personas, repartido en 3 husos horarios, con un gestor de tareas pesado y una daily de 15 minutos por videollamada.
- **Quién no:** el manager o el lead que busca un reporte hacia arriba. Tampoco un equipo que necesite sprints, estimaciones o backlog priorizado.

### Propuesta de valor

Una lista compartida que es a la vez la cola de trabajo de cada persona y el estado del equipo. Coger una tarea o cambiarle el estado cuesta dos clics. Esos cambios les llegan a los demás sin que tengan que refrescar ni preguntar. Quien actualiza gana en el momento: decide qué coge mirando esa misma lista y deja de recibir preguntas sobre cómo va. Quien consulta evita empezar algo que otra persona ya tiene entre manos y elige lo siguiente sabiendo qué está libre.

### Alcance (lo que entra)

Una única vertical: **la lista compartida de tareas, viva**.

1. **Crear una tarea en segundos.** Solo el título es obligatorio; la fecha de vencimiento es opcional. Quien la crea puede quedársela al momento o dejarla libre.
2. **Coger una tarea libre para uno mismo.** Si una tarea ya tiene responsable, nadie más puede cogerla. Mientras no esté terminada, el responsable puede soltarla: vuelve a quedar libre y en *pendiente*.
3. **Cambiar el estado en dos clics.** Hay cuatro estados: *pendiente*, *en curso*, *bloqueada* y *terminada*. Una tarea terminada sigue en la lista, pero ya no se puede coger.
4. **Ver la lista del equipo de un vistazo.** Cada tarea muestra título, responsable (o "libre"), estado, fecha de vencimiento, fecha de creación y fecha de última modificación. Las tareas vencidas y no terminadas se distinguen a simple vista.
5. **Filtrar la lista por estado**, para centrarse en lo pendiente.
6. **La lista se mantiene al día sin refrescar.** Cuando alguien crea una tarea, la coge, la suelta o le cambia el estado, los demás lo ven en su lista abierta sin recargar la página.

**Criterio de éxito:** tras una semana de uso real, el equipo del caso de estudio cancela la ronda de "¿en qué estás?" de la daily y nadie pide recuperarla. Si la siguen haciendo igual, el MVP no ha funcionado.

#### Las tres líneas

1. Propuestas por la IA dentro del alcance: 6. Dentro después del recorte: 6.
2. Tres cosas que dejé fuera:
   - **Asignar una tarea a otra persona.** No ayuda a validar la hipótesis de que el estado se mantiene al día porque quien lo escribe gana en el momento, ya que la lista es su propia cola de trabajo. Una tarea que otro te mete en la cola no la has elegido tú, y eso es justo lo que hay que medir.
   - **Ver "qué cambió desde mi última visita".** No ayuda a validar la hipótesis central: que ver qué está libre y qué tiene cada uno basta para cancelar la ronda de "¿en qué estás?". La lista al día ya sirve para esa decisión, y el historial no aporta información nueva sobre ella.
   - **Restringir quién entra al espacio.** No ayuda a validar ninguna hipótesis sobre la frescura del estado ni sobre la daily. En un equipo de confianza del caso de estudio, quién entra no cambia si la lista se mantiene viva.
3. Las exclusiones de las que menos seguro estoy son borrar tareas y reabrir una tarea terminada. *(Las eligió la IA, a petición mía, como las más discutibles; mi duda inicial era* bloqueada*, ver la nota de abajo.)* Aquí se contradicen lo barato y lo que valida. Excluirlas mantiene la lista sencilla y evita que alguien borre o resucite trabajo ajeno sin permisos. Pero el riesgo #1 es que la lista deje de reflejar la realidad, y las tareas creadas por error que no se pueden quitar, o las duplicadas para retomar algo, la ensucian justo en ese sentido. Entrarían si en la semana de uso real la lista acumula tareas basura o duplicadas que se interponen al decidir qué coger.

**Incoherencia señalada por la IA:** en mi primera versión de la línea 3 dije que la exclusión de la que menos seguro estaba era el estado *bloqueada*, y que "se pedía dejarlo fuera". La IA me señaló que no estaba excluido: lo había metido yo en el alcance al responder la pregunta 1. Los hechos tampoco pedían excluirlo; solo decían que el MVP no resuelve los bloqueos. Tenía razón, y cambié la línea 3.

### NO-alcance (y por qué)

**Ya decidido fuera:**

- **Notificaciones push.** La señal es un resumen que espera a que lo mires, no un aviso que interrumpe. Las notificaciones reproducirían la interrupción que queremos quitar.
- **Integración con Slack.** El producto sustituye la conversación de estado, no la duplica en otro canal. Además supone integración y OAuth de terceros.
- **Roles y permisos avanzados.** En equipos de 3 a 10 personas con roles planos, una jerarquía no resuelve nada y añade configuración, que es precisamente lo que "menos rollo que Jira" rechaza.
- **Analítica y reporting.** Nadie del usuario objetivo lo pide: no hay reporte hacia arriba, y a un manager le daría igual.
- **Comentarios en tareas.** Convierten la lista en un chat, y el tiempo real no es chat. La conversación sigue donde ya ocurre.

**Excluido al responder el interrogatorio** (asignar a otros, "qué cambió desde mi última visita", restringir quién entra) **y propuesto por la IA** (el resto):

- **"Qué cambió desde mi última visita" (historial, actividad, resaltado de novedades).** Los hechos hablan de "volver y ver qué se ha movido", pero la decisión que cambia es qué está libre y qué tiene otro, y para eso basta la lista al día con la fecha de última modificación visible. Un historial sería una segunda capability que no aporta nada a esa decisión.
- **Presencia o actividad de personas ("quién está conectado", "escribiendo…").** El estado es de la tarea, no de la persona. La presencia es vigilancia y la rechazamos a propósito.
- **Asignar una tarea a otra persona.** La lista solo se mantiene viva si es la cola que cada uno elige. Asignar a otros mete una jerarquía implícita y tareas en colas ajenas que nadie ha confirmado.
- **Varios responsables por tarea.** Con varios responsables vuelve a no saberse quién está realmente en algo. Si dos personas trabajan juntas en algo, se divide en dos tareas. Eso hace visible justo el solapamiento que causó los dos días perdidos.
- **Reabrir una tarea terminada.** Se queda visible para consultarla, pero si hay que retomar algo se crea una tarea nueva. Reabrir obliga a explicar estados de ida y vuelta que no ayudan a decidir nada hoy.
- **Borrar tareas.** Sin permisos, cualquiera podría borrar el trabajo de otro, y eso va contra la confianza en la lista. Lo que sobra se marca como terminado. *Candidato a volver si el uso real lo pide.*
- **Descripción, etiquetas, prioridad, subtareas y adjuntos.** Ninguno cambia la decisión de "qué cojo / qué tiene otro". Cada campo extra hace más lento el crear y actualizar en segundos, que es lo que sostiene el producto.
- **Búsqueda, orden configurable y filtros que no sean por estado.** Con 3 a 10 personas, la lista cabe en una pantalla. El filtro por estado cubre la forma de usarla que se ha decidido.
- **Sprints, estimaciones, épicas y backlog priorizado.** Es una renuncia explícita: un equipo que necesite eso no es nuestro usuario.
- **Estado derivado de Git, PRs, CI o calendario.** Sería otro producto, con integraciones y OAuth de terceros. El estado lo teclea quien hace la tarea.
- **Importar o sincronizar con otro gestor de tareas.** FlowSync sustituye al gestor, no convive con él. Convivir exige actualizar dos veces, y así muere esta categoría de producto.
- **Varios equipos o espacios, y personas en más de uno.** Hay un único espacio compartido (ver supuestos).
- **Restringir quién entra (invitaciones, códigos, lista de emails).** No cambia si el equipo mantiene viva la lista ni si cancela la ronda de la daily. En el caso de estudio, el registro abierto es un riesgo aceptado (ver supuestos).
- **Gestión de cuenta más allá de lo que ya existe (recuperar contraseña, editar perfil).** No cambia la decisión que justifica el MVP, y la autenticación actual basta para el caso de estudio.
- **La parte de bloqueos de la daily.** El estado *bloqueada* hace visible que una tarea está parada, pero resolver el bloqueo sigue siendo cosa de la daily, y este MVP no lo cubre.

### Supuestos y riesgos

- **Riesgo #1, la información se queda vieja:** si nadie actualiza, el producto pierde el sentido. La mitigación es que actualizar cueste dos clics y que las fechas de última modificación estén a la vista. No se obliga a nadie.
- **Espacio único:** todos los usuarios registrados comparten un único espacio de tareas. Varios equipos separados, o personas en más de uno, quedan fuera.
- **Registro abierto:** cualquiera con acceso a la URL puede registrarse y ver o editar la lista. Se acepta para el caso de estudio y no vale para un cliente real.
- **Quién cambia el estado:** solo el responsable de la tarea cambia su estado, la suelta o corrige su título y fecha. Cualquiera puede crear tareas, coger una libre y corregir el título o la fecha de una libre. *(Supuesto de la IA: los hechos dicen "todos editan lo mismo" pero también "el estado lo teclea quien hace la tarea"; prima lo segundo.)*
- **Tareas libres:** una tarea sin responsable solo puede estar *pendiente*. Una tarea terminada no se puede soltar: conserva su responsable. *(Supuesto de la IA.)*
- **Corregir título y fecha:** se permite en tareas no terminadas, con las reglas de arriba, para no forzar a crear otra tarea por una errata. Es parte de "crear una tarea", no una capability aparte. *(Supuesto de la IA.)*
