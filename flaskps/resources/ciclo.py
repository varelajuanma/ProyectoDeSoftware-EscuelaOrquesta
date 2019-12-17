from flask import redirect, render_template, request, url_for, session, abort, flash
from flaskps.db import get_db
from flaskps.models.user import User
from flaskps.models.configuracion import Configuracion
from flaskps.models.ciclo import Ciclo
from flaskps.helpers.auth import authenticated
from flaskps.resources import user
import requests
import json
from datetime import date


def mostrarciclo():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_index"):
			Ciclo.db = get_db()
			ciclos = Ciclo.listarciclos()
			ciclos_talleres = Ciclo.traerCiclos()
			return render_template('ciclos/menuciclo.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],ciclos=ciclos,ciclos_talleres=ciclos_talleres)
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def listartalleres(idciclo):
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_index"):
			Ciclo.db = get_db()
			docentes=Ciclo.devolverdocente()
			talleres = Ciclo.listartaller()
			idciclo = Ciclo.datosDeUnCiclo(idciclo)
			dias = Ciclo.diasDeLaSemana()
			nucleos = Ciclo.listarNucleos()
			return render_template('ciclos/agregarTaller.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'], talleres=talleres,docentes=docentes, idciclo=idciclo,dias=dias,nucleos=nucleos)
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def cargarciclo():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_new"):
			return render_template('ciclos/formulariociclo.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def insertar():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_new"):
			if request.form['fecha_ini'] >= request.form['fecha_fin']:
				flash("La fecha de inicio no puede ser mayor o igual a la fecha de fin")
				return render_template('ciclos/formulariociclo.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
			if not fechasEnSemestre(request.form):
				flash("Las fechas no coincide con el semestre ingresado")
				return render_template('ciclos/formulariociclo.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
			Ciclo.db = get_db()
			Ciclo.insertarciclo(request.form)
			flash("El ciclo se creo correctamente")
			return redirect(url_for('ciclo_list'))
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def fechasEnSemestre(form):
	mesInicio = form['fecha_ini'].split("-")[1]
	mesFin = form['fecha_fin'].split("-")[1]
	if form['semestre'] == "1":
		if int(mesInicio) > 6 or int(mesFin) > 6 :
			return False
		return True
	else:
		if int(mesInicio) < 6 or int(mesFin) < 6 :
			return False
		return True

def insertartaller():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_new"):
			Ciclo.db = get_db()
			docentes=Ciclo.devolverdocente()
			talleres = Ciclo.listartaller()
			idciclo = Ciclo.datosDeUnCiclo(request.form['idciclo'])
			taller = Ciclo.existeTallerEnCiclo(request.form['idtaller'],request.form['idciclo'])
			if taller:
				dias = Ciclo.diasDeLaSemana()
				nucleos = Ciclo.listarNucleos()
				flash ("El taller ya existe en ese ciclo lectivo")
				return render_template('ciclos/agregarTaller.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'], talleres=talleres,docentes=docentes, idciclo=idciclo,dias=dias,nucleos=nucleos)
			else:
				multiselect = request.form.getlist('multiselect')
				Ciclo.insertartaller(request.form['idtaller'],request.form['idciclo'],multiselect,request.form['idDia'],request.form['idnucleo'])
				flash("Se agrego correctamente el taller")
				return listar_talleresCiclo(request.form['idciclo'])
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def listarestudiante(idciclo,idtaller):
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_index"):
			Ciclo.db = get_db()
			aux=Ciclo.devolverestudiante()
			idciclo=Ciclo.datosDeUnCiclo(idciclo)
			idtaller=Ciclo.datosDeUnTaller(idtaller)
			return render_template('ciclos/estudiantetaller.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],aux=aux,idciclo=idciclo,idtaller=idtaller)
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def listardocente(idciclo,idtaller):
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_index"):
			Ciclo.db = get_db()
			aux=Ciclo.devolverdocente()
			idciclo=Ciclo.datosDeUnCiclo(idciclo)
			idtaller=Ciclo.datosDeUnTaller(idtaller)
			return render_template('ciclos/docentetaller.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],aux=aux,idciclo=idciclo,idtaller=idtaller)
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def insertdocente():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_new"):
			Ciclo.db = get_db()
			multiselect = request.form.getlist('multiselect')
			reply = Ciclo.insertdocente(request.form['idtaller'],request.form['idciclo'],multiselect)

			idciclo=Ciclo.datosDeUnCiclo(request.form['idciclo'])
			idtaller=Ciclo.datosDeUnTaller(request.form['idtaller'])
			if not reply:
				flash("Se agrego el/los docente/s")
				return verUsuariosTaller(request.form['idtaller'],request.form['idciclo'])
			else:
				lista=[]
				for r in reply:
					lista.append(Ciclo.emailDocente(r))
				if (len(lista) == 1):
					a = str(lista).strip('[]')
					a = str(a).strip("''")
					flash ("El docente " + a + " ya esta en ese taller")
				else:
					a =""
					aux=""
					for ele in lista:
						aux = str(ele).strip('[]')
						a += str(aux).strip("''") + ","
					flash ("Los docentes " + a +	" ya estan en ese taller")
				aux=Ciclo.devolverdocente()
				return render_template('ciclos/docentetaller.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],aux=aux,idciclo=idciclo,idtaller=idtaller)
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def insertestudiante():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_new"):
			Ciclo.db = get_db()
			aux=Ciclo.devolverestudiante()
			idciclo=Ciclo.datosDeUnCiclo(request.form['idciclo'])
			idtaller=Ciclo.datosDeUnTaller(request.form['idtaller'])
			reply = Ciclo.insertestudiante(request.form['idtaller'],request.form['idciclo'],request.form['idestudiante'])
			if reply == False:
				flash ("El alumno ya se encuentra en ese taller")
				return render_template('ciclos/estudiantetaller.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'],idciclo=idciclo,idtaller=idtaller,aux=aux)
			else:
				flash("Se agrego el estudiante correctamente")
				return verUsuariosTaller(request.form['idtaller'],request.form['idciclo'])
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def verUsuariosTaller(id,cId):
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_index"):
			Ciclo.db = get_db();
			taller = Ciclo.nombreTaller(id)
			docentes = Ciclo.docentesDeUnTaller(id,cId)
			estudiantes = Ciclo.estudiantesDeUnTaller(id,cId)
			id_taller = id
			cId = cId
			from datetime import date
			today = date.today()
			cicloTerminado = Ciclo.compararFechas(cId)
			return render_template('ciclos/usuariosTaller.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'],docentes=docentes,estudiantes=estudiantes,taller=taller,id_taller=id_taller,cId=cId,cicloTerminado = cicloTerminado)
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def borrarEstudiante():
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_destroy"):
			Ciclo.db = get_db();
			Ciclo.borrarEstudiante(request.form['id'],request.form['idtaller'],request.form['idCiclo'])
			flash("Se borro el estudiante correctamente")
			return verUsuariosTaller(request.form['idtaller'],request.form['idCiclo'])
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def borrarDocente():
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_destroy"):
			Ciclo.db = get_db()
			noBorrable = False
			talleresDoc = Ciclo.talleresDeLosQueSeResponsabiliza(request.form['id_docente'])
			for taller in talleresDoc:
				cantDocentes = Ciclo.cantDocentesResponsables(taller['taller_id'])
				if cantDocentes['COUNT(docente_id)'] == 1:
					noBorrable = True
			if noBorrable:
				flash("No se puede borrar este docente porque es único responsable en un taller.")
				return redirect(url_for('ciclo_list'))
			else:
				Ciclo.db = get_db()
				Ciclo.borrarDocente(request.form['id_docente'],request.form['idtaller'],request.form['idCiclo'])
				flash("Se borro el docente correctamente")
				return verUsuariosTaller(request.form['idtaller'],request.form['idCiclo'])
		else:
			Configuracion.db = get_db()
			pat=Configuracion.configurartitulo()[0]
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		Configuracion.db = get_db()
		pat=Configuracion.configurartitulo()[0]
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def borrarTaller():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_destroy"):
			Ciclo.db = get_db();
			docentes = Ciclo.docentesDeUnTaller(request.form['tallerid'],request.form['cicloid'])
			estudiantes = Ciclo.estudiantesDeUnTaller(request.form['tallerid'],request.form['cicloid'])
			if estudiantes != None :
				for estudiante in estudiantes:
					Ciclo.borrarEstudiante(estudiante['id'],request.form['tallerid'],request.form['cicloid'])
			if docentes != None :
				for docente in docentes:
					Ciclo.borrarDocente(docente['id'],request.form['tallerid'],request.form['cicloid'])
			pat=Configuracion.configurartitulo()[0]
			Ciclo.borrarTaller(request.form)
			flash ("Se borró correctamente el taller")
			id = request.form['cicloid']
			talleres = Ciclo.talleresDeUnCiclo(id)
			datos = Ciclo.datosDeUnCiclo(id)
			return render_template('ciclos/talleresCiclo.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],talleres=talleres,datos=datos)
			return
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def talleresBorrado():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_index"):
			Ciclo.db = get_db()
			ciclos = Ciclo.traerCiclos()
			return render_template('ciclos/borrarTaller.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],ciclos=ciclos)
		else:
			flash("Usted no tiene permisos para ver este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
def modificarCiclo(id):
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_update"):
			Ciclo.db = get_db()
			datos = Ciclo.datosDeUnCiclo(id)
			return render_template('ciclos/modificarCiclo.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],datos = datos)
		else:
			flash("Usted no tiene permisos acceder a este contenido")
			return render_template('home.html',titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def borrarCiclo():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_destroy"):
			Ciclo.db = get_db()
			Ciclo.borrarCiclo(request.form)
			flash("Se borro el ciclo correctamente")
			return redirect(url_for('ciclo_list'))
		else:
			flash("Usted no tiene permisos para realizar esta acción")
			return redirect(url_for('ciclo_list'))
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def guardarModificacion():
	Configuracion.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_update"):
			if request.form['fecha_ini'] >= request.form['fecha_fin']:
				flash("La fecha de inicio no puede ser mayor o igual a la fecha de fin")
				return redirect(url_for('modificarCiclo', id=request.form['id']))
			if not fechasEnSemestre(request.form):
				flash("Las fechas no coincide con el semestre ingresado")
				return redirect(url_for('modificarCiclo',id=request.form['id']))
			Ciclo.db = get_db()
			Ciclo.guardarModificacionCiclo(request.form)
			ciclos = Ciclo.listarciclos()
			ciclos_talleres = Ciclo.traerCiclos()
			talleres = Ciclo.listartaller()
			flash("Se modifico el ciclo correctamente")
			return render_template('ciclos/menuciclo.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],ciclos=ciclos,talleres=talleres,ciclos_talleres=ciclos_talleres)
		else:
			flash("Usted no tiene permisos para realizar esta acción")
			return redirect(url_for('ciclo_list'))
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
def listar_talleresCiclo(id):
	Configuracion.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_index"):
			Ciclo.db = get_db()
			talleres = Ciclo.talleresDeUnCiclo(id)
			datos = Ciclo.datosDeUnCiclo(id)
			from datetime import date
			today = date.today()
			cicloTerminado = Ciclo.compararFechas(id)
			return render_template('ciclos/talleresCiclo.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],talleres=talleres,datos=datos,cicloTerminado = cicloTerminado)
		else:
			flash("Usted no tiene permisos para realizar esta acción")
			return redirect(url_for('ciclo_list'))
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
def ciclosPasados():
	Configuracion.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_index"):
			Ciclo.db = get_db()
			ciclosPasados = Ciclo.ciclosPasados()
			return render_template('ciclos/ciclosPasados.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],ciclosPasados = ciclosPasados)
		else:
			flash("Usted no tiene permisos para realizar esta acción")
			return redirect(url_for('ciclo_list'))
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
def volverTalleresCiclo(id):
	from datetime import date
	today = date.today()
	Configuracion.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	Ciclo.db = get_db()
	reply = Ciclo.compararFechas(id)
	if reply:
		return redirect(url_for('mostrarCiclosPasados'))
	else:
		return redirect(url_for('ciclo_list'))
def devolverLugaresYdias(id,cicloId):
	Configuracion.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_index"):
			Ciclo.db = get_db()
			nucleos_dias = Ciclo.devolverNucleo_dia(id,cicloId)
			nombreTaller = Ciclo.nombreTaller(id)
			cicloTerminado = Ciclo.compararFechas(cicloId)
			taller_id = id
			ciclo_id = cicloId
			return render_template('ciclos/lugares_dias.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],nucleos_dias = nucleos_dias,nombreTaller=nombreTaller,taller_id = taller_id,ciclo_id = ciclo_id,cicloTerminado = cicloTerminado)
		else:
			flash("Usted no tiene permisos para realizar esta acción")
			return redirect(url_for('ciclo_list'))
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def formularioDia_lugar():
	Configuracion.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_update"):
			Ciclo.db = get_db()
			nucleos = Ciclo.listarNucleos()
			dias = Ciclo.diasDeLaSemana()
			ciclo_id = request.form['ciclo_id']
			taller_id = request.form['taller_id']
			diaSeleccionado = request.form['dia_id']
			nucleoSeleccionado = request.form['nucleo_id']
			return render_template('ciclos/modificarLugar_dia.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],dias=dias,nucleos=nucleos,diaSeleccionado = diaSeleccionado,nucleoSeleccionado = nucleoSeleccionado,ciclo_id = ciclo_id, taller_id = taller_id)
		else:
			flash("Usted no tiene permisos para realizar esta acción")
			return redirect(url_for('ciclo_list'))
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def modificarDia_lugar():
	Configuracion.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	Ciclo.db = get_db()
	id = request.form['taller_id']
	cicloId = request.form['ciclo_id']
	respuesta = Ciclo.existeDiaEnNucleo(request.form['idnucleo'],request.form['idDia'],id,cicloId)
	if respuesta:
		nucleos = Ciclo.listarNucleos()
		dias = Ciclo.diasDeLaSemana()
		diaSeleccionado = request.form['diaAnterior']
		nucleoSeleccionado = request.form['nucleoAnterior']
		flash ("Ya se dicta un taller ese dia en ese lugar")
		return render_template('ciclos/modificarLugar_dia.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],dias=dias,nucleos=nucleos,diaSeleccionado = diaSeleccionado,nucleoSeleccionado = nucleoSeleccionado,ciclo_id = cicloId, taller_id = id)
	Ciclo.modificarDia_lugar(request.form)
	nucleos_dias = Ciclo.devolverNucleo_dia(id,cicloId)
	nombreTaller = Ciclo.nombreTaller(id)
	flash ("Se modifico correctamente","success")
	cicloTerminado = Ciclo.compararFechas(cicloId)
	return render_template('ciclos/lugares_dias.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],nucleos_dias = nucleos_dias,nombreTaller=nombreTaller,taller_id = id,ciclo_id = cicloId,cicloTerminado = cicloTerminado)

def formAgregarDia_lugar(id,ciclo_id):
	Configuracion.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		if user.tiene_permiso("ciclo_new"):
			Ciclo.db = get_db()
			taller_id = id
			ciclo_id = ciclo_id
			nucleos = Ciclo.listarNucleos()
			dias = Ciclo.diasDeLaSemana()
			return render_template('ciclos/agregarDia_lugar.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],dias=dias,nucleos=nucleos,ciclo_id = ciclo_id, taller_id = taller_id)
		else:
			flash("Usted no tiene permisos para realizar esta acción")
			return redirect(url_for('ciclo_list'))
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def agregarDia_lugar():
	Configuracion.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	Ciclo.db = get_db()
	id = request.form['taller_id']
	cicloId = request.form['ciclo_id']
	respuesta = Ciclo.existeDiaEnNucleo(request.form['idnucleo'],request.form['idDia'],id,cicloId)
	if respuesta:
		nucleos = Ciclo.listarNucleos()
		dias = Ciclo.diasDeLaSemana()
		flash ("Ya se dicta este taller ese dia en ese lugar")
		return render_template('ciclos/agregarDia_lugar.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],dias=dias,nucleos=nucleos,ciclo_id = cicloId, taller_id = id)
	else:
		Ciclo.agregarDia_lugar(request.form)
		nucleos_dias = Ciclo.devolverNucleo_dia(id,cicloId)
		nombreTaller = Ciclo.nombreTaller(id)
		flash ("Se agrego correctamente","success")
		cicloTerminado = Ciclo.compararFechas(cicloId)
		return render_template('ciclos/lugares_dias.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],nucleos_dias = nucleos_dias,nombreTaller=nombreTaller,taller_id = id,ciclo_id = cicloId,cicloTerminado = cicloTerminado)

def borrarDia_lugar():
	Configuracion.db = get_db()
	pat = Configuracion.configurartitulo()[0]
	Ciclo.db = get_db()
	id = request.form['taller_id']
	cicloId = request.form['ciclo_id']
	result = Ciclo.devolverNucleo_dia(id,cicloId)
	if len(result) > 1:
		Ciclo.borrarDia_lugar(request.form)
		flash ("Se borró correctamente","success")
	else:
		flash ("No se puede borrar por ser el único lugar y dia que se dicta el taller","danger")
	nucleos_dias = Ciclo.devolverNucleo_dia(id,cicloId)
	nombreTaller = Ciclo.nombreTaller(id)
	cicloTerminado = Ciclo.compararFechas(cicloId)
	return render_template('ciclos/lugares_dias.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],nucleos_dias = nucleos_dias,nombreTaller=nombreTaller,taller_id = id,ciclo_id = cicloId,cicloTerminado = cicloTerminado)
