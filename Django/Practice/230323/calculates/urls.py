from django.urls import path
from . import views

urlpatterns = [
    path('calculate/<int:number1>/<int:number2>/', views.calculate),
]