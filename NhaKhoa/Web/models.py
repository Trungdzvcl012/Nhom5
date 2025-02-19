from django.db import models
from django.contrib.auth.models import User

class DentalClinic(models.Model):
    name = models.CharField(max_length=255)
    address = models.TextField()
    phone = models.CharField(max_length=10)
    description = models.TextField(blank=True)

    def __str__(self):
        return self.name

class Appointment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    clinic = models.ForeignKey(DentalClinic, on_delete=models.CASCADE)
    name = models.CharField(max_length=255, null=True, blank=True)
    email = models.EmailField(null=True, blank=True)
    phone = models.CharField(max_length=10, null=True, blank=True)
    date = models.DateField()
    time = models.TimeField()
    notes = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"{self.name} - {self.date} {self.time}"

class KhachHang(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    ten = models.CharField(max_length=255, verbose_name='Tên')
    sdt = models.CharField(max_length=10, verbose_name='Số điện thoại')
    email = models.EmailField(verbose_name='Email')
    ten_dn = models.CharField(max_length=255, unique=True, verbose_name="Tên đăng nhập")

    def __str__(self):
        return self.user.username
