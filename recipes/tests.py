from django.contrib.auth.models import User
from django.urls import include, path, reverse
from django.utils import timezone

from rest_framework import status
from rest_framework.test import APITestCase

from .models import Recipes

class CreateRecipeTests(APITestCase):
    def setUp(self):
        self.superuser = User.objects.create_superuser('john', 'john@snow.com', 'johnpassword')
        self.client.login(username='john', password='johnpassword')
        now = timezone.now()
        self.data = {'name': 'n', 'instructions': '1', 'ingredients': '1', 'created': now, 'modified': now, 'user': self.superuser.id, 'subRecipes': []}

    def test_can_create_recipe(self):
        response = self.client.post('/api/recipes/', self.data, format='json')
        self.assertEquals(response.status_code, status.HTTP_201_CREATED)

    def test_can_only_create_recipe_for_logged_in_user(self):
        pass


class ReadRecipeTests(APITestCase):
    def setUp(self):
        self.superuser = User.objects.create_superuser('john', 'john@snow.com', 'johnpassword')
        self.client.login(username='john', password='johnpassword')
        now = timezone.now()
        self.recipe = Recipes.objects.create(name='chicken', ingredients='fried', instructions='steak', created=now, modified=now, user_id=self.superuser.id)

    def test_can_get_recipe(self):
        response = self.client.get('/api/recipes/{}/'.format(self.recipe.id))
        self.assertEquals(response.status_code, status.HTTP_200_OK)
        self.assertEquals(response.data['id'], self.recipe.id)
        self.assertEquals(response.data['name'], self.recipe.name)
        self.assertEquals(response.data['ingredients'], self.recipe.ingredients)
        self.assertEquals(response.data['instructions'], self.recipe.instructions)
