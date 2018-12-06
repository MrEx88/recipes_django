from django.contrib.auth.models import User
from django.utils import timezone

from rest_framework import status
from rest_framework.test import APITestCase

from .models import Bookmarks, Recipes, Tags


class UserMixin():
    def create_user_and_login(self):
        password = 'jonpassword'
        self.superuser = User.objects.create_superuser('jon', 'me@me.com', password)
        self.client.login(username=self.superuser.username, password=password)


class CreateRecipeTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.data = {
            'name': 'n',
            'instructions': '1',
            'ingredients': '1',
            'user': self.superuser.id,
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
        data['name'] = [1]
        response = self.client.post('/api/recipes/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class ReadRecipeTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.recipe = Recipes.objects.create(name='chicken',
                                             ingredients='fried',
                                             instructions='steak',
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
        self.recipe = Recipes.objects.create(name='chicken',
                                             ingredients='fried',
                                             instructions='steak',
                                             user=self.superuser)
        self.data = {
            'name': 'n',
            'instructions': '1',
            'ingredients': '1',
            'user': self.superuser.id,
            'subRecipes': []
        }

    def test_can_update_recipe(self):
        response = self.client.put('/api/recipes/{}/'.format(self.recipe.id), self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        recipe = Recipes.objects.get(pk=self.recipe.id)
        self.assertEqual(recipe.name, self.data['name'])
        self.assertEqual(recipe.ingredients, self.data['ingredients'])
        self.assertEqual(recipe.instructions, self.data['instructions'])
        self.assertNotEqual(recipe.modified, self.recipe.modified)

    def test_cant_update_non_existent_recipe(self):
        response = self.client.put('/api/recipes/{}/'.format(self.recipe.id+1), self.data, format="json")
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)

    def test_cant_update_recipe_with_wrong_type(self):
        data = dict(self.data)
        data['name'] = ['a']
        response = self.client.put('/api/recipes/{}/'.format(self.recipe.id), data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class DeleteRecipesTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.recipe = Recipes.objects.create(name='chicken',
                                             ingredients='fried',
                                             instructions='steak',
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
        self.data = [
            {
                'name': 'n',
                'instructions': '1',
                'ingredients': '1',
                'user':
                self.superuser.id,
                'subRecipes': []
            }
        ]

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
        self.data = [
            {
                'name': 'n',
                'instructions': '1',
                'ingredients': '1',
                'user':
                self.superuser.id,
                'subRecipes': []
            }
        ]

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
        self.data = {'name': 'b', 'url': 'path', 'user': self.superuser.id}

    def test_can_create_bookmark(self):
        response = self.client.post('/api/bookmarks/', self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_cant_create_an_invalid_bookmark(self):
        data = {'name': 'b'}
        response = self.client.post('/api/bookmarks/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_cant_create_bookmark_with_wrong_data_type(self):
        data = dict(self.data)
        data['name'] = ['a']
        response = self.client.post('/api/bookmarks/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_bookmark_without_http_will_be_added(self):
        response = self.client.post('/api/bookmarks/', self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['url'], 'http://' + self.data['url'])

    def test_bookmark_with_http_will_not_be_added_again(self):
        data = dict(self.data)
        data['url'] = 'http://' + data['url']
        response = self.client.post('/api/bookmarks/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['url'], data['url'])

    def test_bookmark_with_https_will_not_be_added_again(self):
        data = dict(self.data)
        data['url'] = 'https://' + data['url']
        response = self.client.post('/api/bookmarks/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['url'], data['url'])

class ReadBookmarksTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.bookmark = Bookmarks.objects.create(name='hi', url='url', user=self.superuser)

    def test_can_read_bookmark(self):
        response = self.client.get('/api/bookmarks/{}/'.format(self.bookmark.id))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['id'], self.bookmark.id)
        self.assertEqual(response.data['name'], self.bookmark.name)
        self.assertEqual(response.data['url'], self.bookmark.url)

    def test_cant_read_non_existent_bookmark(self):
        response = self.client.get('/api/bookmarks/{}/'.format(self.bookmark.id+1))
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)


class UpdateBookmarksTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.bookmark = Bookmarks.objects.create(name='hi', url='url', user=self.superuser)
        self.data = {'name': 'h', 'url': 'u', 'user': self.superuser.id}

    def test_updating_bookmark_without_http_will_add_http(self):
        response = self.client.put('/api/bookmarks/{}/'.format(self.bookmark.id), self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        bookmark = Bookmarks.objects.get(pk=self.bookmark.id)
        self.assertEqual(bookmark.name, self.data['name'])
        self.assertEqual(bookmark.url, 'http://' + self.data['url'])
        self.assertNotEqual(bookmark.modified, self.bookmark.modified)

    def test_updating_bookmark_with_http_will_not_add_http_again(self):
        data = dict(self.data)
        data['url'] = 'http://' + data['url']
        response = self.client.put('/api/bookmarks/{}/'.format(self.bookmark.id), data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        bookmark = Bookmarks.objects.get(pk=self.bookmark.id)
        self.assertEqual(bookmark.name, data['name'])
        self.assertEqual(bookmark.url, data['url'])
        self.assertNotEqual(bookmark.modified, self.bookmark.modified)

    def test_updating_bookmark_with_https_will_not_add_http_again(self):
        data = dict(self.data)
        data['url'] = 'https://' + data['url']
        response = self.client.put('/api/bookmarks/{}/'.format(self.bookmark.id), data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        bookmark = Bookmarks.objects.get(pk=self.bookmark.id)
        self.assertEqual(bookmark.name, data['name'])
        self.assertEqual(bookmark.url, data['url'])
        self.assertNotEqual(bookmark.modified, self.bookmark.modified)

    def test_cant_update_non_existent_bookmark(self):
        response = self.client.put('/api/bookmarks/{}/'.format(self.bookmark.id+1))
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)

    def test_cant_update_bookmark_with_wrong_data_type(self):
        data = dict(self.data)
        data['name'] = ['a']
        response = self.client.put('/api/bookmarks/{}/'.format(self.bookmark.id), data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class DeleteBookmarksTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.bookmark = Bookmarks.objects.create(name='hi', url='url', user=self.superuser)

    def test_can_delete_bookmark(self):
        response = self.client.delete('/api/bookmarks/{}/'.format(self.bookmark.id))
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        with self.assertRaises(Bookmarks.DoesNotExist):
            Bookmarks.objects.get(pk=self.bookmark.id)

    def test_cant_delete_non_existent_bookmark(self):
        response = self.client.delete('/api/bookmarks/{}/'.format(self.bookmark.id+1))
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)


class CreateTagsTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.data = {'name': 'new'}

    def test_can_create_tag(self):
        response = self.client.post('/api/tags/', self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_cant_create_tag_with_wrong_data_type(self):
        data = dict(self.data)
        data['name'] = [1]
        response = self.client.post('/api/tags/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class ReadTagsTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.tag = Tags.objects.create(name='new')

    def test_can_read_tag(self):
        response = self.client.get('/api/tags/{}/'.format(self.tag.id))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['id'], self.tag.id)
        self.assertEqual(response.data['name'], self.tag.name)

    def _test_cant_read_non_existent_tag(self):
        response = self.client.get('/api/tags/{}'.format(self.tag.id))
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)


class UpdateTagsTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.tag = Tags.objects.create(name='new')
        self.data = {'name': 'new1'}

    def test_can_update_tag(self):
        response = self.client.put('/api/tags/{}/'.format(self.tag.id), self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        tag = Tags.objects.get(pk=self.tag.id)
        self.assertEqual(tag.name, self.data['name'])
        self.assertNotEqual(tag.modified, self.tag.modified)

    def test_can_update_non_existent_tag(self):
        response = self.client.put('/api/tags/{}/'.format(self.tag.id+1), self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)

    def test_cant_create_tag_with_wrong_data_type(self):
        data = dict(self.data)
        data['name'] = [1]
        response = self.client.put('/api/tags/{}/'.format(self.tag.id), data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class DeleteTagsTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user_and_login()
        self.tag = Tags.objects.create(name='new')

    def test_can_delete_tag(self):
        response = self.client.delete('/api/tags/{}/'.format(self.tag.id))
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        with self.assertRaises(self.tag.DoesNotExist):
            Tags.objects.get(pk=self.tag.id)

    def test_cant_delete_non_existent_tag(self):
        response = self.client.delete('/api/tags/{}/'.format(self.tag.id+1))
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)
