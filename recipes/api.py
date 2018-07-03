from django.contrib.auth.models import User

from rest_framework import permissions
from rest_framework.viewsets import ModelViewSet

from . import serializers as szers
from . import models as mod


class UserViewSet(ModelViewSet):
    queryset = User.objects.all()
    serializer_class = szers.UserSerializer
    permission_classes = (permissions.IsAuthenticated,)


class BookmarkViewSet(ModelViewSet):
    queryset = mod.Bookmarks.objects.all()
    serializer_class = szers.BookmarkSerializer
    permission_classes = (permissions.IsAuthenticated,)

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)


class RecipeViewSet(ModelViewSet):
    queryset = mod.Recipes.objects.all().order_by('modified')
    serializer_class = szers.RecipeSerializer
    permission_classes = (permissions.IsAuthenticated,)

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)


class AllRecipeViewSet(ModelViewSet):
    queryset = mod.Recipes.objects.all().order_by('modified')
    serializer_class = szers.RecipeSerializer
    http_method_names = ['get']
    permission_classes = (permissions.IsAuthenticated,)


class SubRecipeViewSet(ModelViewSet):
    queryset = mod.SubRecipes.objects.all()
    serializer_class = szers.SubRecipeSerializer
    permission_classes = (permissions.IsAuthenticated,)


class TagViewSet(ModelViewSet):
    queryset = mod.Tags.objects.all()
    serializer_class = szers.TagSerializer
    permission_classes = (permissions.IsAuthenticated,)
