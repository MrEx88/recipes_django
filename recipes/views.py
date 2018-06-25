from django.shortcuts import render, get_object_or_404
from .models import Recipes


def view(request, recipe_id):
    recipe = get_object_or_404(Recipes, pk=recipe_id)
    context = {'recipe': recipe}
    return render(request, 'recipes/view.html', context)
