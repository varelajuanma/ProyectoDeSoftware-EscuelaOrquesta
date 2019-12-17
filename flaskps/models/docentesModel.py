class DocentesModel(object):

    db = None

    @classmethod
    def listarDocentes(cls):
        sql = 'SELECT * FROM docente'
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def agregar_docente(cls, data):
        sql = """
            INSERT INTO docente (apellido, nombre, fecha_nac, localidad_id, domicilio, genero_id, tipo_doc_id,
            numero, tel)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return True

    @classmethod
    def eliminarDocente(cls, data):
        sql = 'DELETE FROM docente_responsable_taller WHERE docente_id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        sql = 'DELETE FROM docente WHERE id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return True

    @classmethod
    def detalleDocente(cls, data):
        sql = """
            SELECT * FROM (SELECT d.id, d.apellido, d.nombre, d.fecha_nac, d.localidad_id, d.tipo_doc_id,
            d.numero, d.tel, d.domicilio, d.genero_id, g.nombre AS genero FROM docente AS d INNER JOIN genero AS g
            WHERE d.genero_id = g.id AND d.id = %s) AS dg
        """
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return cursor.fetchone()

    @classmethod
    def get_generos(cls):
        sql = 'SELECT * FROM genero'
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def update_docente(cls, data):
        sql = """
            UPDATE docente SET apellido=%s,nombre=%s,fecha_nac=%s,localidad_id=%s,domicilio=%s ,genero_id=%s,
            tipo_doc_id=%s ,numero=%s, tel=%s WHERE id=%s
        """
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return True


    @classmethod #modelo que pense para que no se repita un usuario con el mismo numero de documento
    def find_by_numerodni(cls, numero):
        sql = """
            SELECT * FROM docente AS e
            WHERE e.numero = %s

            """
        cursor = cls.db.cursor()
        cursor.execute(sql, (numero))
        return cursor.fetchone()
    @classmethod
    def dniDeUnDocente(cls, id):
        sql = 'SELECT numero FROM docente WHERE id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,id)
        return cursor.fetchone()
