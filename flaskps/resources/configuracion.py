from flask import redirect, render_template, request, url_for, session, abort, flash
from flaskps.db import get_db
#from flaskps.models.user import User
from flaskps.models.configuracion import Configuracion
from flaskps.helpers.auth import authenticated

# Controladores del modulo de configuracion
def modificarpagina():
	Configuracion.db = get_db()
	pat= Configuracion.configurartitulo()[0]
	return render_template('/config/modificarpaginas.html',titulo=pat['titulo'], descripcion=pat['descripcion'],paginacion=pat['paginacion'])

def desactivar():
	Configuracion.db = get_db()
	pat= Configuracion.configurartitulo()[0]
	return render_template('/config/desactivar.html',titulo=pat['titulo'], descripcion=pat['descripcion'])
def configurartitulo():
    Configuracion.db = get_db()
    pat= Configuracion.configurartitulo()[0]
    return render_template('config/modificartitulo.html',titulo=pat['titulo'], descripcion=pat['descripcion'])

def configuraremail():
    Configuracion.db = get_db()
    pat= Configuracion.configurartitulo()[0]
    return render_template('config/modificaremail.html',titulo=pat['titulo'], descripcion=pat['descripcion'],mail=pat['mailcontacto'])


def vistadesactivada():
	Configuracion.db = get_db()
	#pat = Configuracion.configurartitulo()[0]
	Configuracion.desactivarPagina()
	return redirect(url_for('user_administracion'))#render_template('/config/vistadesactivada.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])

def paginacion():
	Configuracion.db = get_db()
	Configuracion.cambiarpaginado(request.form)
	flash("Su paginación se modificó exitosamente")
	return redirect(url_for('user_modificarpagina'))


def activar():
	Configuracion.db = get_db()
	Configuracion.habilitarsistema()
	#pat = Configuracion.configurartitulo()[0]
	return redirect(url_for('user_administracion'))#render_template('/user/administracion.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
