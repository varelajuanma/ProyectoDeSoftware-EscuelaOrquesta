from flask import redirect, render_template, url_for, session, abort, flash, request
from flaskps.db import get_db
from flaskps.models.docentesModel import DocentesModel
from flaskps.models.configuracion import Configuracion
from flaskps.helpers.auth import authenticated
from flaskps.resources import user
import json
import requests as rqs
from datetime import date
from datetime import datetime
import re
def validardatodocente(data):
	letras = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y","z"
	,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z", " "]
	caracteres = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y","z"
	,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z"
	,"0","1","2","3","4","5","6","7","8","9","0", " "]
	ape=str((data["apellido"]))
	nomb=str((data["nombre"]))
	dom=str((data["Domicilio"]))
	try:	
		entero=int((data["doc"]))
		entero2=int((data["tel"]))
		fecha = datetime.strptime((data["fecha"]), '%Y-%m-%d')
	except ValueError:
   	  return False

	for elemento in dom:
		if elemento not in caracteres:
			return False
		

	for elemento in nomb:
		if elemento not in letras:
			return False
		

	for elemento in ape:
		if elemento not in letras:
			return False
	
	return True	
def validardatosestudiante(data):
	letras = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y","z"
	,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z", " "] 
	caracteres = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y","z"
	,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z"
	,"0","1","2","3","4","5","6","7","8","9","0", " "]
	#carmail =["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y","z"
	#,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z"
	#,"0","1","2","3","4","5","6","7","8","9","0", " ", "_", "?", "@", "-", "."]
	expresion = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"
	ape=str((data["apellido"]))
	nomb=str((data["nombre"]))
	dom=str((data["domicilio"]))
	lug=str((data["lugarnac"]))
	mail=str((data["mailresponsable"]))
	try:	
		entero=int((data["numero"]))
		entero3=int((data["numeroresponsable"]))
		entero2=int((data["tel"]))
		fecha = datetime.strptime((data["fecha_nac"]), '%Y-%m-%d')
	except ValueError:
   	  return False

	for elemento in ape:
		if elemento not in letras:
			return False
		

	for elemento in nomb:
		if elemento not in letras:
			return False

	for elemento in lug:
		if elemento not in letras:
			return False
		
	for elemento in dom:
		if elemento not in caracteres:
			return False

	if re.match(expresion, mail) is  None:
		return False

	
		

	return True


def validarusuario(data):
	letras = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y","z"
	,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z", " "]
	
	caracteres = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y","z"
	,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z"
	,"0","1","2","3","4","5","6","7","8","9","0", " "]
	
	#carmail =["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y","z"
	#,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z"
	#,"0","1","2","3","4","5","6","7","8","9","0", " ", "_", "?", "@", "-", "."]
	expresion = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"
	ape=str((data["apellido"]))
	nomb=str((data["nombre"]))
	mail=str((data["email"]))

	for elemento in nomb:
		if elemento not in letras:
			return False
		

	for elemento in ape:
		if elemento not in letras:
			return False

	if re.match(expresion, mail) is  None:
		return False 
	
	return True	

def validarinstrumento(data):
	expresion = "[a-zA-Z]{1}[a-z0-9A-Z0-9]*";
	caracteres = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y","z"
	,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z"
	,"0","1","2","3","4","5","6","7","8","9","0"]
	nombre=str((data["nombre"]))
	inventario= str((data["num_inventario"]))
	if re.match(expresion, nombre) is  None:
		return False

	for elemento in inventario:
		if elemento not in caracteres:
			return False
	
	return True	

def validaraltademapa(data):
	caracteres = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y","z"
	,"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z"
	,"0","1","2","3","4","5","6","7","8","9","0", " "]
	numero = ["1","2","3","4","5","6","7","8","9","0"]
	patron = re.compile('^-?[0-9]{1,3}(?:\.[0-9]{1,10})?$') #patrón que debe cumplir para latitud y longitud
	nombre=str((data["nombre"]))
	direccion=str((data["direccion"]))
	telefono=str((data["telefono"]))
	latitud=str((data["latitud"]))
	longitud=str((data["longitud"]))
	print(latitud)
	print(longitud)
	for elemento in direccion:
		if elemento not in caracteres:
			return False
	for elemento in nombre:
		if elemento not in caracteres:
			return False
	for elemento in telefono:
		if elemento not in numero:
			return False
	if (patron.match(latitud) is None) and (patron.match(longitud) is None):
		return False

	return True