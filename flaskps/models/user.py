class User(object):

    db = None

    @classmethod
    def all(cls):
        sql = 'SELECT * FROM usuarios '
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()


    @classmethod
    def datosdeusuario(cls, data):
    	sql = 'SELECT * FROM usuarios WHERE id = %s'
    	cursor = cls.db.cursor()
    	cursor.execute(sql, list(data.values()))
    	return cursor.fetchall()

    @classmethod
    def modify(cls, data):
        sql = 'UPDATE usuarios SET email=%s,nombre=%s,apellido=%s WHERE id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return True

    @classmethod
    def eliminarUsuario(cls, data):
        sql = 'DELETE FROM usuario_tiene_rol WHERE usuario_id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        sql1 = 'DELETE FROM usuarios WHERE id=%s'
        cursor.execute(sql1, list(data.values()))
        cls.db.commit()

    @classmethod
    def bloquearUsuario(cls, data):
        sql = 'UPDATE usuarios SET activo=0 WHERE id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return True

    @classmethod
    def desbloquearUsuario(cls, data):
        sql = 'UPDATE usuarios SET activo=1 WHERE id=%s'
        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return True

    @classmethod
    def create(cls, data):
        sql = """
            INSERT INTO usuarios (email, contraseña, nombre, apellido, activo)
            VALUES (%s, %s, %s, %s, 1)  ## aca protejo la inyeccion sql
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, list(data.values()))
        cls.db.commit()
        return True

    @classmethod
    def find_by_email_and_pass(cls, email, contraseña):
        sql = """
            SELECT * FROM usuarios AS u
            WHERE u.email = %s AND u.contraseña = %s
        """
        cursor = cls.db.cursor()
        cursor.execute(sql, (email, contraseña))
        return cursor.fetchone()

    @classmethod
    def getIdRolUser(cls, email):
        sql = """
            SELECT utr_u.rol_id FROM
            (SELECT utr.rol_id FROM usuario_tiene_rol AS utr
            INNER JOIN
            usuarios AS u
            WHERE u.id = utr.usuario_id AND u.email = %s) AS utr_u
        """

        cursor = cls.db.cursor()
        cursor.execute(sql, (email))
        if cursor.fetchone:
            return cursor.fetchone()
        else:
            return ''

    @classmethod
    def buscarPermiso(cls, id_rol, permiso):
        sql = """
            SELECT nombre FROM (SELECT rol_id, nombre FROM rol_tiene_permiso AS rtp
            INNER JOIN permisos AS p
            WHERE rtp.permiso_id = p.id) AS rtpp
            WHERE rtpp.rol_id = %s AND rtpp.nombre = %s
        """
        cursor = cls.db.cursor()
        cursor.execute(sql, (id_rol, permiso))
        result = cursor.fetchone()
        if result:
            return True
        else:
            return False


    @classmethod
    def find_by_email(cls, email):
        sql = """
        	SELECT * FROM usuarios AS u
            WHERE u.email = %s

            """
        cursor = cls.db.cursor()
        cursor.execute(sql, (email))
        return cursor.fetchone()

    @classmethod
    def busqueda_usuario(cls,email):
        sql = """
            SELECT * FROM usuarios as u
            WHERE email LIKE %s
        """
        mandar = '%'
        email +='%'
        mandar += email
        cursor = cls.db.cursor()
        cursor.execute(sql,mandar)
        return cursor.fetchall()

    @classmethod
    def busqueda_usuarios_bloqueados(cls):
        sql = """
            SELECT * FROM usuarios AS u
            WHERE u.activo = 0
        """
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()

    @classmethod
    def busqueda_usuarios_activos(cls):
        sql = """
            SELECT * FROM usuarios AS u
            WHERE u.activo = 1
        """
        cursor = cls.db.cursor()
        cursor.execute(sql)
        return cursor.fetchall()
    @classmethod
    def devolverNombreApellido(cls,email):
        sql = 'SELECT nombre,apellido FROM usuarios WHERE email = %s'
        cursor = cls.db.cursor()
        cursor.execute(sql,email)
        return cursor.fetchone()
