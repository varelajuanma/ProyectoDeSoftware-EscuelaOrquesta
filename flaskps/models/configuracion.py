class Configuracion(object):

     db = None
     @classmethod
     def cambiardescripcion(cls, data):
        sql = """
            UPDATE  configuracion SET descripcion= %s
            WHERE id = 1
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()

        return True
     @classmethod
     def cambiarpaginado(cls, data):
        sql = 'UPDATE  configuracion SET  paginacion=%s WHERE id = 1'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return True

     @classmethod
     def configurartitulo(cls):
        sql = 'SELECT * FROM configuracion'
        cursor = cls.db.cursor()
        cursor.execute(sql)

        return cursor.fetchall()
     @classmethod
     def cambiartitulo(cls, data):
        sql = """
            UPDATE  configuracion SET titulo= %s,descripcion=%s,mailcontacto=%s,paginacion=%s,habilitacion=%s
            WHERE id = 1
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()

        return True

     @classmethod
     def cambiaremail(cls, data):
        sql = """
            UPDATE  configuracion SET mailcontacto= %s
            WHERE id = 1
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()

        return True
     @classmethod
     def desactivarPagina(cls):
        sql = """
            UPDATE  configuracion SET habilitacion= %s
        """
        cursor = cls.db.cursor()
        cursor.execute(sql, [0])
        cls.db.commit()
        return True


     @classmethod
     def habilitarsistema(cls):
        sql = """
            UPDATE  configuracion SET habilitacion= %s
        """
        cursor = cls.db.cursor()
        cursor.execute(sql, [1])
        cls.db.commit()
        return True
