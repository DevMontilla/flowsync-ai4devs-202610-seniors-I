# Prompts

Aquí van **todos los prompts que lanzaste** para hacer el ejercicio, en el orden en que los
lanzaste, con el modelo y la herramienta de cada uno.

Esto no es papeleo. Lo que se revisa es **cómo pediste las cosas**, no solo lo que salió: un
resultado flojo con un prompt bueno y un resultado flojo con un prompt vago necesitan feedback
distinto, y sin este archivo no se distinguen.

## Cómo rellenarlo

- Un apartado `## Prompt N` por cada prompt.
- **Pega el prompt tal cual lo lanzaste**, dentro del bloque de código, aunque ocupe diez líneas
  y aunque tenga faltas. No lo reescribas para que quede bien: el que arreglaste mentalmente
  después no es el que lanzaste.
- Incluye también los que **no funcionaron**. Suelen ser los más útiles de leer.
- `Modelo` y `Herramienta` en todos. Si cambiaste de una a otra a mitad, se nota aquí.

---

## Prompt 1

**Modelo:** Opus 5.5
**Herramienta:** Claude Code

```
Haz un resumen del actual proyecto. Identifica las capabilities construidas, como es el proceso de datos actual
```

**Qué salió:** resumen de capabilities (auth con token: signup, login, logout, perfil), modelo de datos (users + access tokens) y flujo de datos, más una versión de 3-5 líneas para el PRD.

## Prompt 2

**Modelo:** Opus 5.5
**Herramienta:** Claude Code

```
Vamos a refinar el PRD. Pregunta antes de proponer: las 5 preguntas que mas reducirian la incertidumbre sobre el problema, los usuarios y el alcance. Acotate a una sola ronda y NO bajes en el analisis hacia el modelo de datos o a nivel tecnico de los endpoints. Ten encuenta estos hechos: 

- Qué duele hoy: la daily de sincronización y el "¿en qué estás?" constante por Slack/chat. Nadie ve el estado del equipo sin interrumpir a alguien.
- Quién cobra el valor: los pares, no un lead. No hay reporte hacia arriba y a un manager le daría igual. Duele a los dos devs que descubren tarde que iban a lo mismo, y al que interrumpe a otro para preguntar.
- Episodio concreto: dos personas del equipo tocaron el mismo módulo la misma semana porque una empezó sin que la otra lo supiera. Dos días perdidos.
- Qué reunión desaparece (respuesta honesta, no la vendas de más): la daily NO desaparece entera. Desaparece la ronda de "¿en qué estás?", que hoy se come la mitad de los 15 minutos. La parte de bloqueos sigue, y este MVP no la resuelve.
- Usuarios / equipo: equipos remotos pequeños, 3–10 personas. Roles planos: en el MVP todos ven y editan lo mismo, sin jerarquía de permisos.
- Primer usuario concreto: equipo de 6 personas de producto SaaS, en 3 husos horarios, que hoy usa un gestor de tareas pesado y una daily de 15 minutos por videollamada. Es un CASO DE ESTUDIO, no un cliente real.
- Fronteras: un espacio único compartido, sin entidad "equipo". Varios equipos separados, o gente en más de uno, queda FUERA del MVP: se anota como supuesto en el PRD, no se construye.
- "Tiempo real" = ver los cambios de estado de las tareas sin refrescar ni preguntar. NO es chat, NO es videollamada, NO es colaboración simultánea sobre el mismo documento.
- Es frescura, no presencia: el estado es de la TAREA, no de la persona. Nada de "quién está conectado ahora" ni indicadores de actividad; eso es vigilancia y lo rechazamos a propósito.
- Forma de la señal: resumen que espera, no aviso que interrumpe. El caso es "llego por la mañana o vuelvo de una reunión y veo qué se ha movido". Sin notificaciones push.
- Qué decisión cambia: no empezar algo que otra persona ya está tocando, y elegir lo siguiente sabiendo qué está libre. Si la única respuesta fuera "sentirse informado", el tiempo real no valdría lo que cuesta.
- De dónde sale el estado: lo teclea la persona que hace la tarea, en segundos. Derivarlo de señales externas (Git/PRs, CI, calendario) está FUERA del MVP: es otro producto, con integraciones y OAuth de terceros.
- Por qué se sostiene: no porque sea más agradable, sino porque son dos clics sobre una lista ya abierta, sin campos obligatorios, sin decidir sprint ni estimación. Y quien lo escribe cobra en el momento: esa misma lista es su cola de trabajo, la mira para decidir qué coge, y de paso deja de recibir interrupciones preguntándole cómo va. Si el beneficio fuera solo para los demás, no lo escribiría.
- Si la información se queda vieja: el producto pierde el sentido, y lo asumo. Es el riesgo #1 a validar, no un detalle. La mitigación es que actualizar cueste dos clics, no obligar a nadie.
- Es donde se hace el trabajo, no donde se cuenta: sustituye al gestor de tareas, no convive con él. FlowSync crea las tareas, no lee las de otro sitio. Convivir exigiría doble actualización, que es como muere esta categoría.
- Renuncia explícita a sprints, estimaciones, épicas, backlog priorizado e informes. Un equipo que necesite eso no es nuestro usuario.
- "Menos rollo que Jira" = crear una tarea y cambiarle el estado en segundos, sin flujos de configuración ni campos obligatorios. Lo mínimo para saber quién está en qué.
- Qué necesita una tarea en el MVP: título, responsable, estado y fecha de vencimiento. La fecha, para ver de un vistazo qué se ha pasado de plazo.
- Cómo se consume la lista: filtrando por estado, para centrarse en lo pendiente.
- Éxito para el usuario: dejar de hacer la ronda de "¿en qué estás?" de la daily porque el estado del equipo se ve de un vistazo.
- Criterio a una semana de uso real: que el equipo cancele esa ronda y nadie pida que vuelva. Si la siguen haciendo igual, no funcionó.
- Cuánto construir: una vertical fina y usable de punta a punta, no el andamiaje amplio de un producto. Prefiero una capability terminada a tres a medias.
```

