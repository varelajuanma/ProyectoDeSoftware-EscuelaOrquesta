from flask import redirect, render_template, request, url_for, abort, session, flash
from flaskps.db import get_db
from flaskps.models.user import User
from flaskps.models.configuracion import Configuracion
from flaskps.models.nucleo import Nucleo
from flaskps.models.ciclo import Ciclo
from flaskps.resources import user
from flaskps.resources import validador

def contacto():
    Configuracion.db = get_db()
    pat= Configuracion.configurartitulo()[0]
    return render_template('home/contacto.html',titulo=pat['titulo'], mailcontacto=pat['mailcontacto'])

def mapas():
    Configuracion.db = get_db()
    pat= Configuracion.configurartitulo()[0]
    Nucleo.db = get_db()
    listaDeNucleos=Nucleo.all()
    return render_template('home/mapa.html',titulo=pat['titulo'], mailcontacto=pat['mailcontacto'], listaDeNucleos=listaDeNucleos)

def alta_nucleo():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    Nucleo.db = get_db()
    if 'user' in session.keys():
        if user.tiene_permiso("nucleo_new"):
            return render_template('home/alta_nucleo.html',titulo=pat['titulo'], descripcion=pat['descripcion'])
        else:
            listaDeNucleos= Nucleo.all()
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('home/mapa.html',titulo=pat['titulo'], descripcion=pat['descripcion'], listaDeNucleos=listaDeNucleos)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def agregar_nucleo():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    Nucleo.db = get_db()
    if 'user' in session.keys():
        if user.tiene_permiso("nucleo_new"):
            params = request.form
            if validador.validaraltademapa(request.form) == False:
                flash("se ingreso un dato inesperado")
                listaDeNucleos= Nucleo.all()
                return render_template('home/mapa.html',titulo=pat['titulo'], descripcion=pat['descripcion'], listaDeNucleos=listaDeNucleos)
            else:
                params=request.form
                nombre=Nucleo.find_by_nombre(params['nombre'])
                if not nombre:
                    params=request.form
                    latitud=Nucleo.find_by_latitud(params['latitud'])
                    if not latitud:
                        longitud=Nucleo.find_by_longitud(params['longitud'])
                        if not longitud:
                            Nucleo.create(params)
                            flash("Nucleo dado de alta correctamente.")
                            return redirect(url_for('mapa'))
                        else:
                            flash("Ya existe un nucleo con esa longitud, por favor ingresar otro.")
                            return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
                    else:
                        flash("Ya existe un nucleo con esa latitud, por favor ingresar otro.")
                        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
                else:
                    flash("Ya existe un nucleo con ese nombre, por favor ingresar otro.")
                    return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
        else:
            listaDeNucleos= Nucleo.all()
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('home/mapa.html',titulo=pat['titulo'], descripcion=pat['descripcion'], listaDeNucleos=listaDeNucleos)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'])

def eliminar_nucleo():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    Nucleo.db = get_db()
    Ciclo.db = get_db()
    if 'user' in session.keys():
        if user.tiene_permiso("nucleo_destroy"):
            tallerNucleo=Ciclo.existeTallerEnNucleo(request.form['id'])
            if tallerNucleo:
                flash("No es posible eliminar este nucleo ya que se encuentra asociado a un taller")
                return redirect(url_for('mapa'))
            Nucleo.eliminarNucleo(request.form)
            flash("Nucleo eliminado")
            return redirect(url_for('mapa'))
        else:
            listaDeNucleos=Nucleo.all()
            flash("Usted no tiene permisos para ejecutar esa acción ")
            return render_template('home/mapa.html',titulo=pat['titulo'],habilitacion=pat['habilitacion'], listaDeNucleos=listaDeNucleos)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def modificar_nucleo():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    Nucleo.db = get_db()
    if 'user' in session.keys():
        if user.tiene_permiso("nucleo_update"):
            nucleoUpdate = Nucleo.datosdenucleo(request.form)
            return render_template('home/modificar_nucleo.html', nucleoUpdate=nucleoUpdate, titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
        else:
            listaDeNucleos=Nucleo.all()
            flash("Usted no tiene permisos para ejecutar esa acción ")
            return render_template('home/mapa.html',titulo=pat['titulo'],habilitacion=pat['habilitacion'], listaDeNucleos=listaDeNucleos)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def guardarModificacionesNucleo(): #Guarda las modificaciones realizadas sobre el estudiante
    Nucleo.db = get_db()
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("nucleo_update"):
             if validador.validaraltademapa(request.form) == False:
                flash("se ingreso un dato inesperado")
                listaDeNucleos= Nucleo.all()
                return render_template('home/mapa.html',titulo=pat['titulo'], descripcion=pat['descripcion'], listaDeNucleos=listaDeNucleos)
             else:
                nucleoUpdate = Nucleo.modificarNucleo(request.form)
                flash("Se modificó correctamente el nucleo")
                return redirect(url_for('mapa', nucleoUpdate=nucleoUpdate))
        else:
            listaDeNucleos=Nucleo.all()
            flash("Usted no tiene permisos para realizar esta operación")
            return render_template('home/mapa.html',titulo=pat['titulo'],habilitacion=pat['habilitacion'], listaDeNucleos=listaDeNucleos)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
