
# Clinica Odontológica - Gestión de Turnos y Pacientes
Este proyecto es una aplicación web para la gestión de una clínica odontológica. Permite gestionar odontólogos, pacientes y la asignación de turnos de manera eficiente, teniendo en cuenta la disponibilidad de los odontólogos y sus horarios de trabajo.




## Características
- Gestión de Pacientes:
  Alta, baja, modificación y visualización de pacientes.
- Gestión de Odontólogos:
  Registro de odontólogos con especialidad y horario de atención.
- Asignación de Turnos:
- Asignación de citas a pacientes, tomando en cuenta la disponibilidad de los odontólogos según sus horarios.
- Listas de Turnos Disponibles:
  Visualización de turnos disponibles por   fechas, odontólogos y horas.

## Tecnologías Utilizadas
- Java: Lenguaje de programación principal.
- JPA (Java Persistence API): Para el manejo de persistencia de datos.
- JSP (JavaServer Pages): Para la generación dinámica de contenido web.
- Servlets: Para manejar las peticiones HTTP y la lógica del servidor.
- Bootstrap: Para el diseño y la estructura del frontend.
- MySQL: Base de datos para la persistencia de la información.
## Run Locally

Requisitos Previos
- Java JDK 8+
- Apache Tomcat 9+
- MySQL (o cualquier base de datos compatible con JPA)
- Maven (para gestión de dependencias, si es necesario)

Clona el repositorio

```bash
  git clone https://github.com/Meybe-1in/ClinicaOdontologica.git
```
Configura tu base de datos MySQL y actualiza los parámetros de conexión en el archivo `persistence.xml` 

Despliega el proyecto en Apache Tomcat.

Accede a la aplicación desde el navegador en: `http://localhost:8080/ClinicaOdontologica`
## Contribuciones
Las contribuciones al proyecto son bienvenidas. Si deseas aportar, por favor sigue los siguientes pasos:

Haz un fork del repositorio.
Crea una nueva rama `(git checkout -b feature/nueva-funcionalidad)`.

Realiza los cambios y haz un commit `(git commit -m 'Añadir nueva funcionalidad')`.

Envía los cambios a tu rama `(git push origin feature/nueva-funcionalidad)`.

Crea un Pull Request.
