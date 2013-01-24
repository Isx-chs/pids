package service;

public class GestionDetalleRequerimientoBusinessDelegate {
	public static DetalleRequerimientoService getDetalleRequerimientoService(){
		return new DetalleRequerimientoServiceImpl();		
	}
}
