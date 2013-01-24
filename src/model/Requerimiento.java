package model;

import java.util.Date;

public class Requerimiento {
	private int req_id;
	private String req_titulo;
	private Date req_fecha;
	private String req_obsr;
	private int req_id_area;
	private int req_id_solicitante;
	private int req_id_estado;
	private int req_importancia;
	private int req_prioridad;
	private int req_id_responsable;
	private String req_recursos;
	private int req_estado_final;
	private int req_etapa_id;
	private String req_sistema;
	private String req_modulo;
	
	public String getReq_sistema() {
		return req_sistema;
	}
	public void setReq_sistema(String req_sistema) {
		this.req_sistema = req_sistema;
	}
	public String getReq_modulo() {
		return req_modulo;
	}
	public void setReq_modulo(String req_modulo) {
		this.req_modulo = req_modulo;
	}
	public int getReq_id() {
		return req_id;
	}
	public void setReq_id(int req_id) {
		this.req_id = req_id;
	}
	public String getReq_titulo() {
		return req_titulo;
	}
	public void setReq_titulo(String req_titulo) {
		this.req_titulo = req_titulo;
	}
	public Date getReq_fecha() {
		return req_fecha;
	}
	public void setReq_fecha(Date req_fecha) {
		this.req_fecha = req_fecha;
	}
	public String getReq_obsr() {
		return req_obsr;
	}
	public void setReq_obsr(String req_obsr) {
		this.req_obsr = req_obsr;
	}
	public int getReq_id_area() {
		return req_id_area;
	}
	public void setReq_id_area(int req_id_area) {
		this.req_id_area = req_id_area;
	}
	public int getReq_id_solicitante() {
		return req_id_solicitante;
	}
	public void setReq_id_solicitante(int req_id_solicitante) {
		this.req_id_solicitante = req_id_solicitante;
	}
	public int getReq_id_estado() {
		return req_id_estado;
	}
	public void setReq_id_estado(int req_id_estado) {
		this.req_id_estado = req_id_estado;
	}
	public int getReq_importancia() {
		return req_importancia;
	}
	public void setReq_importancia(int req_importancia) {
		this.req_importancia = req_importancia;
	}
	public int getReq_prioridad() {
		return req_prioridad;
	}
	public void setReq_prioridad(int req_prioridad) {
		this.req_prioridad = req_prioridad;
	}
	public int getReq_id_responsable() {
		return req_id_responsable;
	}
	public void setReq_id_responsable(int req_id_responsable) {
		this.req_id_responsable = req_id_responsable;
	}
	public String getReq_recursos() {
		return req_recursos;
	}
	public void setReq_recursos(String req_recursos) {
		this.req_recursos = req_recursos;
	}
	public int getReq_estado_final() {
		return req_estado_final;
	}
	public void setReq_estado_final(int req_estado_final) {
		this.req_estado_final = req_estado_final;
	}
	public int getReq_etapa_id() {
		return req_etapa_id;
	}
	public void setReq_etapa_id(int req_etapa_id) {
		this.req_etapa_id = req_etapa_id;
	}
	
	
}
