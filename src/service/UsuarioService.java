package service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

import model.Area;
import model.Modulos;
import model.Requerimiento;
import model.Usuario;

public interface UsuarioService {

	public Usuario validarUsuario (Usuario usuario) throws Exception;
	
	public List<Modulos> obtenerModulos(int per_id)  throws Exception;
	
	public Usuario buscarUsuario(int us_id) throws Exception;
	
	public List<Usuario> buscarxperfil(int us_per_id) throws Exception;
	
	public Area buscarArea(int area_id) throws Exception;
	
	
}
