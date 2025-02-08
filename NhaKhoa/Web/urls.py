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
]
