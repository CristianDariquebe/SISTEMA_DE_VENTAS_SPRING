/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.egcc.compuventas.service.espec;

import java.util.List;
import pe.egcc.compuventas.model.Campaña;

/**
 *
 * @author Carlos
 */
public interface CampañaServiceEspec
extends CrudServiceEspec<Campaña>{
    
      List<Campaña> getCampañas();
    
}
