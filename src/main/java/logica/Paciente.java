package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Paciente extends Persona implements Serializable{
    //private int id_paciente;
    private boolean seguro_so;
    private String tipoSangre;
    @OneToOne
    private Responsable unResponsable;
    @OneToMany(mappedBy = "pacien")
    private List<Turno> listaTurnos;

    public Paciente() {
    }
 
    public Paciente(boolean seguro_so, String tipoSangre, Responsable unResponsable, List<Turno> listaTurnos, int id_persona, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac) {
        super(id_persona, dni, nombre, apellido, telefono, direccion, fecha_nac);
        this.seguro_so = seguro_so;
        this.tipoSangre = tipoSangre;
        this.unResponsable = unResponsable;
        this.listaTurnos = listaTurnos;
    }

    public boolean isSeguro_so() {
        return seguro_so;
    }

    public void setSeguro_so(boolean seguro_so) {
        this.seguro_so = seguro_so;
    }

    public String getTipoSangre() {
        return tipoSangre;
    }

    public void setTipoSangre(String tipoSangre) {
        this.tipoSangre = tipoSangre;
    }

    public Responsable getUnResponsable() {
        return unResponsable;
    }

    public void setUnResponsable(Responsable unResponsable) {
        this.unResponsable = unResponsable;
    }

    public List<Turno> getListaTurnos() {
        return listaTurnos;
    }

    public void setListaTurnos(List<Turno> listaTurnos) {
        this.listaTurnos = listaTurnos;
    }  
}
