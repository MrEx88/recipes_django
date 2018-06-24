from django.shortcuts import render, get_object_or_404
from .models import Recipe

# Create your views here.
def view(request, recipe_id):
    recpe = get_object_or_404(Recipe, pk=recipe_id)
    context = {'recipe': recpe}
    return render(request, 'recipes/view.html', context)