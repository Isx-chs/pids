package service;

import java.util.List;

import model.Modulos;
import model.Requerimiento;

public interface RequerimientoService {
	
	public List<Requerimiento> obtenerRequerimientos(int etapa_id)  throws Exception;
	
	public Requerimiento obtenerRequerimiento(int req_id) throws Exception;
	
	public void ActualizarSistema(Requerimiento requerimiento) throws Exception;
	
	public void ActualizarProyecto(Requerimiento requerimiento) throws Exception;
	
	public void sp_insertarsistema(Requerimiento requerimiento)throws Exception;
	
	public Requerimiento getobtenerxestado(String v_id) throws Exception;
}
