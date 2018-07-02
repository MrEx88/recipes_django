from rest_framework.routers import DefaultRouter

from . import views
from . import api

router = DefaultRouter()
router.register(r'bookmarks', api.BookmarkViewSet)
router.register(r'recipes', api.RecipeViewSet)
router.register(r'allRecipes', api.AllRecipeViewSet)
router.register(r'tags', api.TagViewSet)
router.register(r'users', api.UserViewSet)

urlpatterns = router.urls
