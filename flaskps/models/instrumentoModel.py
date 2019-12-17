import sqlite3
class InstrumentoModel(object):

    db = None

    @classmethod
    def listarInstrumentos(cls):
        sql = 'SELECT * FROM instrumento INNER JOIN tipo_instrumento ON instrumento.tipo_id = tipo_instrumento.id'
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def detalleInstrumento(cls, data):
        sql = """SELECT * FROM (SELECT i.nombre, t.nombre AS tipo, i.num_inventario, i.foto FROM instrumento AS i
            INNER JOIN tipo_instrumento AS t WHERE i.tipo_id = t.id AND i.id = %s) AS instr"""
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        return cursor.fetchone()

    @classmethod
    def crearInstrumento(cls, data, foto):
        sql = """
            INSERT INTO instrumento(nombre, tipo_id, num_inventario,foto)
            VALUES (%s, %s, %s, %s)
        """
          # Convert data into tuple format
        data_tuple = (data['nombre'], data['tipo_id'], data['num_inventario'], foto)
        cursor = cls.db.cursor()
        cursor.execute(sql, data_tuple)
        cls.db.commit()
        return True

    @classmethod
    def eliminarInstrumento(cls, data):
        sql = 'DELETE FROM instrumento WHERE id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()

    @classmethod
    def modificarInstrumento(cls, data):
        sql ='UPDATE instrumento SET nombre=%s,tipo_id=%s,num_inventario=%s WHERE id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()

    @classmethod
    def modificarFoto(cls, foto, id):
        sql ='UPDATE instrumento SET foto=%s WHERE id=%s'

        cursor = cls.db.cursor()
        cursor.execute(sql, (foto, id))
        cls.db.commit()

    @classmethod
    def devolvertipos(cls):
        sql = 'SELECT * FROM tipo_instrumento '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod #modelo que pense para que no se repita un instrumento con el mismo numero de inventario
    def find_by_numeroinventario(cls, num_inventario):
        sql = """
        	SELECT * FROM instrumento AS i
            WHERE i.num_inventario = %s

            """
        cursor = cls.db.cursor()
        cursor.execute(sql, (num_inventario))
        return cursor.fetchone()

    @classmethod
    def datosdeinstrumento(cls, data):
    	sql = 'SELECT * FROM instrumento WHERE id = %s'
    	cursor = cls.db.cursor()
    	cursor.execute(sql, list(data.values()))
    	return cursor.fetchone()

    @classmethod
    def numInventarioDeUnInstrumento(cls, id):
        sql = 'SELECT num_inventario FROM instrumento WHERE id = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,id)
        return cursor.fetchone()
