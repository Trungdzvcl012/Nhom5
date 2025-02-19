from django.contrib.auth.backends import BaseBackend
import pyodbc
from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import check_password

UserModel = get_user_model()

class SQLServerAuthBackend(BaseBackend):
    def authenticate(self, request, username=None, password=None):
        try:
            conn_str = f"DRIVER={{ODBC Driver 17 for SQL Server}};SERVER=DESKTOP-I7DLA1M\\DAODUYCUONG;DATABASE=WEB_KHAM_BENH;Trusted_Connection=yes;"
            with pyodbc.connect(conn_str) as conn:
                cursor = conn.cursor()
                query = "SELECT user_id FROM KHACH_HANG WHERE TEN_DN = ?"
                cursor.execute(query, (username,))
                user_id_data = cursor.fetchone()

            if user_id_data:
                user_id = user_id_data[0]
                try:
                    user = UserModel.objects.get(pk=user_id)
                    if user.check_password(password):
                        return user
                except UserModel.DoesNotExist:
                    return None
            return None

        except pyodbc.Error as ex:
            print(f"Lỗi database: {ex}")
            return None

    def get_user(self, user_id):
        try:
            return UserModel.objects.get(pk=user_id)
        except UserModel.DoesNotExist:
            return None
