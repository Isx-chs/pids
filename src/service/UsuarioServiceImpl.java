package service;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import daos.mybatis.SessionFactory;
import daos.mybatis.mapper.UsuarioMapper;
import model.Area;
import model.Modulos;
import model.Usuario;

public class UsuarioServiceImpl implements UsuarioService{

	@Override
	public Usuario validarUsuario(Usuario usuario) throws Exception {

		SqlSession sqlSession=SessionFactory.getSqlSessionFactory().openSession();
		
		Usuario u = new Usuario();
		
		UsuarioMapper usuarioMapper = sqlSession.getMapper(UsuarioMapper.class);
		
		u = usuarioMapper.getUsuario(usuario);
		
		sqlSession.close();
		
		return u;
		
	}

	@Override
	public List<Modulos> obtenerModulos(int per_id) throws Exception {
		
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
		
		List<Modulos> mod = null;
		
		UsuarioMapper usuarioMapper = sqlSession.getMapper(UsuarioMapper.class);
		
		mod = usuarioMapper.getModulos(per_id);
		
		sqlSession.close();
		
		return mod;
	}

	@Override
	public Usuario buscarUsuario(int us_id) throws Exception {
		SqlSession sqlSession=SessionFactory.getSqlSessionFactory().openSession();
		
		Usuario u = new Usuario();
		
		UsuarioMapper usuarioMapper = sqlSession.getMapper(UsuarioMapper.class);
		
		u = usuarioMapper.buscarUsuario(us_id);
		
		sqlSession.close();
		
		return u;
	}

	@Override
	public Area buscarArea(int area_id) throws Exception {
		SqlSession sqlSession=SessionFactory.getSqlSessionFactory().openSession();
		
		Area area = new Area();
		
		UsuarioMapper usuarioMapper = sqlSession.getMapper(UsuarioMapper.class);
		
		area = usuarioMapper.buscarArea(area_id);
		
		sqlSession.close();
		
		return area;
	}

	@Override
	public List<Usuario> buscarxperfil(int us_per_id) throws Exception {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
		
		List<Usuario> mod = null;
		
		UsuarioMapper usuarioMapper = sqlSession.getMapper(UsuarioMapper.class);
		
		mod = usuarioMapper.getUsuarioxPerfil(us_per_id);
		
		sqlSession.close();
		
		return mod;
	}

}
