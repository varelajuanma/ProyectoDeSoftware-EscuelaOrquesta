class Nucleo(object):

    db = None

    @classmethod
    def all(cls):
        sql = 'SELECT * FROM nucleo '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def create(cls, data):
        sql = """
            INSERT INTO nucleo (nombre, direccion, telefono, latitud, longitud)
            VALUES (%s, %s, %s, %s, %s)
        """
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return True

    @classmethod
    def eliminarNucleo(cls, data):
        sql = 'DELETE FROM nucleo WHERE id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()

    @classmethod
    def modificarNucleo(cls, data):
        sql ='UPDATE nucleo SET nombre=%s, direccion=%s, telefono=%s, latitud=%s, longitud=%s WHERE id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()

    @classmethod
    def datosdenucleo(cls, data):
    	sql = 'SELECT * FROM nucleo WHERE id = %s'
    	cursor = cls.db.cursor()
    	cursor.execute(sql, list(data.values()))
    	return cursor.fetchall()

    @classmethod
    def find_by_latitud(cls,data):
        sql = """
            SELECT * FROM nucleo AS n
            WHERE n.latitud = %s

            """
        cursor = cls.db.cursor()
        cursor.execute(sql, (data))
        return cursor.fetchone()

    @classmethod
    def find_by_longitud(cls,data):
        sql = """
            SELECT * FROM nucleo AS n
            WHERE n.longitud = %s

            """
        cursor = cls.db.cursor()
        cursor.execute(sql, (data))
        return cursor.fetchone()

    @classmethod
    def find_by_nombre(cls,data):
        sql = """
            SELECT * FROM nucleo AS n
            WHERE n.nombre = %s

            """
        cursor = cls.db.cursor()
        cursor.execute(sql, (data))
        return cursor.fetchone()

