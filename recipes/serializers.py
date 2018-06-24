from django.contrib.auth.models import User
from rest_framework import serializers

from .models import Bookmark, Recipe, RecipesTag, RecipesUser, Tag


class UserSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = User
        fields = '__all__'
        
        
class BookmarkSerializer(serializers.ModelSerializer):
    users = UserSerializer(read_only=True, many=True)
    
    class Meta:
        model = Bookmark
        fields = '__all__'
        
        
class RecipeSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Recipe
        fields = '__all__'
        
        
class RecipesTagSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = RecipesTag
        fields = '__all__'
        
        
class RecipesUserSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = RecipesUser
        fields = '__all__'
        
        
class TagsSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Tag
        fields = '__all__'
