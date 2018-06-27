import datetime

from django.contrib.auth.models import User
from django.db import models
from django.utils import timezone


class Bookmarks(models.Model):
    name = models.CharField(max_length=100)
    url = models.CharField(max_length=255)
    created = models.DateTimeField()
    modified = models.DateTimeField()
    user = models.ForeignKey(User, related_name='bookmarks', on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'bookmarks'
        
    def __str__(self):
        return '{{{0}: {1}}}'.format(self.id, self.name)
        
        
class Recipes(models.Model):
    name = models.CharField(unique=True, max_length=100)
    ingredients = models.TextField()
    instructions = models.TextField(blank=True, null=True)
    imagepath = models.CharField(db_column='imagePath', max_length=255, blank=True, null=True)
    created = models.DateTimeField(blank=True, null=True)
    modified = models.DateTimeField()
    user = models.ForeignKey(User, related_name='recipes', on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'recipes'
        
    def __str__(self):
        return '{{{0}: {1}}}'.format(self.id, self.name)
        
    def was_recently_add(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=7)
        
        
class SubRecipes(models.Model):
    name = models.CharField(unique=True, max_length=100)
    ingredients = models.TextField()
    instructions = models.TextField(blank=True, null=True)
    recipe = models.ForeignKey(Recipes, related_name='subRecipes', on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'SubRecipes'
        
    def __str__(self):
        return '{{{0}: {1}}}'.format(self.id, self.name)
        
        
class Tags(models.Model):
    name = models.CharField(unique=True, max_length=255, blank=True, null=True)
    created = models.DateTimeField(blank=True, null=True)
    modified = models.DateTimeField(blank=True, null=True)
    
    class Meta:
        db_table = 'tags'
        
    def __str__(self):
        return '{{{0}: {1}}}'.format(self.id, self.name)
        
        
class RecipesTags(models.Model):
    recipe = models.ForeignKey(Recipes, related_name='tagsRecipe', on_delete=models.CASCADE, primary_key=True)
    tag = models.ForeignKey(Tags, related_name='recipesTag', on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'recipes_tags'
        unique_together = (('recipe', 'tag'),)
        
    def __str__(self):
        return '{{{0}, {1}}}'.format(self.recipe.id, self.tag.id)
        
        
class RecipesUsers(models.Model):
    recipes = models.ForeignKey(Recipes, related_name='usersRecipe', on_delete=models.CASCADE, primary_key=True)
    users = models.ForeignKey(User, related_name='recipesUser', on_delete=models.CASCADE)
    
    class Meta:
        db_table = 'recipes_users'
        unique_together = (('recipes', 'users'),)
        
    def __str__(self):
        return '{{{0}, {1}}}'.format(self.recipe.id, self.user.id)
