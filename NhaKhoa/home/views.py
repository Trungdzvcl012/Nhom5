from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.urls import path
from .models import Appointment
from .forms import AppointmentForm

# Views

def home(request):
    return render(request, 'home.html')

def book_appointment(request):
    if request.method == 'POST':
        form = AppointmentForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('success')
    else:
        form = AppointmentForm()
    return render(request, 'book_appointment.html', {'form': form})

def success(request):
    return render(request, 'success.html')