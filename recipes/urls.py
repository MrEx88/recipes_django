from django.urls import path
from django.views.generic import TemplateView

from . import views
from . import api

urlpatterns = [
    path('', TemplateView.as_view(template_name='recipes/index.html')),
    path('<int:recipe_id>/', views.view, name='view'),
    path('bookmarks', api.BookmarkApi.as_view(), name='bookmarks'),
    path('recipes', api.RecipeApi.as_view(), name='recipes'),
    path('tags', api.TagsApi.as_view(), name='tags'),
]