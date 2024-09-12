package logica;

import java.util.Date;
import javax.persistence.Entity;

@Entity
public class Responsable extends Persona{
//    private int id_responsable;
    private String tipo_responsable;

    public Responsable() {
    }

    public Responsable(String tipo_responsable, int id_persona, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nac) {
        super(id_persona, dni, nombre, apellido, telefono, direccion, fecha_nac);
        this.tipo_responsable = tipo_responsable;
    }

    public String getTipo_responsable() {
        return tipo_responsable;
    }

    public void setTipo_responsable(String tipo_responsable) {
        this.tipo_responsable = tipo_responsable;
    }
    
    
    
}
