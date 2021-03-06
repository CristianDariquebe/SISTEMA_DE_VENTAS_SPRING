package pe.egcc.compuventas.service.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import pe.egcc.compuventas.model.Promocion;
import pe.egcc.compuventas.service.espec.RowMapper;


public class PromocionMapper implements RowMapper<Promocion>{

  @Override
  public Promocion mapRow(ResultSet rs) throws SQLException {
    Promocion bean = new Promocion();
    bean.setIdprom(rs.getInt("idprom"));
    bean.setFecinicio(rs.getDate("fecinicio"));
    bean.setFecfin(rs.getDate("fecfin"));
    bean.setIdprod(rs.getInt("idprod"));
    bean.setPrecio(rs.getDouble("precio"));
    bean.setOferta(rs.getDouble("oferta"));
    bean.setEstado(rs.getInt("estado"));
    return bean;
  }
  
}
