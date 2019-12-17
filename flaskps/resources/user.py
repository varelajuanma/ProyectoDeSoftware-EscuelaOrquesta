from flask import redirect, render_template, request, url_for, session, abort, flash
from flaskps.db import get_db
from flaskps.models.user import User
from flaskps.models.configuracion import Configuracion
from flaskps.helpers.auth import authenticated
from flaskps.resources import user
from flaskps.resources import validador
import json
import requests as rqs
# aca le pido a el modelo de usuario que me devuelva que rol tengo y aca pregunto si soy administrador caso afirmativo
# dejo que acceda a la vista
# Controladores del home para registrarse/iniciar sesion
def home():
    Configuracion.db = get_db()
    pat=Configuracion.configurartitulo()[0]
    return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])


def new():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    return render_template('user/new.html',titulo=pat['titulo'], descripcion=pat['descripcion'])

def create():
    params = request.form
    User.db = get_db()
    email = User.find_by_email(params['email'])
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if not email:
        User.create(request.form)
        flash("El usuario se creó correctamente.")
        return redirect(url_for('user_home'))

    flash("Ya existe un usuario registrado con ese email, por favor ingresar otro.")
    return render_template('user/new.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
    habilitacion=pat['habilitacion'])

# Controladores del index administrador + volver a esa ruta
def administracion():
    if 'user' in session.keys():
        if tiene_permiso("configuracion_sistema"):
            Configuracion.db = get_db()
            pat = Configuracion.configurartitulo()[0]
            return render_template('user/administracion.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion = pat['habilitacion'], mail=pat["mailcontacto"],paginacion=pat["paginacion"])
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('user/homeEstudiante.html')

    else:
        flash("Debes iniciar sesion para ver este contenido")
        return home()
def cambiarconfiguracion():
    Configuracion.db = get_db()
    Configuracion.cambiartitulo(request.form)
    flash("Se modifico exitosamente")
    return redirect(url_for('user_administracion'))

def volver_admin():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session:
        return render_template('admin/admin.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return home()

# Controladores del modulo de usuarios
def alta_usuario():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if tiene_permiso("usuario_new"):

            return render_template('user/alta_usuario.html',titulo=pat['titulo'], descripcion=pat['descripcion'])
        else:
            User.db = get_db()
            pat2= User.all()
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('user/listado_usuarios.html',titulo=pat['titulo'], descripcion=pat['descripcion'], pat2=pat2)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return home()

def agregar_usuario():
    if 'user' in session.keys():
        if tiene_permiso("usuario_new"):
            params = request.form
            User.db = get_db()
            email = User.find_by_email(params['email'])
            Configuracion.db = get_db()
            pat = Configuracion.configurartitulo()[0]
            if validador.validarusuario(request.form) == False:
             flash("Ingresaste un dato inesperado")
             return render_template('user/alta_usuario.html',titulo=pat['titulo'], descripcion=pat['descripcion'])
            else:
             if not email:
                User.create(params)
                flash("Usuario dado de alta correctamente.")
                return redirect(url_for('user_listado'))
             else:
                flash("Ya existe un usuario registrado con ese email, por favor ingresar otro.")
                return render_template('user/alta_usuario.html',titulo=pat['titulo'], descripcion=pat['descripcion'])
        else:
            User.db = get_db()
            pat2= User.all()
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('user/listado_usuarios.html',titulo=pat['titulo'], descripcion=pat['descripcion'], pat2=pat2)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return home()

def tiene_permiso(permiso):
    User.db = get_db()
    permiso_aceptado = User.buscarPermiso(session['rol'], permiso)
    return permiso_aceptado

def listarUsuarios():
    print(session)
    print(session.keys())
    if 'user' in session.keys():
        Configuracion.db = get_db()
        pat = Configuracion.configurartitulo()[0]
        if tiene_permiso("usuario_index"):
            User.db = get_db()
            pat2=User.all()
            for a in pat2:
                rol = User.getIdRolUser(a['email'])
                if rol != None:
                    rol = rol['rol_id']
                else:
                    rol = 0
                a.update( {'rol' : rol} )

            return render_template('user/listado_usuarios.html',titulo=pat['titulo'],paginacion=pat['paginacion'],habilitacion=pat['habilitacion'], pat2= pat2)
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('/user/homeEstudiante.html')
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return home()

def modificar_usuario():
	params = request.form
	Configuracion.db = get_db()
	User.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	email = User.find_by_email(params['email'])
	if validador.validarusuario(request.form) == False:
		flash("ingresaste un dato inesperado")
		return  redirect(url_for('user_listado'))
	else:
		if not email:
			userUpdate = User.modify(request.form)
			return  redirect(url_for('user_listado', userUpdate=userUpdate))
		else:
			flash("Ya existe un usuario registrado con ese email, por favor ingresar otro.")
			return  redirect(url_for('user_listado'))

def cambiar_usuario():
    User.db = get_db()
    userUpdate = User.datosdeusuario(request.form)
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    return render_template('user/modificarUsuario.html', userUpdate=userUpdate,
    titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])

def eliminar_usuario():
    Configuracion.db = get_db()
    User.db = get_db()
    User.eliminarUsuario(request.form)
    flash("Usuario eliminado")
    return redirect(url_for('user_listado'))

def bloquear_usuario():
    Configuracion.db = get_db()
    User.db = get_db()
    pat = User.bloquearUsuario(request.form)
    flash("Usuario bloqueado correctamente")
    return redirect(url_for('user_listado'))

def desbloquear_usuario():
    User.db = get_db()
    Configuracion.db = get_db()
    pat = User.desbloquearUsuario(request.form)
    flash("Usuario desbloqueado correctamente")
    return redirect(url_for('user_listado'))

# Controladores del modulo docentes
def docentes():
    if 'user' in session.keys():
        Configuracion.db = get_db()
        pat= Configuracion.configurartitulo()[0]
        return render_template('user/docentes.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return home()

# Controladores de busqueda
def busqueda():
    Configuracion.db = get_db()
    pat= Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if tiene_permiso("estudiante_show"):
            email_est = request.form
            User.db = get_db()
            pat2 = User.busqueda_usuario(email_est['email_est'])
            if pat2:
                for a in pat2:
                    rol = User.getIdRolUser(a['email'])
                    if rol != None:
                        rol = rol['rol_id']
                    else:
                        rol = 0
                    a.update( {'rol' : rol} )
                return render_template('user/listado_usuarios.html', pat2 = pat2, titulo=pat['titulo'], descripcion=pat['descripcion'],
                habilitacion=pat['habilitacion'])
            else:
                return render_template('user/sinUsuarios.html', pat2 = pat2)
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('/home.html')
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return home()

def busquedaBloqueados():
    User.db = get_db()
    result = User.busqueda_usuarios_bloqueados()
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if tiene_permiso("usuario_show"):
            if result:
                for a in result:
                    rol = User.getIdRolUser(a['email'])
                    if rol != None:
                        rol = rol['rol_id']
                    else:
                        rol = 0
                    a.update( {'rol' : rol} )
                return render_template('user/usuariosBloqueados.html', param = result,titulo=pat['titulo'], descripcion=pat['descripcion'],paginacion=pat['paginacion'])
            else:
                return render_template('user/sinUsuarios.html', param = result,titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('user/homeEstudiante.html')
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return home()

def busquedaActivos():
    User.db = get_db()
    result = User.busqueda_usuarios_activos()
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if tiene_permiso("usuario_show"):
            if result:
                for a in result:
                    rol = User.getIdRolUser(a['email'])
                    if rol != None:
                        rol = rol['rol_id']
                    else:
                        rol = 0
                    a.update( {'rol' : rol} )
                return render_template('user/usuariosActivos.html', param = result,titulo=pat['titulo'], descripcion=pat['descripcion'],paginacion=pat['paginacion'])
            else:
                return render_template('user/sinUsuarios.html', param = result,titulo=pat['titulo'], descripcion=pat['descripcion'])
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('user/homeEstudiante.html')
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return home()
