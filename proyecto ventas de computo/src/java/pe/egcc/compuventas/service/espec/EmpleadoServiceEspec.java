package pe.egcc.compuventas.service.espec;

import pe.egcc.compuventas.model.Empleado;


public interface EmpleadoServiceEspec 
  extends CrudServiceEspec<Empleado>{
  
  Empleado validar(String usuario, String clave);
  
  int getEstado(int idemp, int idrol);
  
  void cambiarPass(String claveact, String clavenew);
  
}
