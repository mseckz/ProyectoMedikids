<%@ taglib prefix="s" uri="/struts-tags"%>
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
				<li class="side-user hidden-xs">
					<div class="imagen-perfil oculto-xs">
						<img src="<s:url value="/images/perfil_fotos/profile-pic.jpg" namespace="/"/>" class="img-circle" alt="" style="margin-right: 20px" />
                        <div>
                        	<p class="name-mod" style="text-align: center">John Smith</p>
                        	<p class="text-muted text-xs block" style="text-align: center">Art Director</p>
                        </div>
					</div>
				</li>	
                <li class="paneles">
                    <a	href="<s:url action="iniciarRoles" namespace="/roles"/>">
							<s:text name="titulo.menu.rol" />
					</a>
                </li>
                <li class="paneles">
                    <a	href="<s:url action="iniciarHistorias" namespace="/historias"/>">
						<s:text name="titulo.menu.hc" />
					</a>
                </li>
                <li class="paneles">
                    <a	href="<s:url action="iniciarCitas" namespace="/citas"/>">
						<s:text name="titulo.menu.cita" />
					</a>
                </li>
                <li class="paneles">
                    <a	href="<s:url action="iniciarConsultas" namespace="/consultas"/>">
						<s:text name="titulo.menu.consulta" />
					</a>
                </li>
                <li class="paneles">
					<a	href="<s:url action="iniciarConsultorios" namespace="/consultorios"/>">
						<s:text name="titulo.menu.consultorio" />
					</a>
                </li>
                <li class="paneles">
                    <a	href="<s:url action="iniciarPersonal" namespace="/personal"/>">
						<s:text name="titulo.menu.personal" />
					</a>
                </li>
                <li class="paneles"></li>
            </ul>
        </div>


