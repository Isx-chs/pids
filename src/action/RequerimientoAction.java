package action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import model.Area;
import model.Requerimiento;
import model.Usuario;
import service.GestionRequerimientoBusinessDelegate;
import service.GestionUsuarioBusinessDelegate;
import service.RequerimientoService;
import service.UsuarioService;
import util.Constantes;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RequerimientoAction extends ActionSupport{
	
	private int id_requerimiento;
	private String mensaje;
	private RequerimientoService requerimientoService = GestionRequerimientoBusinessDelegate.getRequerimientoService();
	private UsuarioService usuarioService = GestionUsuarioBusinessDelegate.getUsuarioService();	
	private Requerimiento requerimiento = new Requerimiento();	
	private List<Requerimiento> requerimientos;
	private Usuario solicitante=new Usuario();
	private Area area = new Area();
	
	private String data = "Sistema Contable, Sistema R.R.H.H., Sistema Comercial";
	private List<String> sistemas = new ArrayList<String>();
	private String sistema;
	private List<String> modulos = new ArrayList<String>();
	
	
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
	
	public String getSistema() {
		return sistema;
	}

	public void setSistema(String sistema) {
		this.sistema = sistema;
	}

	public List<String> getSistemas() {
		return sistemas;
	}

	public void setSistemas(List<String> sistemas) {
		this.sistemas = sistemas;
	}

	public List<String> getModulos() {
		return modulos;
	}

	public void setModulos(List<String> modulos) {
		this.modulos = modulos;
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
	
public String cargarModulos(){
	System.out.println("Ejemplo04Action: execute : " + sistema);
	if("Sistema Contable".equalsIgnoreCase(sistema)){
		modulos.add("Activos");
		modulos.add("Deudas");
		modulos.add("Historial de Gastos");
		modulos.add("Pasivos");
		modulos.add("Patrimonio");
	}
	else if("Sistema R.R.H.H.".equalsIgnoreCase(sistema)){
		modulos.add("Personal");
		modulos.add("Salarios");
		modulos.add("Capacitaciones");
	}else if("Sistema Comercial".equalsIgnoreCase(sistema)){
		modulos.add("Ventas");
		modulos.add("Productos");
		modulos.add("Clientes");
		modulos.add("Proveedores");
	}
	return SUCCESS;
}
public String inicializarEnvio() {
	
	sistemas = new ArrayList<String>();
	StringTokenizer st = new StringTokenizer(data, ",");
	
	while (st.hasMoreTokens()) {
		sistemas.add( st.nextToken().trim() );
	}
		return SUCCESS;
	
	}

public String insertar(){
	String vista="";
	try{
		
		Map session= ActionContext.getContext().getSession();
		Usuario user = (Usuario)session.get("usuario");
		
		
		requerimiento.setReq_id_area(user.getUs_area_id());
		requerimiento.setReq_id_solicitante(user.getUs_id());
		
		requerimientoService.sp_insertarsistema(requerimiento);
		
		requerimientos = requerimientoService.obtenerRequerimientos(Constantes.SISTEMA_ETAPA);

		vista = SUCCESS;
	}catch(Exception e){
		vista=ERROR;
		e.printStackTrace();
		
	}
	
	return vista;
}


public String Obtenerxestado() {
	String vista="";
	
	try {
	requerimientoService.getobtenerxestado("2");
		vista = SUCCESS;
	} catch (Exception e) {
		vista=ERROR;
		addActionError(Constantes.MENSAJE_ERROR);
		e.printStackTrace();
	}
	return vista;

}

public String reporte(){
	String vista = "";
	try {
		requerimientos = requerimientoService.obtenerRequerimientos(Constantes.SISTEMA_ETAPA);
		vista = SUCCESS;
	} catch (Exception e) {
		vista=ERROR;
		e.printStackTrace();
	}
	
	return vista;
}

}
