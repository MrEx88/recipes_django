from rest_framework.generics import ListAPIView

#from .serializers import UserSerializer, BookmarkSerializer, RecipeSerializer, RecipesTagSerializer, RecipesUserSerializer, TagsSerializer
from . import serializers as szers

from . import models as mod

class UserApi():
    pass
    
    
class BookmarkApi(ListAPIView):
    queryset = mod.Bookmark.objects.all()
    serializer_class = szers.BookmarkSerializer
    
    
class RecipeApi(ListAPIView):
    queryset = mod.Recipe.objects.all()
    serializer_class = szers.RecipeSerializer
    
    
class TagsApi(ListAPIView):
    queryset = mod.Tag.objects.all()
    serializer_class = szers.TagsSerializer
