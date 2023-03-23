from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('number-print/<int:number>/', views.number_print, name='number-print'),
]