package negocio;

import java.util.List;

import persistencia.mybatis.mapper.HistoriaClinicaMapper;
import model.BuscarHCFiltro;
import model.HistoriaClinica;

public class HistoriaClinicaServiceDAO extends MyBatisGenericDAO implements HistoriaClinicaService {

	@Override
	public void registrar(HistoriaClinica historia) throws Exception {
		// TODO Auto-generated method stub
		HistoriaClinicaMapper historiaClinicaMapper = getSession().getMapper(HistoriaClinicaMapper.class);
		historiaClinicaMapper.registrar(historia);
	}

	@Override
	public void actualizar(HistoriaClinica historia) throws Exception {
		// TODO Auto-generated method stub
		HistoriaClinicaMapper historiaClinicaMapper = getSession().getMapper(HistoriaClinicaMapper.class);
		historiaClinicaMapper.actualizar(historia);
	}


	@Override
	public List<HistoriaClinica> buscarHC(BuscarHCFiltro hcFiltro) {
		// TODO Auto-generated method stub
		
		BuscarHCFiltro hcfiltro1 = new BuscarHCFiltro();
		String valor1=null;
		String valor2=null;
		String valor3=null;
		String valor4=null;
		if (!hcFiltro.getApellidoMaternoPaciente().isEmpty()) {
			valor1=hcFiltro.getApellidoMaternoPaciente()+"%";
		}
		if (!hcFiltro.getApellidoPaternoPaciente().isEmpty()) {
			valor2=hcFiltro.getApellidoPaternoPaciente()+"%";
		}
		if (!hcFiltro.getNombrePaciente().isEmpty()) {
			valor3=hcFiltro.getNombrePaciente()+"%";
		}
		if (!hcFiltro.getDniPaciente().isEmpty()) {
			valor4=hcFiltro.getDniPaciente();
		}
		
		hcfiltro1.setApellidoMaternoPaciente(valor1);
		hcfiltro1.setApellidoPaternoPaciente(valor2);
		hcfiltro1.setNombrePaciente(valor3);
		hcfiltro1.setDniPaciente(valor4);
		
		HistoriaClinicaMapper mapper = getSession().getMapper(HistoriaClinicaMapper.class);
		List<HistoriaClinica> result =mapper.buscar(hcfiltro1);
		
		return result;
	}

	@Override
	public void desactivar(Integer id) {
		// TODO Auto-generated method stub
		HistoriaClinicaMapper mapper = getSession().getMapper(HistoriaClinicaMapper.class);
		mapper.desactivar(id);
	}

	@Override
	public HistoriaClinica obtener(Integer id) {
		// TODO Auto-generated method stub
		
		HistoriaClinicaMapper mapper = getSession().getMapper(HistoriaClinicaMapper.class);
		HistoriaClinica result=mapper.obtener(id);
		return result;
	}


}
