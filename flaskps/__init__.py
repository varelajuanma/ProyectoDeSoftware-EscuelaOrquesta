from os import path
from datetime import timedelta
from flask import Flask, render_template, g, flash, request
from flask_session import Session
from flaskps.resources import home
from flaskps.resources import user
from flaskps.resources import docentes
from flaskps.resources import preceptor
from flaskps.resources import auth
from flaskps.resources import configuracion
from flaskps.resources import estudiante
from flaskps.resources import ciclo
from flaskps.resources import instrumento
from flaskps.resources import asistencia
from flaskps.config import Config
from flaskps.helpers import handler
from flaskps.helpers import auth as helper_auth
from flaskps.db import get_db
from flaskps.models.user import User
from flaskps.models.configuracion import Configuracion
from flaskps.models.ciclo import Ciclo

import os
from werkzeug import secure_filename
#from flaskps.models  import user ## la importo esa es la ruta lo primero
# Configuración inicial de la app ## porque ES DE LARAVEL ESE JAAJJA
app = Flask(__name__)
app.config.from_object(Config)

#Server Side session
app.config['SESSION_TYPE'] = 'filesystem'
Session(app)
app.permanent_session_lifetime = timedelta(minutes=10)
SESSION_REFRESH_EACH_REQUEST = True
# Funciones que se exportan al contexto de Jinja2
app.jinja_env.globals.update(is_authenticated=helper_auth.authenticated)

# Autenticación
app.add_url_rule("/usuario_incorrecto", 'auth_errorUser', auth.errorUser)
app.add_url_rule("/cerrar_sesion", 'auth_logout', auth.logout)
app.add_url_rule("/inicio_sesion", 'auth_authenticate', auth.authenticate, methods=['POST'])

#Ubicacion de mapas
app.add_url_rule("/mapa", 'mapa', home.mapas)
app.add_url_rule("/mapa/alta_nucleo" , 'alta_nucleo', home.alta_nucleo)
app.add_url_rule("/nucleo_alta", 'nucleo_alta', home.agregar_nucleo, methods=['POST'])
app.add_url_rule("/mapa/eliminar_nucleo", 'eliminar_nucleo', home.eliminar_nucleo, methods=['POST']) #Eliminar un nucleo
app.add_url_rule("/mapa/modificar_nucleo", 'modificar_nucleo', home.modificar_nucleo, methods=['POST']) #Te lleva a la pagina de modificar nucleo con los datos
app.add_url_rule("/mapa/guardarModificaciones", 'guardarModificacionesNucleo', home.guardarModificacionesNucleo, methods=['POST']) #Realiza las moficiaciones de datos del nucleo

# Pagina Contacto del home
app.add_url_rule("/contacto", 'contacto', home.contacto)

# Usuarios que se registran desde el home
app.add_url_rule("/usuarioregistrado", 'user_home', user.home)
app.add_url_rule("/usuarios/nuevo", 'user_new', user.new)
app.add_url_rule("/usuario_existente", 'user_create', user.create, methods=['POST'])

# Administrador - Pagina Inicial
app.add_url_rule("/usuarios/administracion", 'user_administracion' , user.administracion)
app.add_url_rule("/usuarios/administracion", 'user_administracion_config' , user.cambiarconfiguracion,methods=['POST'])
app.add_url_rule("/inicio_sesion", 'user_volveradmin', user.volver_admin) # ESTO ES PARA VOLVER ATRAS EN LA ADMINISTRACION

# Modulo Usuarios
app.add_url_rule("/usuarios/listado", 'user_listado', user.listarUsuarios) ##agregado metodo que llama al controlador
app.add_url_rule("/usuarios/alta_usuario" , 'alta_usuario' , user.alta_usuario)
app.add_url_rule("/usuario_alta", 'user_alta', user.agregar_usuario, methods=['POST'] ) #Alta de usuario
app.add_url_rule("/usuarios/busqueda" , 'user_search' , user.busqueda , methods=['POST'])
app.add_url_rule("/usuarios/busquedaBloqueados" , 'user_search_locked' , user.busquedaBloqueados)
app.add_url_rule("/usuarios/busquedaActivos" , 'user_search_dislocked' , user.busquedaActivos)
app.add_url_rule("/usuarios/eliminar_usuario", 'eliminar_usuario',user.eliminar_usuario, methods=['POST'])
app.add_url_rule("/usuarios/cambiar_usuario", 'cambiar_usuario',user.cambiar_usuario, methods=['POST'])
app.add_url_rule("/usuarios/bloquear_usuario", 'bloquear_usuario',user.bloquear_usuario, methods=['POST'])
app.add_url_rule("/usuarios/desbloquear_usuario", 'desbloquear_usuario',user.desbloquear_usuario, methods=['POST'])
app.add_url_rule("/usuarios/guardarModificaciones", 'guardarModificaciones',user.modificar_usuario, methods=['POST'])

