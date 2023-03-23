from django.shortcuts import render

# Create your views here.
def calculate(request, number1, number2):
    number1 = int(number1)
    number2 = int(number2)
    
    sum = number1 + number2
    sub = number1 - number2
    mul = number1 * number2
    quo = number1 // number2

    context = {
        'sum': sum,
        'sub': sub,
        'mul': mul,
        'quo': quo,
    }

    return render(request, 'calculate.html', context)