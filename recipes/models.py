import datetime

from django.contrib.auth.models import User
from django.db import models
from django.utils import timezone


class Bookmark(models.Model):
    name = models.CharField(max_length=45)
    url = models.CharField(max_length=255)
    created = models.DateTimeField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    modified = models.DateTimeField()
    
    
    def __str__(self):
        return '{{{0}: {1}}}'.format(self.id, self.name)
        
        
    class Meta:
        db_table = 'bookmarks'
        
        
class Recipe(models.Model):
    name = models.CharField(unique=True, max_length=100)
    ingredients = models.TextField()
    instructions = models.TextField(blank=True, null=True)
    imagePath = models.CharField(max_length=255, blank=True, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created = models.DateTimeField(blank=True, null=True)
    modified = models.DateTimeField()
    
    
    class Meta:
        db_table = 'recipes'
        
        
    def __str__(self):
        return '{{{0}: {1}}}'.format(self.id, self.name)
        
        
    def was_recently_add(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=7)
        
        
class Tag(models.Model):
    name = models.CharField(unique=True, max_length=255, blank=True, null=True)
    created = models.DateTimeField(blank=True, null=True)
    modified = models.DateTimeField(blank=True, null=True)
        
        
    class Meta:
        db_table = 'tags'
        
        
    def __str__(self):
        return '{{{0}: {1}}}'.format(self.id, self.name)
        
        
class RecipesTag(models.Model):
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE, primary_key=True)
    tag = models.ForeignKey(Tag, on_delete=models.CASCADE, primary_key=True)
    
    
    class Meta:
        db_table = 'recipes_tags'
        unique_together = (('recipe', 'tag'),)
        
        
    def __str__(self):
        return '{{{0}, {1}}}'.format(self.recipe.id, self.tag.id)
        
        
class RecipesUser(models.Model):
    recipe = models.ForeignKey(Recipe, on_delete=models.CASCADE, primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, primary_key=True)
    
    
    class Meta:
        db_table = "recipes_users"
        unique_together = (('recipe', 'user'),)
        
        
    def __str__(self):
        return '{{{0}, {1}}}'.format(self.recipe.id, self.user.id)
