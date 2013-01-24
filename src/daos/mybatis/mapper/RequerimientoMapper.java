package daos.mybatis.mapper;

import java.util.List;

import model.Modulos;
import model.Requerimiento;

import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

public interface RequerimientoMapper {

	@Select("{ CALL sp_obtener_requerimientos(#{v_etapa, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType= StatementType.CALLABLE)
	@ResultMap("rmRequerimientoModel")
		List<Requerimiento> getRequerimientos(@Param("v_etapa") int v_etapa);
	
	@Select("{ CALL sp_obtener_requerimiento(#{v_id, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType= StatementType.CALLABLE)
	@ResultMap("rmRequerimientoModel")
		Requerimiento getRequerimiento(@Param("v_id") int v_id);

	@Select("{ CALL sp_actualizar_sistema(#{requerimiento.req_id_estado, mode=IN, jdbcType=INTEGER}," +
									    " #{requerimiento.req_id, mode=IN, jdbcType=INTEGER}," +
										" #{requerimiento.req_obsr, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType= StatementType.CALLABLE)
		void updateRequerimientoSistema(@Param("requerimiento") Requerimiento requerimiento);
	
	@Select("{ CALL sp_actualizar_proyecto(#{requerimiento.req_importancia, mode=IN, jdbcType=INTEGER}," +
									    " #{requerimiento.req_prioridad, mode=IN, jdbcType=INTEGER}," +
									    " #{requerimiento.req_id, mode=IN, jdbcType=INTEGER}," +
									    " #{requerimiento.req_id_responsable, mode=IN, jdbcType=INTEGER}," +
										" #{requerimiento.req_recursos, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType= StatementType.CALLABLE)
		void updateRequerimientoProyecto(@Param("requerimiento") Requerimiento requerimiento);
	
	
	
	@Select("{ CALL sp_insertarsistema(#{requerimiento.req_titulo, mode=IN, jdbcType=VARCHAR}," +
		    "#{requerimiento.req_id_area, mode=IN, jdbcType=VARCHAR},#{requerimiento.req_sistema, mode=IN, jdbcType=VARCHAR},"+
			"#{requerimiento.req_modulo, mode=IN, jdbcType=VARCHAR},#{requerimiento.req_id_solicitante, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType= StatementType.CALLABLE)
	void sp_insertarsistema(@Param("requerimiento")Requerimiento requerimiento);

	
	
	@Select("{ CALL sp_obetenerrequerimientosegunestado(#{v_id, mode=IN, jdbcType=VARCHAR})}")
	@Options(statementType= StatementType.CALLABLE)
	@ResultMap("rmRequerimientoModel")
		Requerimiento getobtenerxestado(@Param("v_id") String v_id);
	
	
		

}