**Qué salió:** cinco preguntas en una sola ronda (estados, quién coge tareas, lista al día vs. cambios desde la última visita, antigüedad visible, acceso al espacio), sin proponer alcance ni bajar a técnica.

## Prompt 3

**Modelo:** Opus 5.5
**Herramienta:** Claude Code

```
- Fuera del MVP: notificaciones push, integración con Slack, roles/permisos avanzados, analítica/reporting, comentarios en tareas
1. Una tarea puede tener estado bloqueada. Las tareas terminadas siguen en la lista para ser observadas pero no pueden ser selccionadas
2. Una tarea puede ser elegida solo por si mismo. La tarea tiene un solo responsable
3. Basta con ver la lista al dia
4. Debe verse la fecha de creacion de la tarea y la ultima fecha de modificacion
5. Se acepta el riesgo abierto como supuesto del caso de estudio
```

**Qué salió:** escribió el PRD en `docs/prd/alcance-mvp-dm.md` (terreno, interrogatorio, cinco bloques) con 6 puntos de alcance, 20 exclusiones justificadas y 3 supuestos propios marcados para revisar.

## Prompt 4

**Modelo:** Opus 5.5
**Herramienta:** Claude Code

```
Debajo del alcance, en el mismo archivo, anota estas tres lineas:
1. Cuantas cosas propuso la IA meter dentro del alcance y cuantas quedaron dentro despues del recorte. Sin redondear ni explicar
2. Tres de las cosas que deje fuera.
3. La exclusion de la que menos seguro estoy: Estado bloqueada. se pedia que se dejara fuera del MVP, pero saber que hay un bloqueo es fundamental para poder agilizar la tarea y buscar en conjunto la forma de resolverlo
```

**Qué salió:** añadió las tres líneas, pero avisó de que "6 → 6" indica que no hubo recorte y de que *bloqueada* estaba dentro del alcance, no excluida.

## Prompt 5

**Modelo:** Opus 5.5
**Herramienta:** Claude Code

```
Modifica la exclusion por las mas discutibles.
Cambia a la rama feat/alcance-dm
Completa el archivo prompts.md con los prompts utilizados desde el principio de la sesion hasta este punto, obviando este ultimo prompt
```

**Qué salió:** cambió la línea 3 de *bloqueada* a "borrar tareas y reabrir terminadas", renombró la rama y rellenó `prompts.md` con los prompts 1-4.

## Prompt 6

**Modelo:** Opus 5.5
**Herramienta:** Claude Code

```
Sigue con el cierre
```

**Qué salió:** commit, PR contra `s2/start` en el fork y revisión adversarial. Corrigió las contradicciones en las reglas de responsable y dejó el resto de hallazgos como comentario en el PR.

## Prompt 7

**Modelo:** Opus 5.5
**Herramienta:** Claude Code

```
Agrega el prompt que dejamos fuera aproposito para corregir el conflicto o la falta de coincidencia de la linea 3. No hice recortes directamente, se excluyeron alcances al responder las preguntas realizadas por el agente. Haz lo que pide el README
```

**Qué salió:** lo interrumpí para añadir que se volviera a lanzar la revisión adversarial (ver Prompt 8).

## Prompt 8

**Modelo:** Opus 5.5
**Herramienta:** Claude Code

```
Agrega el prompt que dejamos fuera aproposito para corregir el conflicto o la falta de coincidencia de la linea 3. No hice recortes directamente, se excluyeron alcances al responder las preguntas realizadas por el agente. Vuelve a ejecutar adversarial-reviewer. Haz lo que pide el README.
```

**Qué salió:** añadió los prompts 5-8, completó las tres líneas con el formato del README (por qué en forma de hipótesis, qué tendría que pasar, qué se contradecía) más la incoherencia señalada por la IA, cambió a la rama `alcance-dm` y abrió el PR contra el repo del curso.
