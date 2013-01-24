package service;


public class GestionUsuarioBusinessDelegate {
	
	//obtiene implementacion del CU MANTENIMIENTO VENDEDOR
		public static UsuarioService getUsuarioService(){
			return new UsuarioServiceImpl();
		}
		

}
