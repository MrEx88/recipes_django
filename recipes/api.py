from django.contrib.auth.models import User
from rest_framework.viewsets import ModelViewSet

from . import serializers as szers

from . import models as mod

class UserViewSet(ModelViewSet):
    queryset = User.objects.all()
    serializer_class = szers.UserSerializer
    
    
class BookmarkViewSet(ModelViewSet):
    queryset = mod.Bookmarks.objects.all()
    serializer_class = szers.BookmarkSerializer
    
    
class RecipeViewSet(ModelViewSet):
    queryset = mod.Recipes.objects.all()
    serializer_class = szers.RecipeSerializer
    
    
class TagViewSet(ModelViewSet):
    queryset = mod.Tags.objects.all()
    serializer_class = szers.TagSerializer
