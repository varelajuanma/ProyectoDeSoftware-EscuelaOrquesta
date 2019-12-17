from flask import redirect, render_template,  url_for, session, abort, flash, request
from flaskps.db import get_db
from flaskps.models.user import User
from flaskps.models.estudiante import Estudiante
from flaskps.models.configuracion import Configuracion
from flaskps.helpers.auth import authenticated
from flaskps.resources import user
from flaskps.resources import validador
import json
import requests as rqs

def alta_estudiante(): #Este controlador te lleva al formulario para dar de alta un estudiante
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("estudiante_new"):
            response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento') #ACA ESTOY TOMANDO LOS DATOS DE UNA API
            aux_tipodoc = response.json() #ACA LO ESTOY GUARDANDO EN UNA VARIABLE PARA LUEGO USARLOS
            response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad')
            aux_localidad = response.json()
            Estudiante.db = get_db()
            barrio=Estudiante.devolverbarrios()
            escuela=Estudiante.devolverescuelas()
            nivel=Estudiante.devolverniveles()
            genero=Estudiante.devolvergeneros()
            responsableacargo=Estudiante.devolverresponsableacargo()
            return render_template('estudiantes/alta_estudiante.html',titulo=pat['titulo'], descripcion=pat['descripcion'], barrio=barrio, escuela=escuela, nivel=nivel, genero=genero, responsableacargo=responsableacargo, aux_tipodoc=aux_tipodoc, aux_localidad=aux_localidad)
        else:
            Estudiante.db = get_db()
            lista_estud=Estudiante.all()
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('estudiantes/estudiante_listado.html',titulo=pat['titulo'], descripcion=pat['descripcion'],lista_estud=lista_estud )
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def datos_estudiante(): #Este controlador muestra el detalle de datos del estudiante -> boton "Ver mas datos"
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("estudiante_show"):
            Estudiante.db = get_db()
            estudianteUpdate = Estudiante.datosdeestudiante(request.form)
            iddoc = int(estudianteUpdate[0]['tipo_doc_id'])
            idloca = int(estudianteUpdate[0]['localidad_id'])
            response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento/'+str(iddoc)) #ACA ESTOY TOMANDO LOS DATOS DE UNA API
            aux_tipodoc = response.json() #ACA LO ESTOY GUARDANDO EN UNA VARIABLE PARA LUEGO USARLOS
            response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad/'+str(idloca))
            aux_localidad = response.json()
            barrio=Estudiante.devolverbarrios()
            escuela=Estudiante.devolverescuelas()
            nivel=Estudiante.devolverniveles()
            genero=Estudiante.devolvergeneros()
            responsableacargo=Estudiante.devolverresponsableacargo()
            idlocalidad= str(estudianteUpdate[0]['localidad_id'])
            idtipodoc =str(estudianteUpdate[0]['tipo_doc_id'])
            idbarrio=Estudiante.macheodeestudianteconbarrio(request.form)
            idescuela=Estudiante.macheodeestudianteconescuela(request.form)
            idnivel = Estudiante.macheodeestudianteconivel(request.form)
            idgenero = Estudiante.macheodeestudiantecongenero(request.form)
            return render_template('estudiantes/datos_estudiante.html',titulo=pat['titulo'], descripcion=pat['descripcion'], estudianteUpdate=estudianteUpdate, barrio=barrio, escuela=escuela, nivel=nivel, genero=genero, responsableacargo=responsableacargo, aux_tipodoc=aux_tipodoc, aux_localidad=aux_localidad,idbarrio=idbarrio,idescuela=idescuela,idnivel=idnivel,idgenero=idgenero,idlocalidad=idlocalidad,idtipodoc=idtipodoc)
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('estudiantes/estudiante_listado.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def agregar_estudiante(): #Este controlador toma los datos cargados en el formulario de alta
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("estudiante_new"):
           if validador.validardatosestudiante(request.form) == False:
               response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento') #ACA ESTOY TOMANDO LOS DATOS DE UNA API
               aux_tipodoc = response.json() #ACA LO ESTOY GUARDANDO EN UNA VARIABLE PARA LUEGO USARLOS
               response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad')
               aux_localidad = response.json()
               barrio=Estudiante.devolverbarrios()
               escuela=Estudiante.devolverescuelas()
               nivel=Estudiante.devolverniveles()
               genero=Estudiante.devolvergeneros()
               responsableacargo=Estudiante.devolverresponsableacargo()
               flash("Ingresaste datos invalidos")
               return render_template('estudiantes/alta_estudiante.html',titulo=pat['titulo'], descripcion=pat['descripcion'], barrio=barrio, escuela=escuela, nivel=nivel, genero=genero, responsableacargo=responsableacargo, aux_tipodoc=aux_tipodoc, aux_localidad=aux_localidad)
           else:
               params = request.form
               Estudiante.db = get_db()
               numerodni=Estudiante.find_by_numerodni(params['numero'])
               if not numerodni:
                   Estudiante.create(params)
                   flash("Estudiante dado de alta correctamente.")
                   return redirect(url_for('estudiante_listado'))
               else:
                   response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento') #ACA ESTOY TOMANDO LOS DATOS DE UNA API
                   aux_tipodoc = response.json() #ACA LO ESTOY GUARDANDO EN UNA VARIABLE PARA LUEGO USARLOS
                   response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad')
                   aux_localidad = response.json()
                   barrio=Estudiante.devolverbarrios()
                   escuela=Estudiante.devolverescuelas()
                   nivel=Estudiante.devolverniveles()
                   genero=Estudiante.devolvergeneros()
                   responsableacargo=Estudiante.devolverresponsableacargo()
                   flash("Ya existe un estudiante registrado con ese numero de DNI, por favor ingresar otro.")
                   return render_template('estudiantes/alta_estudiante.html',titulo=pat['titulo'], descripcion=pat['descripcion'], barrio=barrio, escuela=escuela, nivel=nivel, genero=genero, responsableacargo=responsableacargo, aux_tipodoc=aux_tipodoc, aux_localidad=aux_localidad)
        else:
            flash("Usted no tiene permisos para realizar esta operacion")
            return render_template('estudiantes/alta_estudiante.html',titulo=pat['titulo'], descripcion=pat['descripcion'])
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def listarEstudiantes(): #Este controlador muestra el formulario de listado de estudiantes
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("estudiante_index"):
            Estudiante.db = get_db()
            lista_estud=Estudiante.all()
            return render_template('estudiantes/estudiante_listado.html',titulo=pat['titulo'],paginacion=pat['paginacion'],habilitacion=pat['habilitacion'], lista_estud=lista_estud)
        else:
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def eliminar_estudiante():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("estudiante_destroy"):
            Estudiante.db = get_db()
            Estudiante.eliminarEstudiante(request.form)
            flash("Estudiante eliminado")
            return redirect(url_for('estudiante_listado'))
        else:
            Estudiante.db = get_db()
            lista_estud=Estudiante.all()
            flash("Usted no tiene permisos para ejecutar esa acción ")
            return render_template('estudiantes/estudiante_listado.html',titulo=pat['titulo'],paginacion=pat['paginacion'],habilitacion=pat['habilitacion'], lista_estud=lista_estud)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def modificar_estudiante():
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    if 'user' in session.keys():
        if user.tiene_permiso("estudiante_update"):
            Estudiante.db = get_db()
            estudianteUpdate = Estudiante.datosdeestudiante(request.form)
            response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/tipo-documento') #ACA ESTOY TOMANDO LOS DATOS DE UNA API
            aux_tipodoc = response.json() #ACA LO ESTOY GUARDANDO EN UNA VARIABLE PARA LUEGO USARLOS
            response = rqs.get('https://api-referencias.proyecto2019.linti.unlp.edu.ar/localidad')
            aux_localidad = response.json()
            barrio=Estudiante.devolverbarrios()
            escuela=Estudiante.devolverescuelas()
            nivel=Estudiante.devolverniveles()
            genero=Estudiante.devolvergeneros()
            responsableacargo=Estudiante.devolverresponsableacargo()
            idlocalidad= str(estudianteUpdate[0]['localidad_id'])
            idtipodoc =str(estudianteUpdate[0]['tipo_doc_id'])
            idbarrio=Estudiante.macheodeestudianteconbarrio(request.form)[0]['barrio_id']
            idescuela=Estudiante.macheodeestudianteconescuela(request.form)[0]['escuela_id']
            idnivel = Estudiante.macheodeestudianteconivel(request.form)[0]['nivel_id']
            idgenero = Estudiante.macheodeestudiantecongenero(request.form)[0]['genero_id']
            return render_template('estudiantes/modificarEstudiante.html', estudianteUpdate=estudianteUpdate, titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'], barrio=barrio, escuela=escuela, nivel=nivel, genero=genero, responsableacargo=responsableacargo, aux_localidad=aux_localidad, aux_tipodoc=aux_tipodoc,idbarrio=idbarrio,idescuela=idescuela,idnivel=idnivel,idgenero=idgenero,idlocalidad=idlocalidad,idtipodoc=idtipodoc)
        else:
            Estudiante.db = get_db()
            lista_estud=Estudiante.all()
            flash("Usted no tiene permisos para ver este contenido")
            return render_template('estudiantes/estudiante_listado.html',titulo=pat['titulo'],paginacion=pat['paginacion'],habilitacion=pat['habilitacion'], lista_estud=lista_estud)
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def guardarModificacionesEstudiante(): #Guarda las modificaciones realizadas sobre el estudiante
    Estudiante.db = get_db()
    Configuracion.db = get_db()
    pat = Configuracion.configurartitulo()[0]
    params = request.form
    if 'user' in session.keys():
        if user.tiene_permiso("estudiante_update"):
          if validador.validardatosestudiante(request.form) == False:
             flash("Ingresaste datos invalidos")
             return  redirect(url_for('estudiante_listado'))
          dni = Estudiante.dniDeUnEstudiante(request.form['id'])
          if dni['numero'] == int(request.form['numero']):
              estudianteUpdate = Estudiante.modificar(request.form)
              flash ("Se modifico el estudiante")
              return redirect(url_for('estudiante_listado', estudianteUpdate=estudianteUpdate))
          numerodni = Estudiante.find_by_numerodni(request.form['numero'])
          if not numerodni:
              estudianteUpdate = Estudiante.modificar(request.form)
              return redirect(url_for('estudiante_listado', estudianteUpdate=estudianteUpdate))
          else:
              lista_estud=Estudiante.all()
              flash("Ya existe un estudiante registrado con ese numero de DNI, por favor ingresar otro.")
              return render_template('estudiantes/estudiante_listado.html',titulo=pat['titulo'],paginacion=pat['paginacion'],habilitacion=pat['habilitacion'], lista_estud=lista_estud)
        else:
            flash("Usted no tiene permisos para realizar esta operacion")
            return redirect(url_for('auth_authenticate'))
    else:
        flash("Debes iniciar sesion para ver este contenido")
        return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
