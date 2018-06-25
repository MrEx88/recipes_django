from rest_framework.routers import DefaultRouter

from . import views
from . import api

router = DefaultRouter()
router.register(r'bookmaks', api.BookmarkViewSet)
router.register(r'recipes', api.RecipeViewSet)
router.register(r'tags', api.TagViewSet)
router.register(r'users', api.UserViewSet)

urlpatterns = router.urls