package util;

public class Constantes {
	
	public static final String MENSAJE_ERROR
			="En estos momentos no lo podemos atender";
	
	public static final String MENSAJE_LOGIN_INCORRECTO
	="login.error";
	
	
	//grupo de datos que no cambian su valor con frecuencia 
	//obs: puede venir desde alguna fuente de datos, por ejemplo una tabla de base de datos
	public static final String GENERO_MASCULINO_COD="M";
	public static final String GENERO_FEMENINO_COD="F";
	public static final String GENERO_MASCULINO_DES="MASCULINO";
	public static final String GENERO_FEMENINO_DES="FEMENINO";
	
	public static final String EC_CASADO_COD="C1";
	public static final String EC_SOLTERO_COD="S1";
	public static final String EC_DIVORCIADO_COD="D1";
	public static final String EC_CASADO_DES="CASADO";
	public static final String EC_SOLTERO_DES="SOLTERO";
	public static final String EC_DIVORCIADO_DES="DIVORCIADO";
	
	public static final int SISTEMA_ETAPA=2;
	public static final int DESARROLLO_ETAPA=4;
	public static final int PROYECTO_ETAPA=3;
	public static final int REQUERIMIENTO_ETAPA=1;
	public static final int CALIDAD_ETAPA=5;
	public static final int INFORME_ETAPA = 6;
	
	public static final int RESPONSABLE_DESARROLLO=6;
	
	public static final int DESARROLLADORES=1;
	public static final int ANALISTAS=2;
	
	public static final int DETALLE_DESARROLLO=1;
	public static final int DETALLE_CALIDAD=2;
}
