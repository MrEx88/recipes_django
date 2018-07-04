from django.contrib.auth.models import User

from rest_framework import status
from rest_framework.test import APITestCase


class UserMixin():
    def create_user(self):
        password = 'jonpassword'
        self.superuser = User.objects.create_superuser('jon', 'me@me.com', password)
        self.data = {'username': self.superuser.username, 'password': password}


class LoginTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user()

    def test_can_login(self):
        response = self.client.post('/auth_api/login/', self.data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_cant_login_with_wrong_password(self):
        data = dict(self.data)
        data['password'] = 'pass'
        response = self.client.post('/auth_api/login/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_cant_login_with_non_existent_user(self):
        data = {'username': 'n', 'password': 'password'}
        response = self.client.post('/auth_api/login/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

    def test_cant_login_with_bad_request(self):
        data = {'uno': 1}
        response = self.client.post('/auth_api/login/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


class LogoutTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user()
        self.client.login(username=self.superuser.username, password=self.superuser.password)

    def test_can_logout(self):
        response = self.client.get('/auth_api/logout/')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)


class LoggedInTests(APITestCase, UserMixin):
    def setUp(self):
        self.create_user()
        self.client.login(username=self.superuser.username, password=self.superuser.password)

    def test_can_loggedIn(self):
        response = self.client.get('/auth_api/loggedIn/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_can_loggedIn_when_logged_out(self):
        self.client.logout()
        response = self.client.get('/auth_api/loggedIn/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
