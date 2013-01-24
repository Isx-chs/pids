package action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import service.GestionUsuarioBusinessDelegate;
import service.UsuarioService;
import util.Constantes;
import model.Modulos;
import model.Usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IdentificadorAction extends ActionSupport{
	
	private Usuario usuario=new Usuario();
	private String mensaje;
	private UsuarioService usuarioService = GestionUsuarioBusinessDelegate.getUsuarioService();
	private Modulos modulos = new Modulos();
	
	public Modulos getModulos() {
		return modulos;
	}
	public void setModulos(Modulos modulos) {
		this.modulos = modulos;
	}
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	public String getMensaje() {
		return mensaje;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	
	public String execute() throws Exception{

		String vista="";
		try{	
			//########## CONFITRMO QUE EXISTA EL USUARIO
			Usuario resultado=usuarioService.validarUsuario(usuario);
			
			
			if(resultado != null){
				//SI EXISTE CREO LA SESSION
				Map session= ActionContext.getContext().getSession();
				
				//GUARDO LA SESSION
				session.put("usuario", resultado);
				
				Usuario user = (Usuario)session.get("usuario");
				
				//BUSCO A QUE MODULOS PUEDE ACCEDER
				List<Modulos> mod = usuarioService.obtenerModulos(user.getUs_per_id());
				
				if(mod != null){
					session.put("modulo", mod);
					
					vista = SUCCESS;
					
				}else{
					addActionError("No tiene accesos a los modulos");
					vista= LOGIN;					
				}
				
				
			}else {
				 addActionError(getText(Constantes.MENSAJE_LOGIN_INCORRECTO));
				 vista= LOGIN;
			}
		}catch (Exception e) {
			vista=ERROR;
			addActionError(Constantes.MENSAJE_ERROR);
		}	
			return vista;
		}
	private Map getSession(String string) {
		// TODO Auto-generated method stub
		return null;
	}

}
