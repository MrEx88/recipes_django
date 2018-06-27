from django.contrib.auth.models import User
from rest_framework import serializers

from .models import Bookmarks, Recipes, RecipesTags, RecipesUsers, SubRecipes, Tags


class BookmarkSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Bookmarks
        fields = '__all__'
        
        
class SubRecipeSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)
    
    class Meta:
        model = SubRecipes
        fields = '__all__'
        extra_kwargs = {
            'name': {'validators': []},
        }
        
        
class RecipeSerializer(serializers.ModelSerializer):
    subRecipes = SubRecipeSerializer(many=True, read_only=False)
    
    class Meta:
        model = Recipes
        fields = '__all__'
        
    def update(self, instance, validated_data):
        instance.save()
        
        sub_recipes = validated_data.pop('subRecipes')
        for data in sub_recipes:
            id = data.get('id', None)
            if id:
                sub_recipe = SubRecipes.objects.get(id=id)
                sub_recipe.name = data.get('name', sub_recipe.name)
                sub_recipe.ingredients = data.get('ingredients', sub_recipe.ingredients)
                sub_recipe.insructions = data.get('instructions', sub_recipe.insructions)
                sub_recipe.save()
            else:
                SubRecipes.objects.create(**data)
                
        return instance
        
        
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
