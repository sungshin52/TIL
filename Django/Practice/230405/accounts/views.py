from django.shortcuts import render, redirect
from django.contrib.auth.forms import AuthenticationForm, PasswordChangeForm
from django.contrib.auth import login as auth_login
from django.contrib.auth import logout as auth_logout
from django.contrib.auth import update_session_auth_hash
from .forms import CustomUserCreationForm, CustomUserChangeForm

# Create your views here.
def index(request):
    return render(request, 'index.html')

def login(request):
    if request.user.is_authenticated:
        return redirect('accounts:index')

    if request.method == 'POST':
        form = AuthenticationForm(request, request.POST)

        if form.is_valid():
            auth_login(request, form.get_user())
            return redirect('accounts:index')
        
    else:
        form = AuthenticationForm()
    
    context = {
        'form': form,
    }
    return render(request, 'login.html', context)

def logout(request):
    auth_logout(request)
    return redirect('accounts:index')

def signup(request):
    if request.user.is_authenticated:
        return redirect('accounts:index')

    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            auth_login(request, user)
            return redirect('accounts:index')

    else:
        form = CustomUserCreationForm()

    context = {
        'form': form,
    }

    return render(request, 'signup.html', context)

def delete(request):
    request.user.delete()
    return redirect('accounts:index')

def update(request):
    if request.method == 'POST':
        form = CustomUserChangeForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('accounts:index')

    else:
        form = CustomUserChangeForm(instance=request.user)

    context = {
        'form': form,
    }

    return render(request, 'update.html', context)

def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            return redirect('accounts:index')

    else:
        form = PasswordChangeForm(request.user)

    context = {
        'form': form,
    }

    return render(request, 'change_password.html', context)