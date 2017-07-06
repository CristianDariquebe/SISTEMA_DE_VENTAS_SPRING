package pe.egcc.compuventas.service.espec;

import java.util.List;
import pe.egcc.compuventas.model.Promocion;

public interface PromocionServiceEspec 
extends CrudServiceEspec<Promocion>{
  
  List<Promocion> getPromociones();
  
}
