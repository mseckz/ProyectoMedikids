package persistencia.mybatis.mapper;

import java.util.List;

import model.Turno;

public interface TurnoMapper {
	
	List<Turno> obtenerTurnos();
}
