package persistencia;

import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Responsable;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
   HorarioJpaController horaJPA = new HorarioJpaController();
   OdontologoJpaController odontoJPA = new OdontologoJpaController();
   PacienteJpaController pacJPA = new PacienteJpaController();
   PersonaJpaController persJPA = new PersonaJpaController();
   ResponsableJpaController respJPA = new ResponsableJpaController();
   SecretarioJpaController secreJPA = new SecretarioJpaController();
   TurnoJpaController turnJPA = new TurnoJpaController();
   UsuarioJpaController usuJPA = new UsuarioJpaController();

    public void crearUsuario(Usuario usu) {
        usuJPA.create(usu);
    }

    public List<Usuario> getUsuarios() {
        return usuJPA.findUsuarioEntities();
    }

    public void borrarUsuario(int id) {
       try {
           usuJPA.destroy(id);
       } catch (NonexistentEntityException ex) {
           Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public Usuario traerUsuario(int id) {
        return usuJPA.findUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
       try {
           usuJPA.edit(usu);
       } catch (Exception ex) {
           Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public void crearOdonto(Odontologo odon) {
        odontoJPA.create(odon);
    }

    public List<Odontologo> getOdontologos() {
        return odontoJPA.findOdontologoEntities();
    }

    public void borrarOdonto(int id) {
       try {
           odontoJPA.destroy(id);
       } catch (NonexistentEntityException ex) {
           Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public void editarOdonto(Odontologo odon) {
       try {
           odontoJPA.edit(odon);
       } catch (Exception ex) {
           Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public Odontologo traerOdonto(int id) {
        return odontoJPA.findOdontologo(id);
    }

    public void crearHorario(Horario horario) {
        horaJPA.create(horario);
    }

    public List<Horario> getHorarios() {
       return horaJPA.findHorarioEntities();
    }

    public Horario traerHorario(int idHorario) {
        return horaJPA.findHorario(idHorario);
    }

    public void crearPaciente(Paciente pacien) {
        pacJPA.create(pacien);
    }

    public void crearResponsable(Responsable responsable) {
        respJPA.create(responsable);
    }

    public List<Responsable> getResponsables() {
        return respJPA.findResponsableEntities();
    }

    public Responsable traerResponsable(int idResponsable) {
        return respJPA.findResponsable(idResponsable);
    }

    public List<Paciente> getPacientes() {
        return pacJPA.findPacienteEntities();
    }

    public void borrarPaciente(int id) {
       try {
           pacJPA.destroy(id);
       } catch (NonexistentEntityException ex) {
           Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public void borrarResponsable(int id) {
       try {
           respJPA.destroy(id);
       } catch (NonexistentEntityException ex) {
           Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public void editarPaciente(Paciente paciente) {
       try {
           pacJPA.edit(paciente);
       } catch (Exception ex) {
           Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public Paciente traerPaciente(int id) {
        return pacJPA.findPaciente(id);
    }

    
}
