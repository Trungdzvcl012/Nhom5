from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', views.home, name='home'),
    path('book/<int:clinic_id>/', views.book_appointment, name='book_appointment'),
    path('login/', views.login_view, name='login'),
    path('register/', views.register_view, name='register'),
    path('logout/', views.logout_view, name='logout'),
    path('datbacsi/', views.datbacsi, name='datbacsi'),
    path('datxetnghiem/', views.datxetnghiem, name='datxetnghiem'),
    path('dattiemchung/', views.dattiemchung, name='dattiemchung'),
    path('tuyendung/', views.tuyendung, name='tuyendung'),
    path('quangcao/', views.quangcao, name='quangcao'),
    path('thanhtoan/', views.thanhtoanvienphi, name='thanhtoanvienphi'),
    path('xemchitiet/', views.xem_chi_tiet, name='xemchitiet'),
    path('dat-lich-kham/', views.dat_lich_kham, name='datlichkham'),
    path('tham-gia-he-thong-nature/', views.tham_gia_he_thong_nature, name='tham_gia_he_thong_nature'),
    path('ve-he-thong-y-khoa-nature/', views.ve_he_thong_y_khoa_nature, name='ve_he_thong_y_khoa_nature'),
    path('huong_dan_dat-lich-kham/', views.huong_dan_dat_lich_kham, name='huong_dan_dat_lich_kham'),
    path('tu-van-video/', views.tu_van_video, name='tu_van_video'),
    path('quy-trinh-hoan-phi/', views.quy_trinh_hoan_phi, name='quy_trinh_hoan_phi'),
    path('quy-trinh-di-kham/', views.quy_trinh_di_kham, name='quy_trinh_di_kham'),
    path('cau-hoi-thuong-gap/', views.cau_hoi_thuong_gap, name='cau_hoi_thuong_gap'),

]
