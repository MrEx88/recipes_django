from django.contrib.auth.models import User
from django.urls import include, path, reverse
from django.utils import timezone

from rest_framework import status
from rest_framework.test import APITestCase

from .models import Bookmarks, Recipes


class UserMixin():
    def create_user_and_login(self):
        password = 'jonpassword'
        self.superuser = User.objects.create_superuser('jon', 'me@me.com', password)
        self.client.login(username=self.superuser.username, password=password)


class CreateRecipeTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
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
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_cant_create_invalid_recipe(self):
        data = {'name': 'n'}
        response = self.client.post('/api/recipes/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_cant_create_recipe_with_wrong_type(self):
        data = dict(self.data)
        data['created'] = 1
        response = self.client.post('/api/recipes/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class ReadRecipeTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        now = timezone.now()
        self.recipe = Recipes.objects.create(name='chicken',
                                             ingredients='fried',
                                             instructions='steak',
                                             created=now,
                                             modified=now,
                                             user=self.superuser)

    def test_can_get_recipe(self):
        response = self.client.get('/api/recipes/{}/'.format(self.recipe.id))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['id'], self.recipe.id)
        self.assertEqual(response.data['name'], self.recipe.name)
        self.assertEqual(response.data['ingredients'], self.recipe.ingredients)
        self.assertEqual(response.data['instructions'], self.recipe.instructions)

    def test_cant_get_non_existent_recipe(self):
        response = self.client.get('/api/recipes/{}/'.format(self.recipe.id+1))
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)


class UpdateRecipesTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.now = timezone.now()
        self.recipe = Recipes.objects.create(name='chicken',
                                             ingredients='fried',
                                             instructions='steak',
                                             created=self.now,
                                             modified=self.now,
                                             user=self.superuser)
        self.data = {
            'name': 'n',
            'instructions': '1',
            'ingredients': '1',
            'created': self.now,
            'modified': self.now,
            'user':
            self.superuser.id,
            'subRecipes': []
        }

    def test_can_update_recipe(self):
        response = self.client.put('/api/recipes/{}/'.format(self.recipe.id), self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        recipe = Recipes.objects.get(pk=self.recipe.id)
        self.assertEqual(recipe.name, self.data['name'])
        self.assertEqual(recipe.ingredients, self.data['ingredients'])
        self.assertEqual(recipe.instructions, self.data['instructions'])
        self.assertNotEqual(recipe.modified, self.now)

    def test_cant_update_non_existent_recipe(self):
        response = self.client.put('/api/recipes/{}/'.format(self.recipe.id+1), self.data, format="json")
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)

    def test_cant_update_recipe_with_wrong_type(self):
        data = dict(self.data)
        data['created'] = 1
        response = self.client.put('/api/recipes/{}/'.format(self.recipe.id), data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class DeleteRecipesTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.now = timezone.now()
        self.recipe = Recipes.objects.create(name='chicken',
                                             ingredients='fried',
                                             instructions='steak',
                                             created=self.now,
                                             modified=self.now,
                                             user=self.superuser)

    def test_can_delete_recipe(self):
        response = self.client.delete('/api/recipes/{}/'.format(self.recipe.id))
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        with self.assertRaises(Recipes.DoesNotExist):
            Recipes.objects.get(pk=self.recipe.id)

    def test_deleting_recipe_that_doesnt_exist_returns_404(self):
        response = self.client.delete('/api/recipes/{}/'.format(self.recipe.id+1))
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)


class CreateAllRecipesTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
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
        self.assertEqual(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)


class ReadAllRecipesTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()

    def test_can_read_all_recipes(self):
        response = self.client.get('/api/allRecipes/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)


class UpdateAllRecipesTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
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
        self.assertEqual(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)


class DeleteAllRecipesTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()

    def test_cant_delete_all_recipes(self):
        response = self.client.delete('/api/allRecipes/')
        self.assertEqual(response.status_code, status.HTTP_405_METHOD_NOT_ALLOWED)


class CreateBookmarksTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        now = timezone.now()
        self.data = {'name': 'b', 'url': 'path', 'created': now, 'modified': now, 'user': self.superuser.id}

    def test_can_create_bookmark(self):
        response = self.client.post('/api/bookmarks/', self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_cant_create_an_invalid_bookmark(self):
        data = {'name': 'b'}
        response = self.client.post('/api/bookmarks/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_cant_create_bookmark_with_wrond_data_type(self):
        data = dict(self.data)
        data['created'] = 1
        response = self.client.post('/api/bookmarks/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class ReadBookmarksTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        now = timezone.now()
        self.bookmark = Bookmarks.objects.create(name='hi', url='url', created=now, modified=now, user=self.superuser)

    def test_can_read_bookmark(self):
        response = self.client.get('/api/bookmarks/{}/'.format(self.bookmark.id))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_cant_read_non_existent_bookmark(self):
        response = self.client.get('/api/bookmarks/{}/'.format(self.bookmark.id+1))
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)


class UpdateBookmarksTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        now = timezone.now()
        self.bookmark = Bookmarks.objects.create(name='hi', url='url', created=now, modified=now, user=self.superuser)
        self.data = {'name': 'h', 'url': 'u', 'created': now, 'modified': now, 'user': self.superuser.id}

    def test_can_update_bookmark(self):
        response = self.client.put('/api/bookmarks/{}/'.format(self.bookmark.id), self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_cant_update_non_existent_bookmark(self):
        response = self.client.put('/api/bookmarks/{}/'.format(self.bookmark.id+1))
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)

    def test_cant_update_bookmark_with_wrong_data_type(self):
        data = dict(self.data)
        data['created'] = 1
        response = self.client.put('/api/bookmarks/{}/'.format(self.bookmark.id), data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class DeleteBookmarksTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        now = timezone.now()
        self.bookmark = Bookmarks.objects.create(name='hi', url='url', created=now, modified=now, user=self.superuser)

    def test_can_delete_bookmark(self):
        response = self.client.delete('/api/bookmarks/{}/'.format(self.bookmark.id))
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        with self.assertRaises(Bookmarks.DoesNotExist):
            Bookmarks.objects.get(pk=self.bookmark.id)

    def test_cant_delete_non_existent_bookmark(self):
        response = self.client.delete('/api/bookmarks/{}/'.format(self.bookmark.id+1))
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)
