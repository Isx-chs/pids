package model;

import java.util.Date;

public class DetalleRequerimiento {
	private int det_id;
	private int det_id_req;
	private String det_actividad;
	private Date det_fec_ini;
	private Date det_fec_fin;
	private int det_encargado;
	private int det_estado;
	private String det_descripcion;
	private int det_tipo;
	
	public int getDet_id() {
		return det_id;
	}
	public void setDet_id(int det_id) {
		this.det_id = det_id;
	}
	public int getDet_id_req() {
		return det_id_req;
	}
	public void setDet_id_req(int det_id_req) {
		this.det_id_req = det_id_req;
	}
	public String getDet_actividad() {
		return det_actividad;
	}
	public void setDet_actividad(String det_actividad) {
		this.det_actividad = det_actividad;
	}
	public Date getDet_fec_ini() {
		return det_fec_ini;
	}
	public void setDet_fec_ini(Date det_fec_ini) {
		this.det_fec_ini = det_fec_ini;
	}
	public Date getDet_fec_fin() {
		return det_fec_fin;
	}
	public void setDet_fec_fin(Date det_fec_fin) {
		this.det_fec_fin = det_fec_fin;
	}
	public int getDet_encargado() {
		return det_encargado;
	}
	public void setDet_encargado(int det_encargado) {
		this.det_encargado = det_encargado;
	}
	public int getDet_estado() {
		return det_estado;
	}
	public void setDet_estado(int det_estado) {
		this.det_estado = det_estado;
	}
	public String getDet_descripcion() {
		return det_descripcion;
	}
	public void setDet_descripcion(String det_descripcion) {
		this.det_descripcion = det_descripcion;
	}
	public int getDet_tipo() {
		return det_tipo;
	}
	public void setDet_tipo(int det_tipo) {
		this.det_tipo = det_tipo;
	}
	
	
}
