from django.db import models
from django.contrib.auth.models import User

class DentalClinic(models.Model):
    name = models.CharField(max_length=255)
    address = models.TextField()
    phone = models.CharField(max_length=15)
    description = models.TextField(blank=True)

    class Meta:
        ordering = ['name']

    def __str__(self):
        return self.name

class Appointment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='appointments')
    clinic = models.ForeignKey(DentalClinic, on_delete=models.CASCADE, related_name='appointments')
    date = models.DateField()
    time = models.TimeField()
    notes = models.TextField(blank=True)

    class Meta:
        ordering = ['date', 'time']

    def __str__(self):
        return f"{self.user.username} - {self.clinic.name} ({self.date} {self.time})"

class KhachHang(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)  # CASCADE is required if primary_key=True
    ten = models.CharField(max_length=255, verbose_name="Họ và Tên")
    sdt = models.CharField(max_length=20, verbose_name="Số Điện Thoại")
    ten_dn = models.CharField(max_length=255, unique=True, blank=True, null=True, verbose_name="Tên Đăng Nhập")
    email = models.EmailField(blank=True, null=True, verbose_name="Email")

    def __str__(self):
        return self.ten
    
