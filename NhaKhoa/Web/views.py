from django.shortcuts import render, redirect
from .models import DentalClinic, Appointment
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages

def home(request):
    clinics = DentalClinic.objects.all()  # Lấy tất cả phòng khám từ cơ sở dữ liệu
    return render(request, 'home.html', {'clinics': clinics})

@login_required
def book_appointment(request, clinic_id):
    clinic = DentalClinic.objects.get(id=clinic_id)
    if request.method == 'POST':
        date = request.POST['date']
        time = request.POST['time']
        notes = request.POST.get('notes', '')
        Appointment.objects.create(user=request.user, clinic=clinic, date=date, time=time, notes=notes)
        return redirect('home')
    return render(request, 'book_appointment.html', {'clinic': clinic})


def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, "Tên đăng nhập hoặc mật khẩu không đúng!")
    return render(request, 'login.html')

def register_view(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Tài khoản đã được tạo thành công!")
            return redirect('login')
        else:
            messages.error(request, "Đăng ký thất bại. Vui lòng thử lại.")
    else:
        form = UserCreationForm()
    return render(request, 'register.html', {'form': form})


def logout_view(request):
    logout(request)
    return render(request, 'logout.html')
