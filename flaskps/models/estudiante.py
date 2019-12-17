class Estudiante(object):

    db = None

    @classmethod
    def all(cls):
        sql = 'SELECT * FROM estudiante '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def create(cls, data):
        sql = """
            INSERT INTO estudiante (apellido, nombre, fecha_nac, lugarnac, localidad_id, domicilio, barrio_id, genero_id,  tipo_doc_id, numero, tel, escuela_id, nivel_id, mailresponsable, numeroresponsable)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return True

    @classmethod
    def devolverniveles(cls):
        sql = 'SELECT * FROM nivel '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def devolverbarrios(cls):
        sql = 'SELECT * FROM barrio '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def devolverescuelas(cls):
        sql = 'SELECT * FROM escuela '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def devolvergeneros(cls):
        sql = 'SELECT * FROM genero '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def devolverresponsableacargo(cls):
        sql = 'SELECT * FROM responsable '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod #modelo que pense para que no se repita un usuario con el mismo numero de documento
    def find_by_numerodni(cls, numero):
        sql = """
        	SELECT * FROM estudiante AS e
            WHERE e.numero = %s

            """
        cursor = cls.db.cursor()
        cursor.execute(sql, (numero))
        return cursor.fetchone()

    @classmethod
    def eliminarEstudiante(cls, data):
        sql = 'DELETE FROM responsable_estudiante WHERE estudiante_id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        sql = 'DELETE FROM asistencia_estudiante_taller WHERE estudiante_id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        sql = 'DELETE FROM estudiante_taller WHERE estudiante_id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        sql = 'DELETE FROM estudiante WHERE id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()

    @classmethod
    def datosdeestudiante(cls, data):
    	sql = 'SELECT * FROM estudiante WHERE id = %s'
    	cursor = cls.db.cursor()
    	cursor.execute(sql, list(data.values()))
    	return cursor.fetchall()

    @classmethod
    def modificar(cls, data):
        sql ='UPDATE estudiante SET apellido=%s,nombre=%s,fecha_nac=%s,lugarnac=%s,localidad_id=%s,domicilio=%s, barrio_id=%s, genero_id=%s, escuela_id=%s, tipo_doc_id=%s, numero=%s, tel=%s, nivel_id=%s, mailresponsable=%s, numeroresponsable=%s WHERE id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()

    @classmethod
    def macheodeestudianteconbarrio(cls, data):
        sql='SELECT * FROM (SELECT e.id, e.apellido, e.nombre, e.fecha_nac, e.localidad_id,e.nivel_id, e.domicilio, e.genero_id, e.escuela_id, e.tipo_doc_id, e.numero,e.tel,e.barrio_id, b.nombre AS barrio FROM estudiante AS e INNER JOIN barrio AS b WHERE e.barrio_id = b.id AND e.id = %s) AS dg'
        #sql = 'SELECT * FROM estudiante INNER JOIN barrio ON barrio.id =barrio_id WHERE estudiante.id =%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        return cursor.fetchall()

    @classmethod
    def macheodeestudianteconescuela(cls, data):
        #sql = 'SELECT * FROM estudiante INNER JOIN escuela ON escuela.id=escuela_id WHERE estudiante.id=%s'
        sql='SELECT * FROM (SELECT e.id, e.apellido, e.nombre, e.fecha_nac, e.localidad_id,e.nivel_id, e.domicilio, e.genero_id, e.escuela_id, e.tipo_doc_id, e.numero,e.tel,e.barrio_id, s.nombre AS escuela FROM estudiante AS e INNER JOIN escuela AS s WHERE e.escuela_id = s.id AND e.id = %s) AS dg'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        return cursor.fetchall()


    @classmethod
    def macheodeestudianteconivel(cls, data):
        sql='SELECT * FROM (SELECT e.id, e.apellido, e.nombre, e.fecha_nac, e.localidad_id,e.nivel_id, e.domicilio, e.genero_id, e.escuela_id, e.tipo_doc_id, e.numero,e.tel,e.barrio_id, n.nombre AS nivel FROM estudiante AS e INNER JOIN nivel AS n WHERE e.nivel_id = n.id AND e.id = %s) AS dg'
        #sql = 'SELECT * FROM estudiante INNER JOIN nivel ON nivel.id = nivel_id WHERE estudiante.id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        return cursor.fetchall()

    @classmethod
    def macheodeestudiantecongenero(cls, data):
        #sql = 'SELECT * FROM estudiante INNER JOIN genero ON genero.id=genero_id  WHERE estudiante.id=%s'
        sql='SELECT * FROM (SELECT e.id, e.apellido, e.nombre, e.fecha_nac, e.localidad_id,e.nivel_id, e.domicilio, e.genero_id, e.escuela_id, e.tipo_doc_id, e.numero,e.tel,e.barrio_id, g.nombre AS genero FROM estudiante AS e INNER JOIN genero AS g WHERE e.genero_id = g.id AND e.id = %s) AS dg'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        return cursor.fetchall()
    @classmethod
    def dniDeUnEstudiante(cls, id):
        sql = 'SELECT numero FROM estudiante WHERE id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,id)
        return cursor.fetchone()
