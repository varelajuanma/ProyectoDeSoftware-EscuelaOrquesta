from flask import redirect, render_template, request, url_for, abort, session, flash
from flaskps.db import get_db
from flaskps.models.user import User
from flaskps.models.configuracion import Configuracion


def errorUser():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if pat['habilitacion'] == 0:
        return render_template('config/vistadesactivada.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
    return render_template('/home.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])

def authenticate():
    params = request.form
    User.db = get_db()
    user = User.find_by_email_and_pass(params['email'], params['contraseña'])
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if not user:
        flash("El nombre de usuario y la contraseña que ingresaste no coinciden con nuestros registros. Por favor, revisa e inténtalo de nuevo.")  ## aca tambien esta lo del flash
        return redirect(url_for('auth_errorUser'))
    session['user'] = request.form['email']
    aux = User.devolverNombreApellido(request.form['email'])
    session['nombre_apellido'] = aux['nombre'] + " " + aux['apellido']
    idRol = User.getIdRolUser(params['email'])
    if idRol is None:
        if pat['habilitacion'] == 0 :
                flash("No se puede iniciar sesión con el sitio deshabilitado")
                return redirect(url_for('auth_errorUser'))
        flash("La sesión se inició correctamente.")
        return render_template('user/homeEstudiante.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
    else:
        session['rol'] = idRol['rol_id']
        if  idRol['rol_id'] != 1 :
            if pat['habilitacion'] == 0 :
                flash("No se puede iniciar sesión con el sitio deshabilitado")
                return redirect(url_for('auth_errorUser'))
            if  idRol['rol_id'] == 2 :
                return render_template('user/homeDocente.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
            if  idRol['rol_id'] == 3 :
                return render_template('user/homeEstudiante.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
            if  idRol['rol_id'] == 4 :
                return redirect(url_for('listarEstudiantesParaPreceptor'))

        flash("Iniciaste sesión como Administrador")
        return render_template('admin/admin.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])

def logout():
    if session.get('rol'):
        del session['rol']
        del session['user']
    session.clear()
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    habilitacion = pat['habilitacion']
    flash("La sesión se cerró correctamente.")
    if habilitacion == 0:
        return render_template('config/vistadesactivada.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=habilitacion)
    return render_template('/home.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=habilitacion)
