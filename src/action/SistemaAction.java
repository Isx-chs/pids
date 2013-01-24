package action;

import java.util.List;

import model.Area;
import model.Modulos;
import model.Requerimiento;
import model.Usuario;
import service.GestionRequerimientoBusinessDelegate;
import service.GestionUsuarioBusinessDelegate;
import service.RequerimientoService;
import service.UsuarioService;
import util.Constantes;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SistemaAction extends ActionSupport{
	
	private int id_requerimiento;
	private String mensaje;
	private RequerimientoService requerimientoService = GestionRequerimientoBusinessDelegate.getRequerimientoService();
	private UsuarioService usuarioService = GestionUsuarioBusinessDelegate.getUsuarioService();
	private Requerimiento requerimiento;
	private List<Requerimiento> requerimientos;
	private Usuario solicitante=new Usuario();
	private Area area = new Area();
	
	
	
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public int getId_requerimiento() {
		return id_requerimiento;
	}

	public void setId_requerimiento(int id_requerimiento) {
		this.id_requerimiento = id_requerimiento;
	}

	public List<Requerimiento> getRequerimientos() {
		return requerimientos;
	}

	public void setRequerimientos(List<Requerimiento> requerimientos) {
		this.requerimientos = requerimientos;
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

	public Requerimiento getRequerimiento() {
		return requerimiento;
	}

	public void setRequerimiento(Requerimiento requerimiento) {
		this.requerimiento = requerimiento;
	}
	
	

	public Usuario getSolicitante() {
		return solicitante;
	}

	public void setSolicitante(Usuario solicitante) {
		this.solicitante = solicitante;
	}

	public UsuarioService getUsuarioService() {
		return usuarioService;
	}

	public void setUsuarioService(UsuarioService usuarioService) {
		this.usuarioService = usuarioService;
	}

	public String inicializar() {
		String vista="";
		
		try {
			requerimientos = requerimientoService.obtenerRequerimientos(Constantes.SISTEMA_ETAPA);

			vista = SUCCESS;
		} catch (Exception e) {
			vista=ERROR;
			addActionError(Constantes.MENSAJE_ERROR);
			e.printStackTrace();
		}
		return vista;
	
	}
	
	public String inicializarDetalle() {
		String vista="";
		
		try {
			requerimiento = requerimientoService.obtenerRequerimiento(id_requerimiento);
			solicitante = usuarioService.buscarUsuario(requerimiento.getReq_id_solicitante());
			area = usuarioService.buscarArea(requerimiento.getReq_id_area());
			
			
			vista = SUCCESS;
		} catch (Exception e) {
			vista=ERROR;
			addActionError(Constantes.MENSAJE_ERROR);
			e.printStackTrace();
		}
		return vista;
	}
	
	public String evaluarDetalle(){
		String vista = "";
		int req_id = requerimiento.getReq_id();
		try {
			if((requerimiento.getReq_obsr().trim()).equals("")){
				requerimiento = requerimientoService.obtenerRequerimiento(req_id);
				solicitante = usuarioService.buscarUsuario(requerimiento.getReq_id_solicitante());
				area = usuarioService.buscarArea(requerimiento.getReq_id_area());
				addActionError("Ingrese un valor en el campo observacion");
				vista=NONE;
			}
			else{
				requerimientoService.ActualizarSistema(requerimiento);
				requerimientos = requerimientoService.obtenerRequerimientos(Constantes.SISTEMA_ETAPA);

				vista=SUCCESS;
			}
			
		} catch (Exception e) {
			vista=ERROR;
			addActionError(Constantes.MENSAJE_ERROR);
			e.printStackTrace();
		}
		
		return vista;
	}
}
