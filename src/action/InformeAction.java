package action;

import java.util.List;
import java.util.Map;

import model.Requerimiento;
import model.Usuario;
import service.GestionRequerimientoBusinessDelegate;
import service.GestionUsuarioBusinessDelegate;
import service.RequerimientoService;
import service.UsuarioService;
import util.Constantes;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class InformeAction extends ActionSupport {
	
	private int id_requerimiento;
	private String mensaje;
	private RequerimientoService requerimientoService = GestionRequerimientoBusinessDelegate.getRequerimientoService();
	private UsuarioService usuarioService = GestionUsuarioBusinessDelegate.getUsuarioService();
	
	private Requerimiento requerimiento = new Requerimiento();
	
	private List<Requerimiento> requerimientos;
	
	
	
	
	public int getId_requerimiento() {
		return id_requerimiento;
	}




	public void setId_requerimiento(int id_requerimiento) {
		this.id_requerimiento = id_requerimiento;
	}




	public String getMensaje() {
		return mensaje;
	}




	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}




	public RequerimientoService getRequerimientoService() {
		return requerimientoService;
	}




	public void setRequerimientoService(RequerimientoService requerimientoService) {
		this.requerimientoService = requerimientoService;
	}




	public UsuarioService getUsuarioService() {
		return usuarioService;
	}




	public void setUsuarioService(UsuarioService usuarioService) {
		this.usuarioService = usuarioService;
	}




	public Requerimiento getRequerimiento() {
		return requerimiento;
	}




	public void setRequerimiento(Requerimiento requerimiento) {
		this.requerimiento = requerimiento;
	}




	public List<Requerimiento> getRequerimientos() {
		return requerimientos;
	}




	public void setRequerimientos(List<Requerimiento> requerimientos) {
		this.requerimientos = requerimientos;
	}




	public String inicializar(){
		String vista="";
		
		try {
			requerimientos = requerimientoService.obtenerRequerimientos(Constantes.INFORME_ETAPA);

			vista = SUCCESS;
		} catch (Exception e) {
			vista=ERROR;
			addActionError(Constantes.MENSAJE_ERROR);
			e.printStackTrace();
		}
		return vista;
	}
	
	public String obtenerRegistro(){
		String vista="";
		
		try {
			requerimiento = requerimientoService.obtenerRequerimiento(id_requerimiento);
			requerimientos = requerimientoService.obtenerRequerimientos(Constantes.INFORME_ETAPA);

			vista = SUCCESS;
		} catch (Exception e) {
			vista=ERROR;
			addActionError(Constantes.MENSAJE_ERROR);
			e.printStackTrace();
		}
		return vista;
	}
}
