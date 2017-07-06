package pe.egcc.compuventas.service.espec;

import java.util.List;
import pe.egcc.compuventas.model.Venta;

/**
 *
 * @author firefox_usr
 */
public interface VentaServiceEspec {
  
  void grabar(Venta venta);
  
    List<Venta> getVentas();

}