# Modulo Docentes
app.add_url_rule("/docentes/listado", 'docentes_listado', docentes.listar_docentes)
app.add_url_rule("/docentes/alta_docente", 'docentes_alta', docentes.alta_docente)
app.add_url_rule("/docentes/agregar_docente", 'docente_alta', docentes.crear_docente, methods=['POST'])
app.add_url_rule("/docentes/baja_docente", 'docente_baja', docentes.baja_docente, methods=['POST'])
app.add_url_rule("/docentes/detalle_docente", 'docente_detalle', docentes.detalle_docente, methods=['POST'])
app.add_url_rule("/docentes/modificar_docente_form", 'modificar_docente_form', docentes.modificar_docente_form, methods=['POST'])
app.add_url_rule("/docentes/modificar_docente", 'modificar_docente', docentes.modificar_docente, methods=['POST'])
app.add_url_rule("/docentes/docente_volver", 'docente_volver', docentes.volver)

# Modulo estudiantes
app.add_url_rule("/estudiantes/listado", 'estudiante_listado', estudiante.listarEstudiantes) #Modulo estudiante listados
app.add_url_rule("/estudiantes/alta_estudiante", 'alta_estudiante' , estudiante.alta_estudiante) #Muestra formulario para cargar los datos del estudiante a agregar
app.add_url_rule("/estudiantes/datos_estudiante", 'datos_estudiante' , estudiante.datos_estudiante, methods=['POST']) #Muestra formulario para ver los datos del estudiante
app.add_url_rule("/agregar_estudiante", 'agregar_estudiante', estudiante.agregar_estudiante, methods=['POST'] ) #Toma los datos para dar de alta un estudiante
app.add_url_rule("/estudiantes/eliminar_estudiante", 'eliminar_estudiante', estudiante.eliminar_estudiante, methods=['POST']) #Eliminar un estudiante
app.add_url_rule("/estudiantes/modificar_estudiante", 'modificar_estudiante',estudiante.modificar_estudiante, methods=['POST']) #Te lleva a la pagina de modificar estudiante con los datos
app.add_url_rule("/estudiantes/guardarModificaciones", 'guardarModificacionesEstudiante',estudiante.guardarModificacionesEstudiante, methods=['POST']) #Realiza las moficiaciones de datos del estudiante

# Modulo Configuración del admin
app.add_url_rule("/config/activar",'config_activar',configuracion.activar)
app.add_url_rule("/config/vistadesactivada",'user_desactivar',configuracion.vistadesactivada)

# Modulo Ciclo Lectivo
app.add_url_rule("/usuario/ciclolectivo",'ciclo_list',ciclo.mostrarciclo)
app.add_url_rule("/ciclolectivo-nuevociclo",'new_ciclo',ciclo.cargarciclo)
app.add_url_rule("/ciclolectivo-insertar",'ciclo_new',ciclo.insertar,methods=['POST'])
app.add_url_rule("/ciclolectivo-insertartaller",'insert_taller',ciclo.insertartaller,methods=['POST'])
app.add_url_rule("/ciclolectivo-docente-taller/<idciclo>-<idtaller>",'new_docente_taller',ciclo.listardocente,methods=['GET'])
app.add_url_rule("/ciclolectivo-estudiante-taller/<idciclo>-<idtaller>",'new_estudiante_taller',ciclo.listarestudiante,methods=['GET'])
app.add_url_rule("/ciclolectivo-taller-ciclo/<idciclo>",'new_taller_ciclo',ciclo.listartalleres, methods=['GET'])
app.add_url_rule("/ciclolectivo-docente-taller-insert",'insert_taller_docente',ciclo.insertdocente,methods=['POST'])
app.add_url_rule("/ciclolectivo-estudiante-taller-insert",'insert_taller_estudiante',ciclo.insertestudiante,methods=['POST'])
app.add_url_rule("/ciclolectivo-usuarios-taller/<id>-<cId>",'verUsuarios_taller',ciclo.verUsuariosTaller,methods=['GET'])
app.add_url_rule("/ciclolectivo-estudiante-eliminar",'eliminarEstudiante',ciclo.borrarEstudiante,methods=['POST'])
app.add_url_rule("/ciclolectivo-docente-eliminar",'eliminarDocente',ciclo.borrarDocente,methods=['POST'])
app.add_url_rule("/ciclolectivo-delete-taller-ciclo",'borrar_taller',ciclo.borrarTaller, methods=['POST'])
app.add_url_rule("/ciclolectivo-update-ciclo/<id>",'modificarCiclo',ciclo.modificarCiclo, methods=['GET'])
app.add_url_rule("/ciclolectivo-delete-ciclo",'eliminar_ciclo',ciclo.borrarCiclo, methods=['POST'])
app.add_url_rule("/ciclolectivo-guardarModificacion", 'guardarModificacionCiclo',ciclo.guardarModificacion, methods=['POST'])
app.add_url_rule("/ciclolectivo-talleres-ciclo/<id>",'listar_talleresCiclo',ciclo.listar_talleresCiclo, methods=['GET'])
app.add_url_rule("/ciclolectivo-ciclos-pasados",'mostrarCiclosPasados',ciclo.ciclosPasados)
app.add_url_rule("/ciclolectivo-volver-talleresCiclos/<id>",'volverTalleresCiclo',ciclo.volverTalleresCiclo, methods=['GET'])
app.add_url_rule("/ciclolectivo-dias-lugares/<id>-<cicloId>",'LugaresYdias',ciclo.devolverLugaresYdias, methods=['GET'])
app.add_url_rule("/ciclolectivo-form-dia-lugar",'formDiaLugar',ciclo.formularioDia_lugar,methods=['POST'])
app.add_url_rule("/ciclolectivo-modificar-dia-lugar",'modicarDia_lugar',ciclo.modificarDia_lugar,methods=['POST'])
app.add_url_rule("/ciclolectivo-formAgregar-dia-lugar/<id>-<ciclo_id>",'formAgregarDia_lugar',ciclo.formAgregarDia_lugar,methods=['GET'])
app.add_url_rule("/ciclolectivo-agregar-dia-lugar",'agregarDia_lugar',ciclo.agregarDia_lugar,methods=['POST'])
app.add_url_rule("/ciclolectivo-borrar-dia-lugar",'borrarDia_lugar',ciclo.borrarDia_lugar,methods=['POST'])

