class Ciclo(object):
     db = None

     @classmethod
     def insertarciclo(cls, data):
     	sql = """
     	INSERT INTO ciclo_lectivo (fecha_ini,fecha_fin,semestre)
     	VALUES (%s, %s, %s)  ## aca protejo la inyeccion sql
     	"""
     	cursor = cls.db.cursor()
     	cursor.execute(sql, list(data.values()))
     	cls.db.commit()
     	return True

     @classmethod
     def listarciclos(cls):
        from datetime import date
        today = date.today()
        sql = 'SELECT * FROM ciclo_lectivo WHERE fecha_fin > %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,today)
        return cursor.fetchall()
     @classmethod
     def listartaller(cls):
        sql = 'SELECT * FROM taller'
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()
     @classmethod
     def insertartaller(cls,idtaller,idciclo,multiselect,dia,nucleo):
        sql = """
        INSERT INTO ciclo_lectivo_taller (taller_id,ciclo_lectivo_id,dia_id,nucleo_id)
        VALUES (%s, %s,%s,%s)  ## aca protejo la inyeccion sql
        """
        cursor = cls.db.cursor()
        cursor.execute(sql,(idtaller,idciclo,dia,nucleo))
        cls.db.commit()
        for doce in multiselect:
            sql = """
            INSERT INTO docente_responsable_taller (docente_id,ciclo_lectivo_id,taller_id)
            VALUES (%s, %s, %s)  ## aca protejo la inyeccion sql
            """
            cursor = cls.db.cursor()
            cursor.execute(sql,(doce,idciclo,idtaller))
            cls.db.commit()
        return True
     @classmethod
     def traerCiclos(cls):
        from datetime import date
        today = date.today()
        sql = """
        SELECT cl.id,t.id,fecha_fin, fecha_ini,semestre,t.nombre,nombre_corto FROM ciclo_lectivo_taller AS clt
        INNER JOIN ciclo_lectivo AS cl ON cl.id = clt.ciclo_lectivo_id
        INNER JOIN taller AS t ON t.id = clt.taller_id
        WHERE cl.fecha_fin > %s
        """
        cursor = cls.db.cursor()
        cursor.execute(sql,today)
        cls.db.commit()
        return cursor.fetchall()

     @classmethod
     def devolverdocente(cls):
        sql = 'SELECT * FROM docente '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

     @classmethod
     def devolverestudiante(cls):
        sql = 'SELECT * FROM estudiante'
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

     @classmethod
     def recuperandoidclolecito(cls):
        sql = 'SELECT * FROM taller INNER JOIN ciclo_lectivo_taller WHERE taller.id = ciclo_lectivo_taller.taller_id'
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

     @classmethod
     def insertdocente(cls, idtaller,idciclo,multiselect):
        noAgregados= []
        for doce in multiselect:
            sql = "SELECT EXISTS(SELECT * FROM docente_responsable_taller WHERE docente_id = %s and ciclo_lectivo_id = %s and taller_id = %s)"
            cursor = cls.db.cursor()
            cursor.execute(sql,(doce,idciclo,idtaller))
            reply = list(cursor.fetchall()[0].values())
            if (reply[0] == 0):
                sql = """
                INSERT INTO docente_responsable_taller (docente_id,ciclo_lectivo_id,taller_id)
                VALUES (%s, %s, %s)  ## aca protejo la inyeccion sql
                """
                cursor = cls.db.cursor()
                cursor.execute(sql,(doce,idciclo,idtaller))
                cls.db.commit()
            else:
                noAgregados.append(doce)
        return noAgregados
     @classmethod
     def insertestudiante(cls, idtaller,idciclo,idestudiante):
        sql = "SELECT EXISTS(SELECT * FROM estudiante_taller WHERE estudiante_id = %s and ciclo_lectivo_id = %s and taller_id = %s)"
        cursor = cls.db.cursor()
        cursor.execute(sql,(idestudiante,idciclo,idtaller))
        reply = list(cursor.fetchall()[0].values())
        if (reply[0] == 0):
            sql = """
            INSERT INTO estudiante_taller (estudiante_id,ciclo_lectivo_id,taller_id)
            VALUES (%s, %s, %s)  ## aca protejo la inyeccion sql
            """
            cursor = cls.db.cursor()
            cursor.execute(sql,(idestudiante,idciclo,idtaller))
            cls.db.commit()
            return True
        else:
            return False

     @classmethod
     def recuperarestudiantesdeuntallerenunciclo(cls):
        sql = ' SELECT * FROM ciclo_lectivo inner JOIN ciclo_lectivo_taller on ciclo_lectivo.id = ciclo_lectivo_taller.ciclo_lectivo_id  INNER JOIN estudiante_taller on estudiante_taller.taller_id = ciclo_lectivo_taller.taller_id  '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        cls.db.commit()
        return True

     @classmethod
     def recuperardocentedeuntallerenunciclo(cls):
        sql = ' SELECT * FROM ciclo_lectivo inner JOIN ciclo_lectivo_taller on ciclo_lectivo.id = ciclo_lectivo_taller.ciclo_lectivo_id INNER join docente_responsable_taller on docente_responsable_taller.taller_id = ciclo_lectivo_taller.taller_id '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        cls.db.commit()
        return True
     @classmethod
     def emailDocente(cls, d_id):
        sql = 'SELECT nombre FROM docente where id = %s '
        cursor = cls.db.cursor()
        cursor.execute(sql, d_id)
        return list(cursor.fetchall()[0].values())
     @classmethod
     def existeTallerEnCiclo(cls,id_taller,id_ciclo):
        sql = 'SELECT * FROM ciclo_lectivo_taller WHERE taller_id = %s and ciclo_lectivo_id=%s '
        cursor = cls.db.cursor()
        cursor.execute(sql,(id_taller,id_ciclo))
        return cursor.fetchone()
     @classmethod
     def estudiantesDeUnTaller(cls,id,cId):
         sql = "SELECT * FROM `estudiante_taller` AS e INNER JOIN estudiante ON estudiante.id = e.estudiante_id where e.taller_id = %s and e.ciclo_lectivo_id = %s "
         cursor = cls.db.cursor()
         cursor.execute(sql,(id,cId))
         return cursor.fetchall()
     @classmethod
     def docentesDeUnTaller(cls,id,cId):
         sql = "SELECT * FROM docente_responsable_taller AS d INNER JOIN docente ON docente.id = d.docente_id WHERE d.taller_id = %s and d.ciclo_lectivo_id = %s"
         cursor = cls.db.cursor()
         cursor.execute(sql,(id,cId))
         return cursor.fetchall()

     @classmethod
     def nombreTaller(cls,id):
        sql = "SELECT nombre FROM taller where id = %s"
        cursor = cls.db.cursor()
        cursor.execute(sql,id)
        return cursor.fetchall()

     @classmethod
     def borrarEstudiante(cls,id,tallerid,cicloid):
         sql = 'DELETE from estudiante_taller WHERE estudiante_id=%s and taller_id = %s and ciclo_lectivo_id = %s'
         cursor = cls.db.cursor()
         cursor.execute(sql,(id,tallerid,cicloid))
         cls.db.commit()
         return True

     @classmethod
     def borrarDocente(cls,id,tallerid,cicloid):
         sql = 'DELETE FROM docente_responsable_taller WHERE docente_id=%s and taller_id = %s and ciclo_lectivo_id = %s'
         cursor = cls.db.cursor()
         cursor.execute(sql,(id,tallerid,cicloid))
         cls.db.commit()
         return True

     @classmethod
     def borrarTaller(cls,data):
         sql = 'DELETE FROM ciclo_lectivo_taller  WHERE ciclo_lectivo_id = %s and taller_id= %s'
         cursor = cls.db.cursor()
         cursor.execute(sql,list(data.values()))
         cls.db.commit()
         return True
     @classmethod
     def borrarCiclo(cls,data):
         sql = "DELETE FROM estudiante_taller  WHERE ciclo_lectivo_id = %s"
         cursor = cls.db.cursor()
         cursor.execute(sql,list(data.values()))
         cls.db.commit()
         sql = "DELETE FROM docente_responsable_taller  WHERE ciclo_lectivo_id = %s"
         cursor = cls.db.cursor()
         cursor.execute(sql,list(data.values()))
         cls.db.commit()
         sql = "DELETE FROM ciclo_lectivo_taller WHERE ciclo_lectivo_id = %s"
         cursor = cls.db.cursor()
         cursor.execute(sql,list(data.values()))
         cls.db.commit()
         sql = "DELETE FROM ciclo_lectivo  WHERE id = %s"
         cursor = cls.db.cursor()
         cursor.execute(sql,list(data.values()))
         cls.db.commit()

     @classmethod
     def datosDeUnCiclo(cls,id):
         sql = 'SELECT * FROM ciclo_lectivo WHERE id = %s'
         cursor = cls.db.cursor()
         cursor.execute(sql,id)
         cls.db.commit()
         return cursor.fetchall()

     @classmethod
     def datosDeUnTaller(cls,id):
         sql = 'SELECT * FROM taller WHERE id = %s'
         cursor = cls.db.cursor()
         cursor.execute(sql,id)
         cls.db.commit()
         return cursor.fetchall()

     @classmethod
     def guardarModificacionCiclo(cls,data):
         sql = 'UPDATE ciclo_lectivo SET fecha_ini=%s, fecha_fin =%s, semestre=%s WHERE id=%s'
         cursor = cls.db.cursor()
         cursor.execute(sql,list(data.values()))
         cls.db.commit()

     @classmethod
     def talleresDeLosQueSeResponsabiliza(cls,id):
        sql = 'SELECT * FROM docente_responsable_taller WHERE docente_id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,id)
        cls.db.commit()
        return cursor.fetchall()

     @classmethod
     def cantDocentesResponsables(cls,idtaller):
        sql = 'SELECT COUNT(docente_id) FROM `docente_responsable_taller` WHERE taller_id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,idtaller)
        cls.db.commit()
        return cursor.fetchone()

     @classmethod
     def talleresDeUnCiclo(cls,id):
         sql = "SELECT * FROM ciclo_lectivo_taller INNER JOIN taller ON taller.id = ciclo_lectivo_taller.taller_id INNER JOIN nucleo ON nucleo.id = nucleo_id INNER JOIN dias_semana ON dias_semana.id = dia_id WHERE ciclo_lectivo_id = %s GROUP BY taller_id"
         cursor = cls.db.cursor()
         cursor.execute(sql,id)
         cls.db.commit()
         return cursor.fetchall()
     @classmethod
     def ciclosPasados(cls):
         from datetime import date
         today = date.today()
         sql = 'SELECT * FROM ciclo_lectivo WHERE fecha_fin < %s'
         cursor = cls.db.cursor()
         cursor.execute(sql,today)
         return cursor.fetchall()
     @classmethod
     def compararFechas(cls,id):
         from datetime import date
         today = date.today()
         sql = 'SELECT * FROM ciclo_lectivo WHERE id = %s'
         cursor = cls.db.cursor()
         cursor.execute(sql,id)
         datos = cursor.fetchone()
         fecha = datos['fecha_fin']
         if fecha < today:
             return True
         return False
     @classmethod
     def diasDeLaSemana(cls):
         sql = "SELECT * FROM dias_semana"
         cursor = cls.db.cursor()
         cursor.execute(sql)
         cls.db.commit()
         return cursor.fetchall()
     @classmethod
     def listarNucleos(cls):
         sql = "SELECT * FROM nucleo"
         cursor = cls.db.cursor()
         cursor.execute(sql)
         cls.db.commit()
         return cursor.fetchall()
     @classmethod
     def devolverNucleo_dia(cls,id,cicloid):
         sql = 'SELECT nucleo.id,dias_semana.id,nucleo.nombre,direccion,telefono, dias_semana.nombre FROM ciclo_lectivo_taller INNER JOIN nucleo ON nucleo.id = nucleo_id INNER JOIN dias_semana ON dias_semana.id = dia_id WHERE taller_id = %s and ciclo_lectivo_id = %s '
         cursor = cls.db.cursor()
         cursor.execute(sql,(id,cicloid))
         cls.db.commit()
         return cursor.fetchall()
     @classmethod
     def modificarDia_lugar(cls,data):
         dia_id = data['idDia']
         nucleo_id = data['idnucleo']
         nucleoAnterior = data['nucleoAnterior']
         diaAnterior = data['diaAnterior']
         sql = 'UPDATE ciclo_lectivo_taller SET dia_id = %s, nucleo_id = %s WHERE dia_id = %s and nucleo_id= %s'
         cursor = cls.db.cursor()
         cursor.execute(sql,(dia_id,nucleo_id,diaAnterior,nucleoAnterior))
         cls.db.commit()
     @classmethod
     def agregarDia_lugar(cls,data):
         sql = 'INSERT INTO ciclo_lectivo_taller (taller_id,ciclo_lectivo_id,nucleo_id,dia_id) VALUES (%s,%s,%s,%s)'
         cursor = cls.db.cursor()
         cursor.execute(sql,list(data.values()))
         cls.db.commit()
     @classmethod
     def existeDiaEnNucleo(cls,nucleo,dia,taller,ciclo):
         sql = "SELECT * FROM ciclo_lectivo_taller WHERE nucleo_id= %s and dia_id = %s and taller_id = %s and ciclo_lectivo_id = %s"
         cursor = cls.db.cursor()
         cursor.execute(sql,(nucleo,dia,taller,ciclo))
         cls.db.commit()
         return cursor.fetchone()
     @classmethod
     def borrarDia_lugar(cls,data):
         sql = 'DELETE FROM ciclo_lectivo_taller where taller_id = %s and ciclo_lectivo_id = %s and nucleo_id = %s  and dia_id = %s'
         cursor = cls.db.cursor()
         cursor.execute(sql,list(data.values()))
         cls.db.commit()
     @classmethod
     def existeTallerEnNucleo(cls,id):
         sql = 'SELECT * FROM ciclo_lectivo_taller WHERE nucleo_id = %s'
         cursor = cls.db.cursor()
         cursor.execute(sql,id)
         cls.db.commit()
         return cursor.fetchall()
