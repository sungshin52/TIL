from django.shortcuts import render, redirect
from .models import Album
from .forms import AlbumForm

# Create your views here.
def index(request):
    albums = Album.objects.all()
    context = {
        'albums':albums,
    }
    return render(request, 'index.html', context)

def create(request):
    if request.method == 'POST':
        form = AlbumForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('albums:index')