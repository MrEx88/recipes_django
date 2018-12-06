from django.contrib.auth.models import User
from django.utils import timezone

from rest_framework import serializers

from .models import Bookmarks, Recipes, RecipesUsers, SubRecipes, Tags

def _set_time(*args):
    now = timezone.now()
    for a in args:
        a = now

def _has_http(url):
     return url.startswith('http://') or url.startswith('https://')

class BookmarkSerializer(serializers.ModelSerializer):

    class Meta:
        model = Bookmarks
        fields = '__all__'

    def create(self, validated_data):
        bookmark = Bookmarks.objects.create(**validated_data)
        if not _has_http(bookmark.url):
            bookmark.url = 'http://' + bookmark.url
        _set_time(bookmark.created, bookmark.modified)
        bookmark.save()
        return bookmark

    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.url = validated_data.get('url', instance.url)
        if not _has_http(instance.url):
            instance.url = 'http://' + instance.url
        _set_time(instance.modified)
        instance.save()
        return instance


class SubRecipeSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(required=False)

    class Meta:
        model = SubRecipes
        fields = '__all__'
        extra_kwargs = {
            'name': {'validators': []},
        }


class TagSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tags
        fields = '__all__'


class RecipeSerializer(serializers.ModelSerializer):
    subRecipes = SubRecipeSerializer(many=True, read_only=False)
    tags = TagSerializer(many=True, read_only=True)

    class Meta:
        model = Recipes
        fields = '__all__'

    def create(self, validated_data):
        sub_recipes = validated_data.pop('subRecipes')
        for data in sub_recipes:
            sub_recipe = SubRecipes.objects.create(**data)
            sub_recipe.save()
        recipe = Recipes.objects.create(**validated_data)
        _set_time(recipe.created, recipe.modified)
        recipe.save()
        return recipe

    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.ingredients = validated_data.get('ingredients', instance.name)
        instance.instructions = validated_data.get('instructions', instance.instructions)
        instance.imagePath = validated_data.get('imagePath', instance.imagePath)
        _set_time(instance.modified)
        instance.save()

        sub_recipes = validated_data.pop('subRecipes')
        for data in sub_recipes:
            id = data.get('id', None)
            if id:
                sub_recipe = SubRecipes.objects.get(id=id)
                sub_recipe.name = data.get('name', sub_recipe.name)
                sub_recipe.ingredients = data.get('ingredients', sub_recipe.ingredients)
                sub_recipe.instructions = data.get('instructions', sub_recipe.instructions)
                sub_recipe.save()
            else:
                SubRecipes.objects.create(**data)

        return instance


class UserSerializer(serializers.ModelSerializer):
    bookmarks = BookmarkSerializer(read_only=True, many=True)
    recipes = RecipeSerializer(read_only=True, many=True)

    class Meta:
        model = User
        fields = ('id', 'name')


class RecipesUserSerializer(serializers.ModelSerializer):

    class Meta:
        model = RecipesUsers
        fields = '__all__'
