<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="page-wrapper">

	<div class="container-fluid" >
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Modulo de Gestión de Personal</h1>
			</div>
		</div>
		<div id="opcion" class="col-lg-12">
		<h4>Por Favor Escoga un opcion:</h4>
			<div class="col-lg-12">
				<button id="btnRegistrar" class="btn btn-primary" onclick="registrar();" >Registrar</button>
			 	<button id="btnModificar" class="btn btn-primary" onclick="modificar();">Modificar</button>
				<!--<button id="btnDeshabilitar" class="btn btn-primary" onclick="deshabilitar();">Deshabilitar</button>-->
			</div>
		</div>
		<!-- Registrar -->
		<div class="col-lg-12" id="divRegistrar" style='display:none;'>
		<h2>Registrar Personal</h2>
			<s:form theme="bootstrap" action="agregarPersonal" namespace="/personal" cssClass="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-5">
						<s:hidden></s:hidden>
						<s:select list="tipopersonal" name="personal.tipoPersonal.id" onchange="opcPersonal();"
						key="Tipo Personal" listKey="id" listValue="descripcion" headerKey="-1" headerValue="Elegir Tipo de Personal" id="cboPersonal">
						</s:select>	
						<s:textfield name="personal.dni" key="Dni" cssClass="form-control"  placeholder="47765562"></s:textfield>
						<s:textfield name="personal.nombres" key="Nombres" cssClass="form-control"  placeholder="Nombres"></s:textfield>
						<s:textfield name="personal.apellidos" key="Apellidos" cssClass="form-control"  placeholder="Apellidos"></s:textfield>
						<s:textfield name="personal.telefono" key="Telefono" cssClass="form-control"  placeholder="Telefono"></s:textfield>
						<s:textfield name="personal.celular" key="Celular" cssClass="form-control"  placeholder="Celular"></s:textfield>
						<s:textfield name="personal.correo" key="correo" cssClass="form-control"  placeholder="correo@correo.com"></s:textfield>
						<s:textfield name="personal.urlCV" key="urlFoto" cssClass="form-control"  placeholder="CV"></s:textfield>
						<s:textfield name="personal.urlFoto" key="urlFoto" cssClass="form-control"  placeholder="Foto"></s:textfield>		
					</div>
					<div class="col-md-6">
						<div id="Medico" style='display:none;' >
								<h3>Agregar CMP Y Especialidad</h3>
								<s:textfield id="cmp" name="medico.cmp" key="CMP" cssClass="form-control"  value="47765562" ></s:textfield>
								<s:select list="especialidad" name="medico.especialidad.id" label="Especialidad"
								 listKey="id" listValue="nombre" headerKey="-1" headerValue="Elegir Especialidad">
						</s:select>	
						</div>	
						<div id="Asistente" style='display:none;' >
								<h3>Por Favor Elegir un Medico</h3>
								<s:select list="medicos" name="asistente.medicoAsignado.id"
								key="Medico" listKey="id" listValue="nombreCompleto" emptyOption="true">
						</s:select>	
								
						</div>
						</div>
					<div class="col-md-4">
						<s:submit value="Registrar" cssClass="btn btn-default"></s:submit>
					</div>
				</div>
			</s:form>
		</div>
		
		<!-- Modificar -->
		<div class="col-lg-12" id="divModificar" style='display:none;'>
		<h2>Modificar Personal</h2>
		<div>
			<button type="button" class="btn btn-default" data-toggle="modal"
					data-target="#buscarPersonal2">
				Buscar Personal
			</button>
		</div><br>
			<s:form theme="bootstrap" action="modificarPersonal" namespace="/personal" cssClass="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-5">
						<s:hidden></s:hidden>
						<s:select list="tipopersonal" name="personal.tipoPersonal.id" onchange="opcPersonal2();"
						key="Tipo Personal" listKey="id" listValue="descripcion" headerValue="Elegir Tipo de Personal" headerKey="-1" id="cboPersonal2">
						</s:select>	
						<s:textfield name="personal.dni" key="Dni" cssClass="form-control"  placeholder="47765562"></s:textfield>
						<s:textfield name="personal.nombres" key="Nombres" cssClass="form-control"  placeholder="Nombres"></s:textfield>
						<s:textfield name="personal.apellidos" key="Apellidos" cssClass="form-control"  placeholder="Apellidos"></s:textfield>
						<s:textfield name="personal.telefono" key="Telefono" cssClass="form-control"  placeholder="Telefono"></s:textfield>
						<s:textfield name="personal.celular" key="Celular" cssClass="form-control"  placeholder="Celular"></s:textfield>
						<s:textfield name="personal.correo" key="correo" cssClass="form-control"  placeholder="correo@correo.com"></s:textfield>
						<s:textfield name="personal.urlCV" key="urlFoto" cssClass="form-control"  placeholder="CV"></s:textfield>
						<s:textfield name="personal.urlFoto" key="urlFoto" cssClass="form-control"  placeholder="Foto"></s:textfield>		
					</div>
					<div class="col-md-6">
						<div id="Medico" style='display:none;' >
								<h3>Agregar CMP Y Especialidad</h3>
								<s:textfield id="cmp" name="medico.cmp" key="CMP" cssClass="form-control"  ></s:textfield>
								<s:select list="especialidad" name="medico.especialidad.id"
						key="label.combo.especialidad" listKey="id" listValue="nombre" emptyOption="true" >
						</s:select>	
						</div>	
						<div id="Asistente" style='display:none;' >
								<h3>Por Favor Elegir un Medico</h3>
								<s:select list="medicos" name="asistente.medicoAsignado.id"
								key="Medico" listKey="id" listValue="nombreCompleto" emptyOption="true">
						</s:select>	
								
						</div>
						</div>
					<div class="col-md-4">
						<s:submit value="Modificar" cssClass="btn btn-default"></s:submit>
						<s:submit value="Deshabilitar" cssClass="btn btn-default"></s:submit>
					</div>
				</div>
			</s:form>
		</div>
		
		<!-- Deshabilitar -->
		<div class="col-lg-12" id="divDeshabilitar" style='display:none;'>
			<h2>Deshabilitar Personal</h2>
		</div>
	</div>
