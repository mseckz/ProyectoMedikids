package action;

import java.util.List;
/*import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;*/

import util.Constantes;
import negocio.HistoriaClinicaService;
import negocio.HistoriaClinicaServiceDAO;
import negocio.TipoSangreService;
import negocio.TipoSangreServiceDAO;
import model.BuscarHCFiltro;
import model.HistoriaClinica;
import model.TipoSangre;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class HistoriaClinicaAction extends ActionSupport implements Preparable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 953275798285290339L;

	private HistoriaClinica historiaclinica;

/*	private File[] fileUpload;
	private String[] fileUploadFileName;
	private String[] fileUploadContentType;*/

	private List<HistoriaClinica> historias;
	private List<TipoSangre> tipoSangres;

	private BuscarHCFiltro hcFiltro;

	private HistoriaClinicaService historiaClinService = new HistoriaClinicaServiceDAO();

	private String saveDirectory;

	public HistoriaClinica getHistoriaclinica() {
		return historiaclinica;
	}

	public void setHistoriaclinica(HistoriaClinica historiaclinica) {
		this.historiaclinica = historiaclinica;
	}

	public List<HistoriaClinica> getHistorias() {
		return historias;
	}

	public void setHistorias(List<HistoriaClinica> historias) {
		this.historias = historias;
	}

	public List<TipoSangre> getTipoSangres() {
		return tipoSangres;
	}

	public void setTipoSangres(List<TipoSangre> tipoSangres) {
		this.tipoSangres = tipoSangres;
	}

	public HistoriaClinicaService getHistoriaClinService() {
		return historiaClinService;
	}

	public void setHistoriaClinService(
			HistoriaClinicaService historiaClinService) {
		this.historiaClinService = historiaClinService;
	}

	/*public File[] getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File[] fileUploads) {
		this.fileUpload = fileUploads;
	}

	public String[] getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String[] fileUploadFileNames) {
		this.fileUploadFileName = fileUploadFileNames;
	}

	public String[] getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String[] fileUploadContentTypes) {
		this.fileUploadContentType = fileUploadContentTypes;
	}*/

	public String getSaveDirectory() {
		return saveDirectory;
	}

	public void setSaveDirectory(String saveDir) {
		this.saveDirectory = saveDir;
	}

	public BuscarHCFiltro getHcFiltro() {
		return hcFiltro;
	}

	public void setHcFiltro(BuscarHCFiltro hcFiltro) {
		this.hcFiltro = hcFiltro;
	}

	public String editar() throws Exception {
		
		String nom1 = String.valueOf(historiaclinica.getNombrePaciente().charAt(0));
		String ape1 = String.valueOf(historiaclinica.getApellidoPaternoPaciente().charAt(0));
		String dni = String.valueOf(historiaclinica.getDniPaciente());
		historiaclinica.setCodigo(nom1 + ape1 + dni);
				
		historiaClinService.registrar(historiaclinica);
		String[] params = new String[] { getText(Constantes.MODULO_HC) };
		addActionMessage(getText(Constantes.MENSAJE_INSERT_OK, params));
		
		return SUCCESS;
		
			/*if (fileUpload != null) {
				for (int i = 0; i < fileUpload.length; i++) {
					File uploadedFile = fileUpload[i];
					String fileName = fileUploadFileName[i];
					File destFile = new File(saveDirectory + File.separator
							+ fileName);

					if ((i == 0) && (fileName != null)) {
						historiaclinica.setFotoPaciente(fileName);
					}
					if ((i == 1) && (fileName != null)) {
						historiaclinica.setFotoPadre(fileName);
					}
					if ((i == 2) && (fileName != null)) {
						historiaclinica.setFotoMadre(fileName);
					}
					if ((i == 3) && (fileName != null)) {
						historiaclinica.setFotoApoderado(fileName);
					}

					try {
						FileUtils.copyFile(uploadedFile, destFile);
					} catch (IOException ex) {
						System.out.println("No se pudo copiar el archivo "
								+ fileName);
						ex.printStackTrace();
					}
				}
			}*/



/*		} else {
			historiaClinService.actualizar(historiaclinica);
			String[] params = new String[] { getText(Constantes.MODULO_HC),
					historiaclinica.getId().toString() };
			addActionMessage(getText(Constantes.MENSAJE_UPDATE_OK, params));
		}*/
		
	}

	public String buscar() throws Exception {

		historias = historiaClinService.buscarHC(hcFiltro);
		if (historias.size() > 0) {
			addActionMessage(getText(Constantes.MENSAJE_BUSCAR_HC_RESULTS)
					+ historias.size());
		} else {
			addActionMessage(getText(Constantes.MENSAJE_BUSCAR_HC_NO_RESULTS));
		}
		return SUCCESS;
	}

	public String desactivar() throws Exception {

		historiaClinService.desactivar(historiaclinica.getId());

		String[] params = new String[] { getText(Constantes.MODULO_HC),
				historiaclinica.getId().toString() };

		addActionMessage(getText(Constantes.MENSAJE_HC_DESACTIVADO_OK, params));

		return SUCCESS;
	}

	public String obtener() throws Exception {

		historiaclinica = historiaClinService.obtener(historiaclinica.getId());
		return SUCCESS;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub

		TipoSangreService tipoSangreService = new TipoSangreServiceDAO();
		tipoSangres = tipoSangreService.getTodos();

	}

}
