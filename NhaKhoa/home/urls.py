from django.contrib import admin
from django.urls import include, path
from . import views
urlpatterns = [
    path('book/', views.book_appointment, name='book_appointment'),
    path('success/', views.success, name='success'),
    path('', views.home, name='home'),
]