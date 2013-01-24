package action;

import java.util.List;

import service.GestionRequerimientoBusinessDelegate;
import service.GestionUsuarioBusinessDelegate;
import service.RequerimientoService;
import service.UsuarioService;
import util.Constantes;

import model.Area;
import model.Requerimiento;
import model.Usuario;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ProyectoAction extends ActionSupport{
	
	private int id_requerimiento;
	private String mensaje;
	private List<Requerimiento> requerimientos;
	private List<Usuario> responsables;
	private Usuario solicitante=new Usuario();
	private Area area = new Area();
	private RequerimientoService requerimientoService = GestionRequerimientoBusinessDelegate.getRequerimientoService();
	private UsuarioService usuarioService = GestionUsuarioBusinessDelegate.getUsuarioService();
	private Requerimiento requerimiento;
	
	
	
	public List<Usuario> getResponsables() {
		return responsables;
	}

	public void setResponsables(List<Usuario> responsables) {
		this.responsables = responsables;
	}

	public int getId_requerimiento() {
		return id_requerimiento;
	}

	public void setId_requerimiento(int id_requerimiento) {
		this.id_requerimiento = id_requerimiento;
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

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public List<Requerimiento> getRequerimientos() {
		return requerimientos;
	}

	public void setRequerimientos(List<Requerimiento> requerimientos) {
		this.requerimientos = requerimientos;
	}

	public Usuario getSolicitante() {
		return solicitante;
	}

	public void setSolicitante(Usuario solicitante) {
		this.solicitante = solicitante;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public RequerimientoService getRequerimientoService() {
		return requerimientoService;
	}

	public void setRequerimientoService(RequerimientoService requerimientoService) {
		this.requerimientoService = requerimientoService;
	}

	
	public String inicializar() {
		String vista="";
		
		try {
			requerimientos = requerimientoService.obtenerRequerimientos(Constantes.PROYECTO_ETAPA);

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
			responsables = usuarioService.buscarxperfil(Constantes.RESPONSABLE_DESARROLLO);
			vista = SUCCESS;
		} catch (Exception e) {
			vista=ERROR;
			addActionError(Constantes.MENSAJE_ERROR);
			e.printStackTrace();
		}
		return vista;
	
	}
	
	public String obtenerXEstado(){
		String vista="";
		
		try {
			requerimientoService.ActualizarProyecto(requerimiento);
			requerimientos = requerimientoService.obtenerRequerimientos(Constantes.PROYECTO_ETAPA);

			vista=SUCCESS;
		} catch (Exception e) {
			vista=ERROR;
			addActionError(Constantes.MENSAJE_ERROR);
			e.printStackTrace();
		}
		
		
		return vista;
	}
	
	public String registrarProyecto(){
		String vista="";
		int req_id = requerimiento.getReq_id();
		try {
			if((requerimiento.getReq_recursos().trim()).equals("")){
				requerimiento = requerimientoService.obtenerRequerimiento(req_id);
				solicitante = usuarioService.buscarUsuario(requerimiento.getReq_id_solicitante());
				area = usuarioService.buscarArea(requerimiento.getReq_id_area());			
				responsables = usuarioService.buscarxperfil(Constantes.RESPONSABLE_DESARROLLO);
				addActionError("Ingrese un valor en el campo recursos");
				vista=NONE;
			}else{
				requerimientoService.ActualizarProyecto(requerimiento);
				requerimientos = requerimientoService.obtenerRequerimientos(Constantes.PROYECTO_ETAPA);

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
