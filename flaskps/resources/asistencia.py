from flask import redirect, render_template,  url_for, session, abort, flash, request
from flaskps.db import get_db
from flaskps.models.user import User
from flaskps.models.estudiante import Estudiante
from flaskps.models.configuracion import Configuracion
from flaskps.models.asistencia import Asistencia
from flaskps.helpers.auth import authenticated
from flaskps.resources import user
from flaskps.resources import validador
import json
from datetime import date, datetime
def listartalleresparadocente(id):
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		Asistencia.db = get_db()
		iddocente=Asistencia.listariddocente(id)
		id = iddocente['id']
		talleres=Asistencia.listartalleres(id)
		return  render_template('asistencia/listadotallerdocente.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],talleres=talleres,iddocente=iddocente)
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])

def estudiante():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		param=request.form
		Asistencia.db = get_db()
		usuarios= Asistencia.recuperarusuariostaller(param['tallerid'],param['cicloid'])
		taller = Asistencia.nombretaller(param['tallerid'])
		return render_template('asistencia/listadotallerestudiante.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],taller=taller,usuarios=usuarios,cicloid = param['cicloid'],tallerid = param['tallerid'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
def insertasistencia():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		param=request.form
		idtaller=param['idtaller']
		Asistencia.db = get_db()
		idciclolectivo=Asistencia.recuperarciclolectivo(param['idtaller'])
		idciclo = param['idciclo']
		idtaller=param['idtaller'] ## aca tengo el id del taller
		listaestudiante=param.getlist('asistencia')
		today = date.today()
		diadesemana=casteartoday(today) ##recupero el dia de hoy en base a una fecha
		result=Asistencia.deolverrespuesta(diadesemana,idtaller)[0]
		if ( result['COUNT(ciclo_lectivo_id)']) == 0:
			flash("No pa le erraste de dia.","danger")
			return render_template('user/homeDocente.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
		else:
		  aux=str(today) +' ' +  '00:00:00'
		  prueba=Asistencia.verificarexistencia(aux,idtaller,idciclo)[0]
		  if (prueba['COUNT(id)']) > 0:
		  	flash("No, hoy ya pasaste asistencia.","danger")
		  	return render_template('user/homeDocente.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
		  else:
		  	if len(listaestudiante) > 0: # entro al for sino el else
		  		print("llegamoooo")
		  		for i in listaestudiante:
		  			Asistencia.insertarasistencia(i,idciclo,idtaller,today)
		  		flash("La asistencia se registro correctamente.","success")
		  		return render_template('user/homeDocente.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
		  	else:
		  		Asistencia.insertarasistencia('NULL',idciclo,idtaller,today)
		  		flash("La asistencia se registro correctamente.","success")
		  		return render_template('user/homeDocente.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'])
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
def casteartoday(fechas):
	dicdias = {'MONDAY':'Lunes','TUESDAY':'Martes','WEDNESDAY':'Miercoles','THURSDAY':'Jueves', \
	'FRIDAY':'Viernes','SATURDAY':'Sabado','SUNDAY':'Domingo'}
	anho = fechas.year
	mes =  fechas.month
	dia= fechas.day
	fecha = datetime(anho, mes, dia)
	return (dicdias[fecha.strftime('%A').upper()])

def listarordenada():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		Asistencia.db = get_db()
		asistencias=Asistencia.devolverordenada()
		#fechasdeltaller=Asistencia.devolvervalores()[0]
		return render_template('asistencia/listarasistencia.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],asistencias=asistencias)
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
def sinestudiante():
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		Asistencia.db = get_db()
		asistencias=Asistencia.sinestudiante()
		return render_template('asistencia/sinestudiante.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],asistencias=asistencias)
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
def listaestudiantespresentes(tallerid):
	Configuracion.db = get_db()
	pat=Configuracion.configurartitulo()[0]
	if 'user' in session.keys():
		Asistencia.db = get_db()
		data=Asistencia.devolverdato(tallerid)
		return render_template('asistencia/listpresenteestudiante.html',titulo=pat['titulo'], descripcion=pat['descripcion'],habilitacion=pat['habilitacion'],data=data)
	else:
		flash("Debes iniciar sesion para ver este contenido")
		return render_template('home.html', titulo=pat['titulo'], descripcion=pat['descripcion'], habilitacion=pat['habilitacion'])
