package logica;

import java.util.Date;
import java.util.List;

import persistencia.ControladoraPersistencia;

public class ControladoraLog {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public ControladoraLog() {
    }
    
    
    public void crearUsuario(String nombreUsuario, String contra, String rol){
        Usuario usu = new Usuario();
        usu.setNombreUsuario(nombreUsuario);
        usu.setContrasenia(contra);
        usu.setRol(rol);
  
        controlPersis.crearUsuario(usu);
    }

    public List<Usuario> getUsuarios() {
       return controlPersis.getUsuarios();
    }

    public void borrarUsuario(int id) {
        controlPersis.borrarUsuario(id);
    }

    public Usuario traerUsuario(int id) {
        return controlPersis.traerUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }


    public void crearOdonto(String dni, String nombre, String apellido, String telefono, Date fechaNac, String direccion, String especialidad, Usuario unUsuario, Horario unHorario) {
       if (unUsuario == null) {
            throw new IllegalArgumentException("El usuario no puede ser nulo.");
        }
        
        if (esUsuarioAsignado(unUsuario)) {
            throw new IllegalArgumentException("El usuario ya está asignado a otro odontólogo.");
        }
         
        Odontologo odon = new Odontologo();
        odon.setDni(dni);
        odon.setNombre(nombre);
        odon.setApellido(apellido);
        odon.setTelefono(telefono);
        odon.setDireccion(direccion);
        odon.setFecha_nac(fechaNac);
        odon.setEspecialidad(especialidad);
        odon.setUnUsuario(unUsuario);
        odon.setUnHorario(unHorario);
        
        controlPersis.crearOdonto(odon);
        
    }

    public List<Odontologo> getOdontologos() {
      
        return controlPersis.getOdontologos();
    }

    public void borrarOdonto(int id) {
        controlPersis.borrarOdonto(id);
    }

    public void editarOdonto(Odontologo odon) {
        controlPersis.editarOdonto(odon);
    }

    public Odontologo traerOdonto(int id) {
        return controlPersis.traerOdonto(id);
    }
    
    public boolean esUsuarioAsignado(Usuario usuario) {
        List<Odontologo> odontologos = getOdontologos();
           for (Odontologo odon : odontologos) {
               Usuario odonUsuario = odon.getUnUsuario();
               if (odonUsuario != null && odonUsuario.getId_usuario() == usuario.getId_usuario()) {
                   return true;
               }
           }
           return false;
}

    public void crearHorario(String diaSemana, String horario_inicio, String horario_fin) {
        Horario horario = new Horario(diaSemana, horario_inicio, horario_fin);
        controlPersis.crearHorario(horario);}

    public List<Horario> getHorarios() {
       return controlPersis.getHorarios();
    }

    public Horario traerHorario(int idHorario) {
        return controlPersis.traerHorario(idHorario);
    }

    public void crearPaciente(String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac, String tipoSangre, boolean seguroSo, Responsable unResponsable) {
        Paciente pacien = new Paciente();
        pacien.setDni(dni);
        pacien.setNombre(nombre);
        pacien.setApellido(apellido);
        pacien.setTelefono(telefono);
        pacien.setDireccion(direccion);
        pacien.setFecha_nac(fechaNac);
        pacien.setTipoSangre(tipoSangre);
        pacien.setSeguro_so(seguroSo);
        pacien.setUnResponsable(unResponsable);
       
        controlPersis.crearPaciente(pacien);
    }

    public void crearResponsable(String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac, String tipoParentesco) {
        Responsable responsable = new Responsable();
        
        responsable.setDni(dni);
        responsable.setNombre(nombre);
        responsable.setApellido(apellido);
        responsable.setTelefono(telefono);
        responsable.setDireccion(direccion);
        responsable.setFecha_nac(fechaNac);
        responsable.setTipo_responsable(tipoParentesco);
        
        controlPersis.crearResponsable(responsable);
    }

    public List<Responsable> getResponsables() {
        return controlPersis.getResponsables();
    }

    public Responsable traerResponsable(int idResponsable) {
        return controlPersis.traerResponsable(idResponsable);
    }

    public List<Paciente> getPacientes() {
        return controlPersis.getPacientes();
    }

    public void borrarPaciente(int id) {
        controlPersis.borrarPaciente(id);
    }

    public void borrarResponsable(int id) {
        controlPersis.borrarResponsable(id);
    }

    public void editarPaciente(Paciente paciente) {
        controlPersis.editarPaciente(paciente);
    }

    public Paciente traerPaciente(int id) {
        return controlPersis.traerPaciente(id);
    }


   
}
