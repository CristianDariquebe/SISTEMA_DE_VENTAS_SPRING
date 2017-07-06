package pe.egcc.compuventas.service.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import pe.egcc.compuventas.model.Producto;
import pe.egcc.compuventas.service.espec.RowMapper;


public class ProductoMapper implements RowMapper<Producto>{

  @Override
  public Producto mapRow(ResultSet rs) throws SQLException {
    Producto bean = new Producto();
    bean.setIdprod(rs.getInt("idprod"));
    bean.setIdcat(rs.getInt("idcat"));
    bean.setNombre(rs.getString("nombre"));
    bean.setDescripcion(rs.getString("descripcion"));
    bean.setPrecio(rs.getDouble("precio"));
    bean.setStock(rs.getInt("stock"));
    return bean;
  }
  
}
