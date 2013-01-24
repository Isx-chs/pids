package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import daos.mybatis.SessionFactory;
import daos.mybatis.mapper.RequerimientoMapper;
import daos.mybatis.mapper.UsuarioMapper;

import model.Modulos;
import model.Requerimiento;

public class RequerimientoServiceImpl implements RequerimientoService {

	@Override
	public List<Requerimiento> obtenerRequerimientos(int etapa_id)
			throws Exception {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
		
		List<Requerimiento> mod = null;
		
		RequerimientoMapper usuarioMapper = sqlSession.getMapper(RequerimientoMapper.class);
		
		mod = usuarioMapper.getRequerimientos(etapa_id);
		
		sqlSession.close();
		
		return mod;
	}

	@Override
	public Requerimiento obtenerRequerimiento(int req_id) throws Exception {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
		
		Requerimiento req = new Requerimiento();
		
		RequerimientoMapper usuarioMapper = sqlSession.getMapper(RequerimientoMapper.class);
		
		req = usuarioMapper.getRequerimiento(req_id);
		
		sqlSession.close();
		
		return req;
	}

	@Override
	public void ActualizarSistema(Requerimiento requerimiento) throws Exception {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();

		RequerimientoMapper usuarioMapper = sqlSession.getMapper(RequerimientoMapper.class);
		
		usuarioMapper.updateRequerimientoSistema(requerimiento);
		
		sqlSession.close();
		
	}

	@Override
	public void ActualizarProyecto(Requerimiento requerimiento)
			throws Exception {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();

		RequerimientoMapper usuarioMapper = sqlSession.getMapper(RequerimientoMapper.class);
		
		usuarioMapper.updateRequerimientoProyecto(requerimiento);
		
		sqlSession.close();
		
	}

	@Override
	public void sp_insertarsistema(Requerimiento requerimiento)
			throws Exception {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
	RequerimientoMapper usuarioMapper = sqlSession.getMapper(RequerimientoMapper.class);
		
		usuarioMapper.sp_insertarsistema(requerimiento);
		sqlSession.commit();
		sqlSession.close();
	}

	@Override
	public Requerimiento getobtenerxestado(String v_id) throws Exception {
			SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
		
		Requerimiento req = new Requerimiento();
		
		RequerimientoMapper usuarioMapper = sqlSession.getMapper(RequerimientoMapper.class);
		
		req = usuarioMapper.getobtenerxestado(v_id);
		
		sqlSession.close();
		
		return req;
	}

}
