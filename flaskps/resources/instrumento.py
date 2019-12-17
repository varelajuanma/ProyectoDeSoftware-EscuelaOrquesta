from flask import Flask
from flask import redirect, render_template, url_for, session, abort, flash, request
from flaskps.db import get_db
from flaskps.models.instrumentoModel import InstrumentoModel
from flaskps.models.configuracion import Configuracion
from flaskps.helpers.auth import authenticated
from flaskps.resources import user
from flaskps.resources import validador
import json
import requests as rqs
import os
from werkzeug import secure_filename
import base64
from flaskps.resources import validador
#from PIL import Image
#import Image


def listar_instrumentos():
    if 'user' in session.keys():
        if user.tiene_permiso("instrumento_index"):
            Configuracion.db = get_db()
            pat= Configuracion.configurartitulo()[0]
            InstrumentoModel.db = get_db()
            instrumentos = InstrumentoModel.listarInstrumentos()
            return render_template('instrumentos/listado_instrumentos.html',titulo=pat['titulo'], 
            descripcion=pat['descripcion'], habilitacion=pat['habilitacion'], paginacion=pat['paginacion'], 
            instrumentos = instrumentos)
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return redirect(url_for('auth_authenticate'))
    else:
    	Configuracion.db = get_db()
    	pat= Configuracion.configurartitulo()[0]
    	flash("Debes iniciar sesion para ver este contenido")
    	return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def detalle_instrumento():
    if 'user' in session.keys():
        if user.tiene_permiso("instrumento_show"):
            Configuracion.db = get_db()
            pat= Configuracion.configurartitulo()[0]
            InstrumentoModel.db = get_db()
            instrumento = InstrumentoModel.detalleInstrumento(request.form)
            imagen2 = instrumento["foto"]
            imagen = base64.b64encode(imagen2).decode("utf-8")
            return render_template('instrumentos/detalle_instrumento.html',titulo=pat['titulo'], 
            descripcion=pat['descripcion'], habilitacion=pat['habilitacion'],
            instrumento = instrumento, imagen=imagen)
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return redirect(url_for('auth_authenticate'))
    else:
    	Configuracion.db = get_db()
    	pat= Configuracion.configurartitulo()[0]
    	flash("Debes iniciar sesion para ver este contenido")
    	return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])


def alta_instrumento(): #Este controlador te lleva al formulario para dar de alta un instrumento
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    InstrumentoModel.db = get_db()
    if 'user' in session.keys():
        if user.tiene_permiso("instrumento_new"):
            tipo = InstrumentoModel.devolvertipos()
            return render_template('instrumentos/alta_instrumento.html',titulo=pat['titulo'], descripcion=pat['descripcion'], tipo=tipo)
        else:
            instrumentos=InstrumentoModel.listarInstrumentos()
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('instrumentos/listado_instrumentos.html',titulo=pat['titulo'], descripcion=pat['descripcion'], instrumentos=instrumentos )
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def agregar_instrumento(): #Este controlador toma los datos cargados en el formulario de alta
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("instrumento_new"):
            params = request.form
            if validador.validarinstrumento(request.form) == False:
                flash("se ingreso un dato inesperado")
                instrumentos = InstrumentoModel.listarInstrumentos()
                return render_template('instrumentos/listado_instrumentos.html',titulo=pat['titulo'], 
                descripcion=pat['descripcion'], habilitacion=pat['habilitacion'], paginacion=pat['paginacion'], 
                instrumentos = instrumentos) 
            else:
                InstrumentoModel.db = get_db()  
                f=request.files['imagen'].read()
                num_inventario=InstrumentoModel.find_by_numeroinventario(params['num_inventario'])
                if not num_inventario:    
                    InstrumentoModel.crearInstrumento(params,f)
                    flash("Instrumento dado de alta correctamente.")
                    return redirect(url_for('instrumentos_listado'))
                else:
                    tipo = InstrumentoModel.devolvertipos()
                    flash("Ya existe un intrumento registrado con ese numero de inventario, por favor ingresar otro.")
                    return render_template('instrumentos/alta_instrumento.html',titulo=pat['titulo'], descripcion=pat['descripcion'], tipo=tipo)
        else:
            flash("Usted no tiene permisos para realizar esta operacion")
            return render_template('instrumentos/alta_instrumento.html',titulo=pat['titulo'], descripcion=pat['descripcion'])
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def encondearbase64(filename):
	with open(filename, "rb") as image_file:
		return base64.b64encode(image_file.read())