</div>
<jsp:include
	page="/WEB-INF/paginas/body/modulos/personal/buscarPersonal.jsp"></jsp:include>
<script>
function registrar()
{

	var btnregistrar=document.getElementById('btnRegistrar');
	var btnmodificar=document.getElementById('btnModificar');
//	var btndeshabilitar=document.getElementById('btnDeshabilitar');
	
	var divregistrar=document.getElementById('divRegistrar');
	var divmodificar=document.getElementById('divModificar');
//	var divdeshabilitar=document.getElementById('divDeshabilitar');
	
	if (divregistrar.style.display == 'none')
	{
		
		btnmodificar.style.display = '';
		btnregistrar.style.display = 'none';
//		btndeshabilitar.style.display = '';
		
		divregistrar.style.display = '';
		divmodificar.style.display = 'none';
//		divdeshabilitar.style.display = 'none';

	}	
	document.getElementById("cboPersonal").required = true;
}
function modificar()
{

var btnregistrar=document.getElementById('btnRegistrar');
var btnmodificar=document.getElementById('btnModificar');
//var btndeshabilitar=document.getElementById('btnDeshabilitar');

var divregistrar=document.getElementById('divRegistrar');
var divmodificar=document.getElementById('divModificar');
//var divdeshabilitar=document.getElementById('divDeshabilitar');

	if(divmodificar.style.display == 'none')
	{
		btnmodificar.style.display = 'none';
		btnregistrar.style.display = '';
//		btndeshabilitar.style.display = '';
		
		divregistrar.style.display = 'none';
		divmodificar.style.display = '';
//		divdeshabilitar.style.display = 'none';
		
	}
}
/*
function deshabilitar()
{

var btnregistrar=document.getElementById('btnRegistrar');
var btnmodificar=document.getElementById('btnModificar');
var btndeshabilitar=document.getElementById('btnDeshabilitar');

var divregistrar=document.getElementById('divRegistrar');
var divmodificar=document.getElementById('divModificar');
var divdeshabilitar=document.getElementById('divDeshabilitar');

	if (divdeshabilitar.style.display == 'none')
	{
		btnmodificar.style.display = '';
		btnregistrar.style.display = '';
		btndeshabilitar.style.display = 'none';
		
		divregistrar.style.display = 'none';
		divmodificar.style.display = 'none';
		divdeshabilitar.style.display = '';
		
	}
}
*/
function opcPersonal(){
	var medico =document.getElementById('Medico');
	var asistente=document.getElementById('Asistente');
	
    var combo=document.getElementById('cboPersonal');
    var valorCombo =combo.options[combo.selectedIndex].text;
    
    
    /*Inputs para medico y recepcionista*/

    
    
    	if(valorCombo == 'Medico')
    	{
    		medico.style.display = 'block';
    		asistente.style.display = 'none';
    		document.getElementById("cmp").required = true;
    		
    	}
    	else if(valorCombo=='Asistente')
   		{
    		asistente.style.display = 'block';  
    		medico.style.display = 'none';		
   		}else
		{
   			asistente.style.display = 'none';  
    		medico.style.display = 'none';	
		}

    }
    
function opcPersonal2(){
	var medico =document.getElementById('Medico2');
	var asistente=document.getElementById('Asistente2');
	
    var combo=document.getElementById('cboPersonal2');
    var valorCombo =combo.options[combo.selectedIndex].text;
    
    
    /*Inputs para medico y recepcionista*/

    
    
    	if(valorCombo == 'Medico')
    	{
    		medico.style.display = 'block';
    		asistente.style.display = 'none';
    		document.getElementById("cmp").required = true;
    		
    	}
    	else if(valorCombo=='Asistente')
   		{
    		asistente.style.display = 'block';  
    		medico.style.display = 'none';		
   		}else
		{
   			asistente.style.display = 'none';  
    		medico.style.display = 'none';	
		}

    }
</script>



<script>
window.onload = function() {

	$('#buscarPer')
			.submit(
					function(event) {//buscar cons es el id del form que se ejecuta en el popup
						var $form = $("#buscarPer");
						var $target = $($form.attr('data-target'));

						$
								.ajax({
									type : $form.attr('method'),
									url : $form.attr('action'),
									data : $form.serialize(),
									datatype : 'json',
									success : function(data, status) {
										console.log(data);

										$('#buscarPersonal').modal('show');//buscarCOnsulttorio es el action del form del popup

										var lista = data;//consultorios es el nombre del objecto(la lista de consultorios) en el action que recibe la lista
										var url = "http://localhost:8080/proyFinal/personal/personal/cargarPersonal.action?personal.id=";

										for (var i = 0; i < lista.length; i++) {
											tr = $('<tr/>');
											tr.append("<td>" + lista[i].id
													+ "</td>");
											tr.append("<td>"
													+ lista[i].nombres
													+ "</td>");
											tr.append("<td>"
													+ lista[i].apellidos
													+ "</td>");
											tr.append("<td>" + lista[i].dni
													+ "</td>");
											tr
													.append("<td><a href="+ url +lista[i].id +">Seleccionar</a></td>");
											$("#Personal tbody").append(tr);// consultorios es el nombre del objecto(la lista de consultorios) en el action que recibe la lista
										}

									}
								});

						event.preventDefault();
					});
}

	
</script>