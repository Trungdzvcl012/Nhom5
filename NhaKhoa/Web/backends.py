from django.contrib.auth.backends import BaseBackend
import pyodbc
from django.contrib.auth import get_user_model

UserModel = get_user_model()

class SQLServerAuthBackend(BaseBackend):
    def authenticate(self, request, username=None, password=None):
        try:
            conn_str = f"DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={'DESKTOP-I7DLA1M\\DAODUYCUONG'};DATABASE={'WEB_KHAM_BENH'};Trusted_Connection=yes;"
            conn = pyodbc.connect(conn_str)
            cursor = conn.cursor()
            query = "SELECT * FROM KHACH_HANG WHERE TEN_DN = ? AND MAT_KHAU = ?"
            cursor.execute(query, (username, password))
            user_data = cursor.fetchone()
            conn.close()

            if user_data:
                # Tìm hoặc tạo user trong bảng auth_user (nếu cần)
                from django.contrib.auth.models import User
                try:
                    user = User.objects.get(username=username)
                except User.DoesNotExist:
                    user = User.objects.create_user(username=username, password=password)  # Password này không quan trọng, vì xác thực dựa trên SQL Server
                    user.save()
                return user
            return None  # Không tìm thấy người dùng
        except pyodbc.Error as ex:
            print(f"Database error: {ex}")  # In lỗi để debug
            return None

    def get_user(self, user_id):
        try:
            return UserModel.objects.get(pk=user_id)  # Sử dụng UserModel
        except UserModel.DoesNotExist:
            return None
        
