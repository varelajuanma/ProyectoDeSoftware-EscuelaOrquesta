class Asistencia(object):
     db = None

     @classmethod
     def listariddocente(cls,data):
        from datetime import date
        today = date.today()
        sql = 'SELECT usuarios.id FROM usuarios WHERE usuarios.email = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,data)
        return cursor.fetchone()

     @classmethod
     def listartalleres(cls,id):
        from datetime import date
        today = date.today()
        sql = 'SELECT * FROM taller INNER JOIN docente_responsable_taller ON taller.id = docente_responsable_taller.taller_id INNER JOIN ciclo_lectivo ON ciclo_lectivo.id = docente_responsable_taller.ciclo_lectivo_id WHERE docente_id = %s  and ciclo_lectivo.fecha_fin > %s '
        cursor = cls.db.cursor()
        cursor.execute(sql,(id,today))
        return cursor.fetchall()


     @classmethod
     def recuperaridtaller(cls,data):
            sql = 'SELECT taller.id FROM taller WHERE taller.nombre = %s'
            cursor = cls.db.cursor()
            cursor.execute(sql,data)
            return cursor.fetchall()

     @classmethod
     def recuperarusuariostaller(cls,taller,ciclo):
        sql='SELECT estudiante.apellido, estudiante.nombre, estudiante.id FROM taller  INNER JOiN estudiante_taller ON taller.id = estudiante_taller.taller_id INNER JOIN estudiante ON estudiante_taller.estudiante_id=estudiante.id WHERE taller_id= %s and ciclo_lectivo_id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,(taller,ciclo))
        return cursor.fetchall()


     @classmethod
     def recuperarciclolectivo(cls,data):
        sql='SELECT ciclo_lectivo_taller.ciclo_lectivo_id FROM taller INNER JOIN ciclo_lectivo_taller ON taller.id = ciclo_lectivo_taller.taller_id WHERE taller_id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,data)
        return cursor.fetchall()
     @classmethod
     def insertarasistencia(cls,estudiante,ciclo,taller,fecha):
         sql = """
                 INSERT INTO asistencia_estudiante_taller (estudiante_id,ciclo_lectivo_id,taller_id,fecha)
                 VALUES (%s, %s, %s, %s)  ## aca protejo la inyeccion sql
         """
         cursor = cls.db.cursor()
         poderosa=[estudiante,ciclo,taller,fecha]
         cursor.execute(sql,poderosa)
         cls.db.commit()
         return True
     @classmethod
     def devolverordenada(cls):
           sql = 'SELECT fecha,taller.nombre,asistencia_estudiante_taller.taller_id FROM asistencia_estudiante_taller INNER JOIN taller ON taller.id = asistencia_estudiante_taller.taller_id WHERE asistencia_estudiante_taller.estudiante_id != 0 ORDER by asistencia_estudiante_taller.fecha DESC'
           cursor = cls.db.cursor()
           cursor.execute(sql)
           return cursor.fetchall()
     @classmethod
     def sinestudiante(cls):
         sql = 'SELECT * FROM asistencia_estudiante_taller INNER JOIN taller ON taller.id = asistencia_estudiante_taller.taller_id  WHERE asistencia_estudiante_taller.estudiante_id =0 ORDER by asistencia_estudiante_taller.fecha DESC'
         cursor = cls.db.cursor()
         cursor.execute(sql)
         return cursor.fetchall()
     @classmethod
     def deolverrespuesta(cls,dat,taller):
        sql= 'SELECT COUNT(ciclo_lectivo_id)  FROM ciclo_lectivo_taller INNER JOIN taller ON ciclo_lectivo_taller.taller_id = taller.id INNER JOIN dias_semana ON ciclo_lectivo_taller.dia_id = dias_semana.id WHERE dias_semana.nombre =%s AND ciclo_lectivo_taller.taller_id = %s'
        cursor = cls.db.cursor()
        poderosa=[dat,taller]
        cursor.execute(sql,poderosa)
        return cursor.fetchall()
     @classmethod
     def verificarexistencia(cls,dat,idtaller,idciclo):
        sql= 'SELECT COUNT(id) FROM asistencia_estudiante_taller WHERE asistencia_estudiante_taller.fecha = %s and asistencia_estudiante_taller.taller_id=%s and asistencia_estudiante_taller.ciclo_lectivo_id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql,(dat,idtaller,idciclo))
        return cursor.fetchall()
     @classmethod
     def devolverdato(cls,idtaller):
        sql = 'SELECT * FROM asistencia_estudiante_taller INNER JOIN estudiante ON asistencia_estudiante_taller.estudiante_id = estudiante.id WHERE asistencia_estudiante_taller.taller_id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,idtaller)
        return cursor.fetchall()
     @classmethod
     def nombretaller(cls,id):
        sql = 'SELECT nombre FROM taller where id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,id)
        return cursor.fetchone()
    # @classmethod
    # def devolvervalores(cls):
     #      sql = 'SELECT DISTINCT fecha FROM asistencia_estudiante_taller WHERE estudiante_id !=0'
      #     cursor = cls.db.cursor()
      #     cursor.execute(sql)
     #      return cursor.fetchall()
