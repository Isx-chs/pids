package action;

import java.util.List;
import java.util.Map;

import model.Area;
import model.DetalleRequerimiento;
import model.Requerimiento;
import model.Usuario;
import service.DetalleRequerimientoService;
import service.GestionDetalleRequerimientoBusinessDelegate;
import service.GestionRequerimientoBusinessDelegate;
import service.GestionUsuarioBusinessDelegate;
import service.RequerimientoService;
import service.UsuarioService;
import util.Constantes;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DesarrolloAction extends ActionSupport{
	
	private int id_requerimiento;
	private String mensaje;
	private List<Requerimiento> requerimientos;
	private List<Usuario> desarrolladores;
	private Usuario responsable=new Usuario();
	private Area area = new Area();
	private RequerimientoService requerimientoService = GestionRequerimientoBusinessDelegate.getRequerimientoService();
	private UsuarioService usuarioService = GestionUsuarioBusinessDelegate.getUsuarioService();
	private Requerimiento requerimiento;
	private DetalleRequerimiento detalleRequerimiento;
	private List<DetalleRequerimiento> detalleRequermientos;
	private DetalleRequerimientoService detalleService = GestionDetalleRequerimientoBusinessDelegate.getDetalleRequerimientoService();
	
	
	
	public DetalleRequerimientoService getDetalleService() {
		return detalleService;
	}

	public void setDetalleService(DetalleRequerimientoService detalleService) {
		this.detalleService = detalleService;
	}

	public DetalleRequerimiento getDetalleRequerimiento() {
		return detalleRequerimiento;
	}

	public void setDetalleRequerimiento(DetalleRequerimiento detalleRequerimiento) {
		this.detalleRequerimiento = detalleRequerimiento;
	}

	public List<DetalleRequerimiento> getDetalleRequermientos() {
		return detalleRequermientos;
	}

	public void setDetalleRequermientos(
			List<DetalleRequerimiento> detalleRequermientos) {
		this.detalleRequermientos = detalleRequermientos;
	}

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

	public List<Requerimiento> getRequerimientos() {
		return requerimientos;
	}

	public void setRequerimientos(List<Requerimiento> requerimientos) {
		this.requerimientos = requerimientos;
	}

	public List<Usuario> getDesarrolladores() {
		return desarrolladores;
	}

	public void setDesarrolladores(List<Usuario> desarrolladores) {
		this.desarrolladores = desarrolladores;
	}

	public Usuario getResponsable() {
		return responsable;
	}

	public void setResponsable(Usuario responsable) {
		this.responsable = responsable;
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

	public String inicializar(){
		String vista="";
		
		try {
			requerimientos = requerimientoService.obtenerRequerimientos(Constantes.DESARROLLO_ETAPA);

			vista = SUCCESS;
		} catch (Exception e) {
			vista=ERROR;
			addActionError(Constantes.MENSAJE_ERROR);
			e.printStackTrace();
		}
		return vista;
	
	}
	
	public String inicializarDetalle(){
		
		String vista="";
		
		try {
			requerimiento = requerimientoService.obtenerRequerimiento(id_requerimiento);
			responsable = usuarioService.buscarUsuario(requerimiento.getReq_id_responsable());		
			desarrolladores = usuarioService.buscarxperfil(Constantes.DESARROLLADORES);
			detalleRequermientos = detalleService.detallexrequerimiento(id_requerimiento, 1);
		
			vista = SUCCESS;
		} catch (Exception e) {
			vista=ERROR;
			addActionError(Constantes.MENSAJE_ERROR);
			e.printStackTrace();
		}
		return vista;
	
	
	}
	
	
	public String guardarDetalle(){
		String vista="";
		int req_id = detalleRequerimiento.getDet_id_req();
		
		
		try {
			if((detalleRequerimiento.getDet_descripcion().trim()).equals("")){
				detalleRequerimiento.setDet_tipo(Constantes.DETALLE_DESARROLLO);
				
				detalleRequermientos = detalleService.detallexrequerimiento(req_id, 1);
				
				requerimiento = requerimientoService.obtenerRequerimiento(req_id);
				responsable = usuarioService.buscarUsuario(requerimiento.getReq_id_responsable());		
				desarrolladores = usuarioService.buscarxperfil(Constantes.DESARROLLADORES);
				
				addActionError("Ingrese un valor en el campo descripcion");
				vista=NONE;
			}else{
				detalleRequerimiento.setDet_tipo(Constantes.DETALLE_DESARROLLO);
				
				detalleService.guardarDetalle(detalleRequerimiento);
				
				detalleRequermientos = detalleService.detallexrequerimiento(req_id, 1);
				requerimiento = requerimientoService.obtenerRequerimiento(req_id);
				responsable = usuarioService.buscarUsuario(requerimiento.getReq_id_responsable());		
				desarrolladores = usuarioService.buscarxperfil(Constantes.DESARROLLADORES);
				
				vista=SUCCESS;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			vista=ERROR;
		}
		
		return vista;		
	}
	
	
	public String inicializarRegistro(){
		String vista="";
		Map session= ActionContext.getContext().getSession();
		Usuario user = (Usuario)session.get("usuario");
		detalleRequermientos = detalleService.obtenerDetallexUsuario(Constantes.DETALLE_DESARROLLO, user.getUs_id());
		vista=SUCCESS;
		return vista;	
	}
	
	public String obtenerDetalleRegistro(){
		String vista="";
		
		detalleRequerimiento = detalleService.obtenerDetalle(id_requerimiento);
		
		Map session= ActionContext.getContext().getSession();
		Usuario user = (Usuario)session.get("usuario");
		detalleRequermientos = detalleService.obtenerDetallexUsuario(Constantes.DETALLE_DESARROLLO, user.getUs_id());
		vista=SUCCESS;
		
		return vista;
	}
	
	public String actualizarDetalle(){
		String vista = "";
		int det_id=0;
		det_id = id_requerimiento;
		int det_tipo=Constantes.DETALLE_DESARROLLO;
		if(det_id!=0){
			detalleService.actualizaDetalle(det_id, det_tipo);
		}		
		
		Map session= ActionContext.getContext().getSession();
		Usuario user = (Usuario)session.get("usuario");
		detalleRequermientos = detalleService.obtenerDetallexUsuario(Constantes.DETALLE_DESARROLLO, user.getUs_id());
		vista=SUCCESS;
		
		return vista;
		
	}
}
