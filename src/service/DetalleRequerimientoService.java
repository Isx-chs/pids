package service;

import java.util.List;

import model.DetalleRequerimiento;

public interface DetalleRequerimientoService {
	public void guardarDetalle(DetalleRequerimiento detalle);
	
	public List<DetalleRequerimiento> detallexrequerimiento(int det_id_req, int det_tipo);
	
	public DetalleRequerimiento obtenerDetalle(int det_id);
	
	public void actualizaDetalle(int det_id, int det_tipo);
	
	public List<DetalleRequerimiento> obtenerDetallexUsuario(int det_tipo,int det_encargado);
	
	
}
