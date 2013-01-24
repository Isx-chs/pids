package daos.mybatis.mapper;

import java.util.List;

import model.DetalleRequerimiento;
import model.Modulos;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

public interface DetalleMapper {
	@Select("{ CALL sp_guardarDetalle(#{detalle.det_id_req, mode=IN, jdbcType=VARCHAR}," +
							"#{detalle.det_actividad, mode=IN, jdbcType=VARCHAR}," +
							"#{detalle.det_fec_ini, mode=IN, jdbcType=VARCHAR}," +
							"#{detalle.det_fec_fin, mode=IN, jdbcType=VARCHAR}," +
							"#{detalle.det_encargado, mode=IN, jdbcType=VARCHAR}," +
							"#{detalle.det_descripcion, mode=IN, jdbcType=VARCHAR}," +
							"#{detalle.det_tipo, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType= StatementType.CALLABLE)
		void guardarDetalle(@Param("detalle") DetalleRequerimiento detalle);
	
	@Select("{ CALL sp_listarDetalle(#{det_id_req, mode=IN, jdbcType=VARCHAR}," +
									   "#{v_det_tipo, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType= StatementType.CALLABLE)
	@ResultMap("rmDetalleModel")
		List<DetalleRequerimiento> obtenerDetallexRequerimiento(@Param("det_id_req") int det_id_req, @Param("v_det_tipo") int det_tipo);
	
	@Select("{CALL obtenerDetallexUsuario(#{v_det_tipo, mode=IN, jdbcType=VARCHAR}," +
										 "#{v_det_encargado, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType= StatementType.CALLABLE)
	@ResultMap("rmDetalleModel")
		List<DetalleRequerimiento> obtenerDetallexUsuario(@Param("v_det_tipo") int det_tipo,@Param("v_det_encargado") int det_encargado);

	@Select("{CALL sp_obtenerDetalle(#{v_det_id, mode=IN, jdbcType=VARCHAR})}")	
	@Options(statementType= StatementType.CALLABLE)
	@ResultMap("rmDetalleModel")
		DetalleRequerimiento obtenerDetalle(@Param("v_det_id") int det_id);
	
	
	@Select("{CALL sp_actualizarDetalle(#{v_det_id, mode=IN, jdbcType=VARCHAR}," +
									   "#{v_det_tipo, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType= StatementType.CALLABLE)
	@ResultMap("rmDetalleModel")
		void actualizarDetalle(@Param("v_det_id") int det_id, @Param("v_det_tipo") int det_tipo);
		
}
