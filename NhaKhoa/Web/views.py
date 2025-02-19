from django.shortcuts import render, redirect
from .forms import CustomUserCreationForm, KhachHangForm
from django.contrib.auth import login, logout, authenticate

from django.contrib import messages
from .models import DentalClinic, Appointment, KhachHang
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_http_methods
import pyodbc

import logging
from django.db import transaction, IntegrityError

logger = logging.getLogger(__name__)

def home(request):
    """Trang chủ: Hiển thị danh sách phòng khám."""  # Note added
    clinics = DentalClinic.objects.all()
    return render(request, 'home.html', {'clinics': clinics})

@login_required  # Note added: Yêu cầu đăng nhập
def book_appointment(request, clinic_id):
    """Đặt lịch hẹn khám bệnh."""  # Note added
    clinic = DentalClinic.objects.get(id=clinic_id)
    if request.method == 'POST':
        date = request.POST['date']
        time = request.POST['time']
        notes = request.POST.get('notes', '')
        Appointment.objects.create(user=request.user, clinic=clinic, date=date, time=time, notes=notes)
        return redirect('home')
    return render(request, 'book_appointment.html', {'clinic': clinic})

@transaction.atomic  # Note added: Đảm bảo tính toàn vẹn dữ liệu
def login_view(request):
    """Xử lý đăng nhập."""  # Note added
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        try:
            user = authenticate(request, username=username, password=password, backend='Web.backends.SQLServerAuthBackend')
            if user is not None:
                login(request, user)
                return redirect('home')
            else:
                messages.error(request, "Tên đăng nhập hoặc mật khẩu không đúng!")

        except Exception as e:
            print(f"Lỗi trong quá trình đăng nhập: {e}")  # Note added: In tiếng Việt
            messages.error(request, "Có lỗi xảy ra trong quá trình đăng nhập. Vui lòng thử lại sau.")

    return render(request, 'login.html')

@transaction.atomic  # Note added: Đảm bảo tính toàn vẹn dữ liệu
def register_view(request):
    """Xử lý đăng ký."""  # Note added
    if request.method == 'POST':
        user_form = CustomUserCreationForm(request.POST)
        khach_hang_form = KhachHangForm(request.POST)

        if user_form.is_valid() and khach_hang_form.is_valid():
            try:
                with transaction.atomic():
                    user = user_form.save(commit=False)
                    user.set_password(user_form.cleaned_data['password2'])
                    user.save()

                    khach_hang = khach_hang_form.save(commit=False)
                    khach_hang.user = user
                    khach_hang.save()

                    user = authenticate(request, username=user_form.cleaned_data['username'], password=user_form.cleaned_data['password2'], backend='Web.backends.SQLServerAuthBackend')
                    if user is not None:
                        login(request, user)
                        messages.success(request, "Đăng ký thành công!")
                        return redirect('home')
                    else:
                        messages.error(request, "Lỗi xác thực. Vui lòng thử lại.")  # Should not happen, but good to check

            except IntegrityError as e:
                if "UNIQUE constraint" in str(e).lower():
                    messages.error(request, "Tên người dùng hoặc email đã tồn tại.")
                else:
                    messages.error(request, "Lỗi cơ sở dữ liệu. Vui lòng thử lại.")

            except Exception as e:
                logger.exception("Lỗi không mong đợi trong quá trình đăng ký:")  # Note added: In tiếng Việt
                messages.error(request, "Có lỗi xảy ra trong quá trình đăng ký. Vui lòng thử lại sau.")

        else:
            messages.error(request, "Đăng ký thất bại. Vui lòng kiểm tra lại thông tin.")

    else:
        user_form = CustomUserCreationForm()
        khach_hang_form = KhachHangForm()

    return render(request, 'register.html', {'user_form': user_form, 'khach_hang_form': khach_hang_form})

def lay_thong_tin_khach_hang(username):
    """Lấy thông tin khách hàng."""  # Note added
    try:
        khach_hang = KhachHang.objects.get(user__username=username)
        return khach_hang
    except KhachHang.DoesNotExist:
        return None

def logout_view(request):
    """Đăng xuất."""  # Note added
    logout(request)
    messages.success(request, "Bạn đã đăng xuất thành công.")
    return redirect('login')

def datbacsi(request):
    """Đặt bác sĩ."""  # Note added
    return render(request, 'datbacsi.html')

def datxetnghiem(request):
    """Đặt xét nghiệm."""  # Note added
    return render(request, 'datxetnghiem.html')

def dattiemchung(request):
    """Đặt tiêm chủng."""  # Note added
    return render(request, 'dattiemchung.html')

def tham_gia_he_thong_nature(request):
    return render(request, 'tham_gia_he_thong_nature.html')

def tuyendung(request):
    """Tuyển dụng."""  # Note added
    return render(request, 'tuyendung.html')

def quangcao(request):
    """Quảng cáo."""  # Note added
    return render(request, 'quangcao.html')

def ve_he_thong_y_khoa_nature(request):
    return render(request, 've_he_thong_y_khoa_nature.html')

def thanhtoanvienphi(request):
    """Thanh toán viện phí."""  # Note added
    if request.method == "POST":
        patient_name = request.POST.get('patientName')
        patient_phone = request.POST.get('patientPhone')
        return redirect('home')  # Redirect after successful payment (replace with actual logic)
    return render(request, 'thanhtoanvienphi.html')

def xem_chi_tiet(request):
    """Xem chi tiết."""  # Note added
    return render(request, 'xemchitiet.html')

def dat_lich_kham(request):
    """Đặt lịch khám."""  # Note added
    return render(request, 'DatlichKham.html')

def huong_dan_dat_lich_kham(request):
    return render(request, 'huong_dan_dat_lich_kham.html')

def tu_van_video(request):
    return render(request, 'tu_van_video.html')

def quy_trinh_hoan_phi(request):
    return render(request, 'quy_trinh_hoan_phi.html')

def quy_trinh_di_kham(request):
    return render(request, 'quy_trinh_di_kham.html')

def cau_hoi_thuong_gap(request):
    return render(request, 'cau_hoi_thuong_gap.html')
    
