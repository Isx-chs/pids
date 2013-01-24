package service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import daos.mybatis.SessionFactory;
import daos.mybatis.mapper.DetalleMapper;
import model.DetalleRequerimiento;


public class DetalleRequerimientoServiceImpl implements DetalleRequerimientoService {

	@Override
	public void guardarDetalle(DetalleRequerimiento detalle) {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();

		DetalleMapper detalleMapper = sqlSession.getMapper(DetalleMapper.class);
		
		detalleMapper.guardarDetalle(detalle);
		
		sqlSession.close();
		
	}

	@Override
	public List<DetalleRequerimiento> detallexrequerimiento(int det_id_req, int det_tipo) {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
		
		List<DetalleRequerimiento> mod = null;
		
		DetalleMapper detalleMapper = sqlSession.getMapper(DetalleMapper.class);
		
		mod = detalleMapper.obtenerDetallexRequerimiento(det_id_req, det_tipo);
		
		sqlSession.close();
		
		return mod;
	}

	@Override
	public DetalleRequerimiento obtenerDetalle(int det_id) {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
		
		DetalleRequerimiento detalle = null;
		
		DetalleMapper detalleMapper = sqlSession.getMapper(DetalleMapper.class);
		
		detalle = detalleMapper.obtenerDetalle(det_id);
		
		sqlSession.close();
		
		return detalle;
	}

	@Override
	public void actualizaDetalle(int det_id, int det_tipo) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
		
		DetalleMapper detalleMapper = sqlSession.getMapper(DetalleMapper.class);
		
		detalleMapper.actualizarDetalle(det_id, det_tipo);
		
		sqlSession.close();
		
	}

	@Override
	public List<DetalleRequerimiento> obtenerDetallexUsuario(int det_tipo,
			int det_encargado) {
		SqlSession sqlSession = SessionFactory.getSqlSessionFactory().openSession();
		
		List<DetalleRequerimiento> mod = null;
		
		DetalleMapper detalleMapper = sqlSession.getMapper(DetalleMapper.class);
		
		mod = detalleMapper.obtenerDetallexUsuario(det_tipo,det_encargado);
		
		sqlSession.close();
		
		return mod;
	}

}
