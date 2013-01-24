package daos.mybatis.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.StatementType;

import model.Area;
import model.Modulos;
import model.Usuario;;

public interface UsuarioMapper {

//@Select("{ CALL sp_buscarVendedor(#{usuario.us_user, mode=IN, jdbcType=VARCHAR} )}")
@Select("{ CALL sp_login(#{usuario.us_user, mode=IN, jdbcType=VARCHAR},#{usuario.us_pass, mode=IN, jdbcType=VARCHAR} )}")
@Options(statementType= StatementType.CALLABLE)
@ResultMap("rmUsuarioModel")
	Usuario getUsuario(@Param("usuario") Usuario usuario);
	
@Select("{ CALL sp_privilegios(#{v_perfil, mode=IN, jdbcType=VARCHAR})}")
@Options(statementType= StatementType.CALLABLE)
@ResultMap("rmModuloModel")
	List<Modulos> getModulos(@Param("v_perfil") int v_perfil);

@Select("{ CALL sp_buscar_usuario(#{v_us_id, mode=IN, jdbcType=VARCHAR})}")
@Options(statementType= StatementType.CALLABLE)
@ResultMap("rmUsuarioModel")
	Usuario buscarUsuario(@Param("v_us_id") int v_us_id);

@Select("{ CALL sp_buscar_area(#{v_area_id, mode=IN, jdbcType=VARCHAR})}")
@Options(statementType= StatementType.CALLABLE)
@ResultMap("rmAreaModel")
	Area buscarArea(@Param("v_area_id") int v_area_id);

@Select("{ CALL sp_buscar_x_perfil(#{v_us_per_id, mode=IN, jdbcType=INTEGER})}")
@Options(statementType= StatementType.CALLABLE)
@ResultMap("rmUsuarioModel")
	List<Usuario> getUsuarioxPerfil(@Param("v_us_per_id") int v_us_per_id);


}


