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
        self.data = {
            'name': 'n',
            'instructions': '1',
            'ingredients': '1',
            'created': now,
            'modified': now,
            'user':
            self.superuser.id,
            'subRecipes': []
        }

    def test_can_create_recipe(self):
        response = self.client.post('/api/recipes/', self.data, format='json')
        self.assertEquals(response.status_code, status.HTTP_201_CREATED)

    def test_cant_create_invalid_recipe(self):
        data = {'name': 'n'}
        response = self.client.post('/api/recipes/', data, format='json')
        self.assertEquals(response.status_code, status.HTTP_400_BAD_REQUEST)


class ReadRecipeTests(APITestCase):
    def setUp(self):
        self.superuser = User.objects.create_superuser('john', 'john@snow.com', 'johnpassword')
        self.client.login(username='john', password='johnpassword')
        now = timezone.now()
        self.recipe = Recipes.objects.create(name='chicken',
                                             ingredients='fried',
                                             instructions='steak',
                                             created=now,
                                             modified=now,
                                             user_id=self.superuser.id)

    def test_can_get_recipe(self):
        response = self.client.get('/api/recipes/{}/'.format(self.recipe.id))
        self.assertEquals(response.status_code, status.HTTP_200_OK)
        self.assertEquals(response.data['id'], self.recipe.id)
        self.assertEquals(response.data['name'], self.recipe.name)
        self.assertEquals(response.data['ingredients'], self.recipe.ingredients)
        self.assertEquals(response.data['instructions'], self.recipe.instructions)

    def test_cant_get_non_existent_recipe(self):
        response = self.client.get('/api/recipes/{}/'.format(self.recipe.id+1))
        self.assertEquals(response.status_code, status.HTTP_404_NOT_FOUND)


class UpdateRecipesTests(APITestCase):
    def setUp(self):
        self.superuser = User.objects.create_superuser('john', 'john@snow.com', 'johnpassword')
        self.client.login(username='john', password='johnpassword')
        self.now = timezone.now()
        self.recipe = Recipes.objects.create(name='chicken',
                                             ingredients='fried',
                                             instructions='steak',
                                             created=self.now,
                                             modified=self.now,
                                             user_id=self.superuser.id)
        self.data = {
            'name': 'n',
            'instructions': '1',
            'ingredients': '1',
            'created': now,
            'modified': now,
            'user':
            self.superuser.id,
            'subRecipes': []
        }

    def test_can_update_recipe(self):
        response = self.client.put('/api/recipes/{}/'.format(self.recipe.id), self.data, format='json')
        self.assertEquals(response.status_code, status.HTTP_200_OK)
        recipe = Recipes.objects.get(pk=self.recipe.id)
        self.assertEquals(recipe.name, self.data['name'])
        self.assertEquals(recipe.ingredients, self.data['ingredients'])
        self.assertEquals(recipe.instructions, self.data['instructions'])
        self.assertNotEquals(recipe.modified, self.now)

    def test_cant_update_non_existent_recipe(self):
        response = self.client.put('/api/recipes/{}/'.format(self.recipe.id+1))
        self.assertEquals(response.status_code, status.HTTP_404_NOT_FOUND)


class DeleteRecipesTests(APITestCase):
    def setUp(self):
        self.superuser = User.objects.create_superuser('john', 'john@snow.com', 'johnpassword')
        self.client.login(username='john', password='johnpassword')
        self.now = timezone.now()
        self.recipe = Recipes.objects.create(name='chicken',
                                             ingredients='fried',
                                             instructions='steak',
                                             created=self.now,
                                             modified=self.now,
                                             user_id=self.superuser.id)

    def test_can_delete_recipe(self):
        response = self.client.delete('/api/recipes/{}/'.format(self.recipe.id))
        self.assertEquals(response.status_code, status.HTTP_204_NO_CONTENT)
        with self.assertRaises(Recipes.DoesNotExist):
            Recipes.objects.get(pk=self.recipe.id)


class CreateAllRecipesTests(APITestCase):
    def setUp(self):
        self.superuser = User.objects.create_superuser('john', 'john@snow.com', 'johnpassword')
        self.client.login(username='john', password='johnpassword')
        now = timezone.now()
        self.data = [{
            'name': 'n',
            'instructions': '1',
            'ingredients': '1',
            'created': now,
            'modified': now,
            'user':
            self.superuser.id,
            'subRecipes': []
        }]

    def test_cant_create_all_recipes(self):
        response = self.client.post('/api/allRecipes/', self.data, format='json')
        self.assertEquals(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)


class ReadAllRecipesTests(APITestCase):
    def setUp(self):
        self.superuser = User.objects.create_superuser('john', 'john@snow.com', 'johnpassword')
        self.client.login(username='john', password='johnpassword')

    def test_can_read_all_recipes(self):
        response = self.client.get('/api/allRecipes/')
        self.assertEquals(response.status_code, status.HTTP_200_OK)


class UpdateAllRecipesTests(APITestCase):
    def setUp(self):
        self.superuser = User.objects.create_superuser('john', 'john@snow.com', 'johnpassword')
        self.client.login(username='john', password='johnpassword')
        now = timezone.now()
        self.data = [{
            'name': 'n',
            'instructions': '1',
            'ingredients': '1',
            'created': now,
            'modified': now,
            'user':
            self.superuser.id,
            'subRecipes': []
        }]

    def test_cant_update_all_recipes(self):
        response = self.client.put('/api/allRecipes/', self.data, format='json')
        self.assertEquals(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)


class DeleteAllRecipesTests(APITestCase):
    def setUp(self):
        self.superuser = User.objects.create_superuser('john', 'john@snow.com', 'johnpassword')
        self.client.login(username='john', password='johnpassword')

    def test_cant_delete_all_recipes(self):
        response = self.client.delete('/api/allRecipes/')
        self.assertEquals(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)