def convertirabinario(filename):
	#Convert digital data to binary format
    thedata = open(filename, 'rb').read()
    return thedata


def eliminar_instrumento():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    InstrumentoModel.db = get_db()
    if 'user' in session.keys():
        if user.tiene_permiso("instrumento_destroy"):
            InstrumentoModel.eliminarInstrumento(request.form)
            flash("Instrumento eliminado")
            return redirect(url_for('instrumentos_listado'))
        else:
            instrumentos=InstrumentoModel.listarInstrumentos()
            flash("Usted no tiene permisos para ejecutar esa acción ")
            return render_template('instrumentos/listado_instrumentos.html',titulo=pat['titulo'],paginacion=pat['paginacion'],habilitacion=pat['habilitacion'], instrumentos=instrumentos)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def modificar_instrumento():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    InstrumentoModel.db = get_db()
    if 'user' in session.keys():
        if user.tiene_permiso("instrumento_update"):
            instrumentoUpdate = InstrumentoModel.datosdeinstrumento(request.form)
            imagen2 = instrumentoUpdate["foto"]
            imagen = base64.b64encode(imagen2).decode("utf-8")
            tipo = InstrumentoModel.devolvertipos()
            return render_template('instrumentos/modificar_instrumento.html', 
            instrumentoUpdate=instrumentoUpdate, titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion=pat['habilitacion'], tipo=tipo, imagen=imagen)
        else:
            instrumentos=InstrumentoModel.listarInstrumentos()
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('instrumentos/listado_instrumentos.html',titulo=pat['titulo'],paginacion=pat['paginacion'],habilitacion=pat['habilitacion'], instrumentos=instrumentos)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def guardarModificacion(): #Guarda las modificaciones realizadas sobre el instrumento
    InstrumentoModel.db = get_db()
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    params = request.form
    if 'user' in session.keys():
        if user.tiene_permiso("instrumento_update"):
            if validador.validarinstrumento(request.form) == False:
                flash("se ingreso un dato inesperado")
                instrumentos = InstrumentoModel.listarInstrumentos()
                return render_template('instrumentos/listado_instrumentos.html',titulo=pat['titulo'], 
                descripcion=pat['descripcion'], habilitacion=pat['habilitacion'], paginacion=pat['paginacion'], 
                instrumentos = instrumentos) 
            else:
             numinventario = InstrumentoModel.numInventarioDeUnInstrumento(request.form['id'])
             if numinventario['num_inventario'] != request.form['num_inventario']:
                 num_inventario=InstrumentoModel.find_by_numeroinventario(params['num_inventario'])
                 if num_inventario:
                     instrumentos=InstrumentoModel.listarInstrumentos()
                     flash("Ya existe un instrumento registrado con ese número de inventario, por favor ingresar otro.")
                     return render_template('instrumentos/listado_instrumentos.html',titulo=pat['titulo'],paginacion=pat['paginacion'],habilitacion=pat['habilitacion'], instrumentos=instrumentos)
             instrumentoUpdate = InstrumentoModel.modificarInstrumento(request.form)
             flash("Se modificó correctamente el instrumento")
             return redirect(url_for('instrumentos_listado', instrumentoUpdate=instrumentoUpdate))
        else:
            flash("Usted no tiene permisos para realizar esta operación")
            return render_template('user/homeUser.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def cambiar_foto():
    InstrumentoModel.db = get_db()
    Configuracion.db = get_db()
    if 'user' in session.keys():
        if user.tiene_permiso("instrumento_update"):
            pat = Configuracion.configurartitulo()[0]
            instrumentoUpdate = InstrumentoModel.datosdeinstrumento(request.form)
            imagen2 = instrumentoUpdate["foto"]
            imagen = base64.b64encode(imagen2).decode("utf-8")
            return render_template('instrumentos/modificar_foto.html', 
            instrumentoUpdate=instrumentoUpdate, titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion=pat['habilitacion'], imagen=imagen)
        else:
            flash("Usted no tiene permisos para realizar esta operación")
            return render_template('user/homeUser.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])



def guardarNuevaFoto():
    InstrumentoModel.db = get_db()
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("instrumento_update"):
            params = request.form
            f=request.files['imagen'].read()

            InstrumentoModel.modificarFoto(f,params['id'])

            flash('La foto se actualizó correctamente')
            return redirect(url_for('instrumentos_listado'))
           
        else:
            flash("Usted no tiene permisos para realizar esta operación")
            return render_template('user/homeUser.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])


