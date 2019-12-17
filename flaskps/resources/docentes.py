from flask import redirect, render_template, url_for, session, abort, flash, request
from flaskps.db import get_db
from flaskps.models.docentesModel import DocentesModel
from flaskps.models.ciclo import Ciclo
from flaskps.models.configuracion import Configuracion
from flaskps.helpers.auth import authenticated
from flaskps.resources import user
from flaskps.resources import validador
import json
import requests as rqs

def listar_docentes():
    if 'user' in session.keys():
        if user.tiene_permiso("docente_index"):
            Configuracion.db = get_db()
            pat= Configuracion.configurartitulo()[0]
            DocentesModel.db = get_db()
            docentes = DocentesModel.listarDocentes()
            return render_template('docentes/listado_docentes.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion=pat['habilitacion'], paginacion=pat['paginacion'], docentes = docentes)
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return redirect(url_for('auth_authenticate'))
    else:
    	Configuracion.db = get_db()
    	pat= Configuracion.configurartitulo()[0]
    	flash("Debes iniciar sesion para ver este contenido")
    	return render_template('home.html',titulo=pat['titulo'],
        descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def alta_docente():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("docente_new"):
            response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento')
            tiposDocumento = response.json()
            response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad')
            localidades = response.json()
            return render_template('docentes/nuevo_docente_form.html',titulo=pat['titulo'],
            descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],tiposDocumento = tiposDocumento,
            localidades = localidades)
        else:
            DocentesModel.db = get_db()
            docentes = DocentesModel.listarDocentes()
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('docentes/listado_docentes.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion=pat['habilitacion'],docentes=docentes)
    else:
    	flash("Debes iniciar sesion para ver este contenido")
    	return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
        habilitacion=pat['habilitacion'])

def crear_docente():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("docente_new"):
         if validador.validardatodocente(request.form) == False:
             response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento')
             tiposDocumento = response.json()
             response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad')
             localidades = response.json()
             flash("Ingresaste un dato inesperado")
             return render_template('docentes/nuevo_docente_form.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],tiposDocumento = tiposDocumento, localidades = localidades)
         else:
            params = request.form
            DocentesModel.db = get_db()
            numerodni=DocentesModel.find_by_numerodni(params['doc'])
            if not numerodni:
                DocentesModel.agregar_docente(request.form)
                flash("El docente se agregó correctamente.")
                return redirect(url_for('docentes_listado'))
            else:
            	response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento')
            	tiposDocumento = response.json()
            	response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad')
            	localidades = response.json()
            	flash("Ya existe un docente registrado con ese numero de DNI, por favor ingresar otro.")
            	return render_template('docentes/nuevo_docente_form.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],tiposDocumento = tiposDocumento, localidades = localidades)
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('user/homeUser.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion=pat['habilitacion'])
    else:
    	flash("Debes iniciar sesion para ver este contenido")
    	return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
        habilitacion=pat['habilitacion'])

def baja_docente():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    Ciclo.db = get_db()
    if 'user' in session.keys():
        if user.tiene_permiso("docente_destroy"):
            noBorrable = False
            talleresDoc = Ciclo.talleresDeLosQueSeResponsabiliza(request.form['id'])
            for taller in talleresDoc:
                cantDocentes = Ciclo.cantDocentesResponsables(taller['taller_id'])
                if cantDocentes['COUNT(docente_id)'] == 1:
                    noBorrable = True
            if noBorrable:
                flash("No se puede borrar este docente porque es único responsable en un taller.")
                DocentesModel.db = get_db()
                docentes = DocentesModel.listarDocentes()
                return render_template('docentes/listado_docentes.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
                habilitacion=pat['habilitacion'],paginacion=pat['paginacion'],docentes=docentes)
            else:
                Configuracion.db = get_db()
                DocentesModel.db = get_db()
                DocentesModel.eliminarDocente(request.form)
                flash("El Docente se eliminó correctamente")
                return redirect(url_for('docentes_listado'))
        else:
            DocentesModel.db = get_db()
            docentes = DocentesModel.listarDocentes()
            flash("Usted no tiene permisos para ejecutar esa acción ")
            return render_template('docentes/listado_docentes.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion=pat['habilitacion'],docentes=docentes)
    else:
    	flash("Debes iniciar sesion para ver este contenido")
    	return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
        habilitacion=pat['habilitacion'])

def detalle_docente():
    if 'user' in session.keys():
        if user.tiene_permiso("docente_show"):
            Configuracion.db = get_db()
            pat= Configuracion.configurartitulo()[0]
            DocentesModel.db = get_db()
            docente = DocentesModel.detalleDocente(request.form)
            id_localidad = docente['localidad_id']
            localidad = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad/'+ str(id_localidad)).json()
            id_tipo_doc = docente['tipo_doc_id']
            tipo_documento = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento/' + str(id_tipo_doc)).json()
            return render_template('docentes/detalle_docente.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion=pat['habilitacion'], docente = docente, localidad = localidad['nombre'],
            tipoDocumento = tipo_documento['nombre'])
        else:
            Configuracion.db = get_db()
            pat= Configuracion.configurartitulo()[0]
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('user/homeUser.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion=pat['habilitacion'])
    else:
    	Configuracion.db = get_db()
    	pat= Configuracion.configurartitulo()[0]
    	flash("Debes iniciar sesion para ver este contenido")
    	return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
        habilitacion=pat['habilitacion'])

def modificar_docente_form():
    if 'user' in session.keys():
        Configuracion.db = get_db()
        pat= Configuracion.configurartitulo()[0]
        if user.tiene_permiso("docente_update"):
            Configuracion.db = get_db()
            pat= Configuracion.configurartitulo()[0]
            DocentesModel.db = get_db()
            docente = DocentesModel.detalleDocente(request.form)
            tiposDocumentoList = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento').json()
            localidadesList = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad').json()
            id_localidad = docente['localidad_id']
            localidadActual = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad/'+ str(id_localidad)).json()
            id_tipo_doc = docente['tipo_doc_id']
            tipo_documento_actual = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento/' + str(id_tipo_doc)).json()
            generosList = DocentesModel.get_generos()
            return render_template('docentes/modificar_docente.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion=pat['habilitacion'], docente = docente, tiposDocumentoList = tiposDocumentoList,
            localidadesList = localidadesList, generosList = generosList, localidadActual = localidadActual,
            tipo_documento_actual = tipo_documento_actual)
        else:
            DocentesModel.db = get_db()
            docentes = DocentesModel.listarDocentes()
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('docentes/listado_docentes.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
            habilitacion=pat['habilitacion'],docentes=docentes)
    else:
    	Configuracion.db = get_db()
    	pat= Configuracion.configurartitulo()[0]
    	flash("Debes iniciar sesion para ver este contenido")
    	return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
        habilitacion=pat['habilitacion'])

def modificar_docente():
    if user.tiene_permiso("docente_update"):
        Configuracion.db = get_db()
        DocentesModel.db = get_db()
        params = request.form
        if validador.validardatodocente(request.form) == False:
            flash("ingrsaste un dato inesperado")
            return  redirect(url_for('docentes_listado'))
        dni = DocentesModel.dniDeUnDocente(request.form['id'])
        if dni['numero'] != int(request.form['doc']):
            numerodni = DocentesModel.find_by_numerodni(params['doc'])
            if numerodni:
                flash("Ya existe un docente registrado con ese numero de DNI, por favor ingresar otro.")
                return  redirect(url_for('docentes_listado'))
        docenteUpdate = DocentesModel.update_docente(request.form)
        flash("Se modificó correctamente el docente")
        return redirect(url_for('docentes_listado', docenteUpdate=docenteUpdate))
    else:
        Configuracion.db = get_db()
        pat= Configuracion.configurartitulo()[0]
        flash("Usted no tiene permisos para ver este contenido")
        return render_template('user/homeUser.html',titulo=pat['titulo'], descripcion=pat['descripcion'],
        habilitacion=pat['habilitacion'])

def volver():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    return render_template('user/homeDocente.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
