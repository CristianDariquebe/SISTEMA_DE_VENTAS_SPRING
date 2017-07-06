package pe.egcc.compuventas.service.espec;

import pe.egcc.compuventas.model.Producto;


public interface ProductoServiceEspec 
  extends CrudServiceEspec<Producto>{

 public void eliminarnum(Producto bean) ;   
  
}