# Modulo Instrumento
app.add_url_rule("/instrumentos/listado", 'instrumentos_listado', instrumento.listar_instrumentos) #Modulo instrumento listado
app.add_url_rule("/instrumentos/alta_instrumento", 'alta_instrumento' , instrumento.alta_instrumento) #Muestra formulario para cargar los datos del instrumento a agregar
app.add_url_rule("/agregar_instrumento", 'agregar_instrumento', instrumento.agregar_instrumento, methods=['POST'] ) #Toma los datos para dar de alta un instrumento
app.add_url_rule("/instrumentos/eliminar_instrumento", 'eliminar_instrumento', instrumento.eliminar_instrumento, methods=['POST']) #Eliminar un instrumento
app.add_url_rule("/instrumentos/modificar_instrumento", 'modificar_instrumento',instrumento.modificar_instrumento, methods=['POST']) #Te lleva a la pagina de modificar instrumento con los datos
app.add_url_rule("/instrumentos/guardarModificaciones", 'guardarModificacionInstrumento',instrumento.guardarModificacion, methods=['POST']) #Realiza las moficiaciones de datos del instrumento
app.add_url_rule("/instrumentos/detalle", 'instrumento_detalle', instrumento.detalle_instrumento, methods=['POST'])
app.add_url_rule("/instrumentos/cambiar_foto", 'cambiar_foto', instrumento.cambiar_foto, methods=['POST'])
app.add_url_rule("/instrumentos/modificar_foto", 'modificar_foto', instrumento.guardarNuevaFoto, methods=['POST'])


# Home Preceptor
app.add_url_rule("/preceptor", 'listarEstudiantesParaPreceptor', preceptor.listarEstudiantesParaPreceptor)
app.add_url_rule("/preceptor/datos_estudiante", 'preceptor_datosEstudiante' , preceptor.preceptor_datosEstudiante, methods=['POST']) #Muestra formulario para ver los datos del estudiante
app.add_url_rule("/preceptor/modificar_estudiante", 'preceptor_modificarEstudiante',preceptor.preceptor_modificarEstudiante, methods=['POST']) #Te lleva a la pagina de modificar estudiante con los datos
app.add_url_rule("/preceptor/guardarModificaciones", 'preceptor_guardarModificacionesEstudiante',preceptor.preceptor_guardarModificacionesEstudiante, methods=['POST']) #Realiza las moficiaciones de datos del estudiante

#Modulo Asitencia
app.add_url_rule("/docente/listadotalleres/<id>", 'doc_taller', asistencia.listartalleresparadocente,methods=['GET'])
app.add_url_rule("/docente/listadoestudiante", 'estu_taller', asistencia.estudiante,methods=['POST'])
app.add_url_rule("/docente/insertasistencia", 'insert_asistencia', asistencia.insertasistencia,methods=['POST'])
app.add_url_rule("/docente/listar-asistencia", 'listar_asistencia', asistencia.listarordenada)
app.add_url_rule("/docente/asistencia-sinestudiante", 'listar_asistencia_sinestudiante', asistencia.sinestudiante)
app.add_url_rule("/docente/listar-estudiante-presente/<tallerid>", 'estu_presente', asistencia.listaestudiantespresentes,methods=['GET'])
# Handlers
app.register_error_handler(404, handler.not_found_error)
app.register_error_handler(401, handler.unauthorized_error)
# Implementar lo mismo para el error 500 y 401

@app.route("/") ## mira esto!!! esto va en el controlador oki okiu
def home():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if pat['habilitacion'] == 0:
          return render_template('config/vistadesactivada.html',titulo=pat['titulo'])
	return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'])
