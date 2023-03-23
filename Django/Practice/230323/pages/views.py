from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, 'index.html')

def number_print(request, number):
    context = {
        'number': number,
    }
    return render(request, 'number_print.html', context)