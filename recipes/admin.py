from django.contrib import admin

from .models import *
# Register your models here.
admin.site.register(Bookmarks)
admin.site.register(Recipes)
admin.site.register(Tags)
admin.site.register(RecipesTags)
