from django.shortcuts import render

# Create your views here.
import random

def today_dinner(request):
    foods = ['치킨', '삼겹살', '냉면', '짜장면']
    picked = random.choice(foods)

    context = {
        'foods': foods,
        'picked': picked,
    }
    return render(request, 'today_dinner.html', context)

def throw(request):
    return render(request, 'throw.html')

def catch(request):
    data = request.GET.get('message')
    context = {
        'data' : data,
    }
    return render(request, 'catch.html', context)

def lotto_create(request):
    return render(request, 'lotto_create.html')

def lotto(request):
    num = request.GET.get('lotto_nums')
    nums = int(num)
    lottos = []

    for i in range (nums):
        lotto = random.sample(range(1, 46), 6)
        lottos.append(lotto)
    
    context = {
        'lottos': lottos,
    }
    return render(request, 'lotto.html', context)