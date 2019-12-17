#from flask_sqlalchemy import SQLAlchemy 
#import datetime

#db= SQLAlchemy()

#class User(db.Model):
#	__tablename__ = 'pepito' ## pruebo ahi haber

#	id=db.Column (db.Integer, primary_key=True)
#	username = db.Column(db.String(50),unique=True)
#	email = db.Column (db.String(50))
#	password = db.Column (db.String(50))
#	created_date = db.Column (db.DateTime, default=datetime.datetime.now)
## va??
## crear eswa tabla!
## en phpy myadmin y despues hacer un altita
## de este form
## miraa
## tablita


#user= User(username = create_form.username.data,
#		 	password= create_form.password.data,
#		 	email = create_form.email.data)
#db.session.add(user)
#db.session.commit()

# Importa el módulo sqlite3
#import sqlite3

# Crea una conexión a la base de datos SQLite
#con = sqlite3.connect("data/portal_mammals.sqlite")

# Con la conexión, crea un objeto cursor
#cur = con.cursor()

# Ejecuta la consulta 1
#cur.execute('SELECT plot_id FROM plots WHERE plot_type="Control"')
# Extrae todos los datos
#cur.fetchall()

# Ejecuta la consulta 2
#cur.execute('SELECT species FROM species WHERE taxa="Bird"')
# Extrae sólo el primer resultado
#cur.fetchone()

# No te olvides de cerrar la conexión
#con.close()