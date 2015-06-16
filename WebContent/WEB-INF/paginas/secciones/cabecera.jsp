<%@ taglib prefix="s" uri="/struts-tags" %>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header" >
                <a	href="<s:url action="iniciarPrincipal" namespace="/seguridad"/>" class="navbar-brand" >
							<s:text name="titulo.medikids" />
				</a>
            </div>
            <div class="nav-top" >
            	<ul class="nav navbar-left">
                    <li class="tooltip-sidebar-toggle">
                        <a	href="<s:url action="iniciarPrincipal" namespace="/seguridad"/>" id="menu-toggle">
							<i class="fa fa-bars" ></i>
						</a>
                    </li>
                    <!-- You may add more widgets here using <li> -->
                </ul>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>John Smith<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a	href="<s:url action="iniciarPerfilusuario" namespace="/usuario"/>">
								<s:text name="accion.perfil" /><i class="fa fa-fw fa-user"></i>
							</a>
                        </li>
                        <li>
                            <a	href="<s:url action="iniciarConfiguracionUsuario" namespace="/usuario"/>">
								<s:text name="accion.configuracion" /><i class="fa fa-fw fa-gear"></i>
							</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a	href="<s:url action="logoutUsuario" namespace="/seguridad"/>">
								<s:text name="accion.logout" /><i class="fa fa-fw fa-power-off"></i>
							</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>