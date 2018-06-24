from django.contrib.auth.models import User
from rest_framework.generics import ListAPIView

from . import serializers as szers

from . import models as mod

class UserApi(ListAPIView):
    queryset = User.objects.all()
    serializer_class = szers.UserSerializer
    
    
class BookmarkApi(ListAPIView):
    queryset = mod.Bookmarks.objects.all()
    serializer_class = szers.BookmarkSerializer
    
    
class RecipeApi(ListAPIView):
    queryset = mod.Recipes.objects.all()
    serializer_class = szers.RecipeSerializer
    
    
class TagApi(ListAPIView):
    queryset = mod.Tags.objects.all()
    serializer_class = szers.TagSerializer
