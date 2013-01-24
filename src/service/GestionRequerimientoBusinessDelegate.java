package service;

public class GestionRequerimientoBusinessDelegate {
	
	public static RequerimientoService getRequerimientoService(){
		return new RequerimientoServiceImpl();
		
	}
}
