package negocio;

import java.util.List;

import persistencia.mybatis.mapper.HistoriaClinicaMapper;
import model.BuscarHCFiltro;
import model.HistoriaClinica;
import model.TipoSangre;

public class HistoriaClinicaServiceDAO extends MyBatisGenericDAO implements HistoriaClinicaService {

	@Override
	public void registrar(HistoriaClinica historia1) throws Exception {
		// TODO Auto-generated method stub
		
		HistoriaClinica nueva_historia=new HistoriaClinica();
		//paciente
		String p_codigo=null;
		String p_nombrePaciente=null;
		String p_apellidoPaternoPaciente=null;
		String p_apellidoMaternoPaciente=null;
		String p_dniPaciente=null;
		Integer p_edadPaciente=null;
		boolean p_sexoPaciente;
		String p_direccionPaciente=null;
		String p_fechaNacPaciente=null;
		TipoSangre p_tipoSangre=null;
		String p_observa=null;		
		String p_alergias=null;
		String p_Antecedentes=null;
		
		//padre
		String pa_nom=null;
		String pa_apepat=null;
		String pa_apemat=null;
		String pa_dni=null;
		String pa_tele=null;
		String pa_dire=null;
		String pa_corr=null;
		
		//madre
		String ma_nom=null;
		String ma_apepat=null;
		String ma_apemat=null;
		String ma_dni=null;
		String ma_tele=null;
		String ma_dire=null;
		String ma_corr=null;
		
		//apoderado
		String a_nom=null;
		String a_apepat=null;
		String a_apemat=null;
		String a_dni=null;
		String a_tele=null;
		String a_dire=null;
		String a_corr=null;
		
		if (!historia1.getObservaciones().isEmpty()) {
			p_observa=historia1.getObservaciones();
		}
		if (!historia1.getAlergias().isEmpty()) {
			p_alergias=historia1.getAlergias();
		}
		if (!historia1.getAntecedentes().isEmpty()) {
			p_Antecedentes=historia1.getAntecedentes();
		}
		
		// Padre
		if (!historia1.getNombrePadre().isEmpty()) {
			pa_nom=historia1.getNombrePadre();
		}
		if (!historia1.getApellidoPaternoPadre().isEmpty()) {
			pa_apepat=historia1.getApellidoPaternoPadre();
		}
		if (!historia1.getApellidoMaternoPadre().isEmpty()) {
			pa_apemat=historia1.getApellidoMaternoPadre();
		}
		if (!historia1.getDniPadre().isEmpty()) {
			pa_dni=historia1.getDniPadre();
		}
		if (!historia1.getTelefonoPadre().isEmpty()) {
			pa_tele=historia1.getTelefonoPadre();
		}
		if (!historia1.getDireccionPadre().isEmpty()) {
			pa_dire=historia1.getDireccionPadre();
		}
		if (!historia1.getCorreoPadre().isEmpty()) {
			pa_corr=historia1.getCorreoPadre();
		}
		
		//Madre
		if (!historia1.getNombreMadre().isEmpty()) {
			ma_nom=historia1.getNombreMadre();
		}
		if (!historia1.getApellidoPaternoMadre().isEmpty()) {
			ma_apepat=historia1.getApellidoPaternoMadre();
		}
		if (!historia1.getApellidoMaternoMadre().isEmpty()) {
			ma_apemat=historia1.getApellidoMaternoMadre();
		}
		if (!historia1.getDniMadre().isEmpty()) {
			ma_dni=historia1.getDniMadre();
		}
		if (!historia1.getTelefonoMadre().isEmpty()) {
			ma_tele=historia1.getTelefonoMadre();
		}
		if (!historia1.getDireccionMadre().isEmpty()) {
			ma_dire=historia1.getDireccionMadre();
		}
		if (!historia1.getCorreoMadre().isEmpty()) {
			ma_corr=historia1.getCorreoMadre();
		}
		//Apoderado
		if (!historia1.getNombreApoderado().isEmpty()) {
			a_nom=historia1.getNombreApoderado();
		}
		if (!historia1.getApellidoPaternoApoderado().isEmpty()) {
			a_apepat=historia1.getApellidoPaternoApoderado();
		}
		if (!historia1.getApellidoMaternoApoderado().isEmpty()) {
			a_apemat=historia1.getApellidoMaternoApoderado();
		}
		if (!historia1.getDniApoderado().isEmpty()) {
			a_dni=historia1.getDniApoderado();
		}
		if (!historia1.getTelefonoApoderado().isEmpty()) {
			a_tele=historia1.getTelefonoApoderado();
		}
		if (!historia1.getDireccionApoderado().isEmpty()) {
			a_dire=historia1.getDireccionApoderado();
		}
		if (!historia1.getCorreoApoderado().isEmpty()) {
			a_corr=historia1.getCorreoApoderado();
		}
		
		// set de cada valor
		//paciente
		nueva_historia.setCodigo(historia1.getCodigo());
		nueva_historia.setNombrePaciente(historia1.getNombrePaciente());
		nueva_historia.setApellidoPaternoPaciente(historia1.getApellidoPaternoPaciente());
		nueva_historia.setApellidoMaternoPaciente(historia1.getApellidoMaternoPaciente());
		nueva_historia.setDniPaciente(historia1.getDniPaciente());
		nueva_historia.setEdadPaciente(historia1.getEdadPaciente());
		nueva_historia.setSexoPaciente(historia1.isSexoPaciente());
		nueva_historia.setDireccionPaciente(historia1.getDireccionPaciente());
		nueva_historia.setFechaNacPaciente(historia1.getFechaNacPaciente());
		nueva_historia.setObservaciones(p_observa);
		nueva_historia.setTipoSangre(historia1.getTipoSangre());
		nueva_historia.setAlergias(p_alergias);
		nueva_historia.setAntecedentes(p_Antecedentes);
		//padre
		nueva_historia.setNombrePadre(pa_nom);
		nueva_historia.setApellidoPaternoPadre(pa_apepat);
		nueva_historia.setApellidoMaternoPadre(pa_apemat);
		nueva_historia.setDniPadre(pa_dni);
		nueva_historia.setTelefonoPadre(pa_tele);
		nueva_historia.setDireccionPadre(pa_dire);
		nueva_historia.setCorreoPadre(pa_corr);
		//madre
		nueva_historia.setNombreMadre(ma_nom);
		nueva_historia.setApellidoPaternoMadre(ma_apepat);
		nueva_historia.setApellidoMaternoMadre(ma_apemat);
		nueva_historia.setDniMadre(ma_dni);
		nueva_historia.setTelefonoMadre(ma_tele);
		nueva_historia.setDireccionMadre(ma_dire);
		nueva_historia.setCorreoMadre(ma_corr);
		//apoderado
		nueva_historia.setNombreApoderado(a_nom);
		nueva_historia.setApellidoPaternoApoderado(a_apepat);
		nueva_historia.setApellidoMaternoApoderado(a_apemat);
		nueva_historia.setDniApoderado(a_dni);
		nueva_historia.setTelefonoApoderado(a_tele);
		nueva_historia.setDireccionApoderado(a_dire);
		nueva_historia.setCorreoApoderado(a_corr);
		
		HistoriaClinicaMapper historiaClinicaMapper = getSession().getMapper(HistoriaClinicaMapper.class);
		historiaClinicaMapper.registrar(nueva_historia);
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
