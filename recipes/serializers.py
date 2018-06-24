from django.contrib.auth.models import User
from rest_framework import serializers

from .models import Bookmarks, Recipes, RecipesTags, RecipesUsers, Tags


class BookmarkSerializer(serializers.ModelSerializer):
    
    
    class Meta:
        model = Bookmarks
        fields = '__all__'
        
        
        
class RecipeSerializer(serializers.ModelSerializer):
    
    
    class Meta:
        model = Recipes
        fields = '__all__'
        
        
class UserSerializer(serializers.ModelSerializer):
    bookmarks = BookmarkSerializer(read_only=True, many=True)
    recipes = RecipeSerializer(read_only=True, many=True)
    
    
    class Meta:
        model = User
        fields = '__all__'
        
        
class RecipesTagSerializer(serializers.ModelSerializer):
    
    
    class Meta:
        model = RecipesTags
        fields = '__all__'
        
        
class RecipesUserSerializer(serializers.ModelSerializer):
    
    
    class Meta:
        model = RecipesUsers
        fields = '__all__'
        
        
class TagSerializer(serializers.ModelSerializer):
    
    
    class Meta:
        model = Tags
        fields = '__all__'
