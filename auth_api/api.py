from django.contrib.auth import authenticate, login, logout
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_protect

from rest_framework import status, views
from rest_framework.response import Response

from .serializers import UserSerializer


class LoginView(views.APIView):
    @method_decorator(csrf_protect)
    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')
        user = authenticate(username=username, password=password)
        if user and user.is_active:
            login(request, user)
            response = Response(UserSerializer(user).data)
        else:
            if username is None or password is None:
                response = Response({
                    'status': 'Bad Request',
                    'message': "'username' and 'password' are required fields"
                }, status=status.HTTP_400_BAD_REQUEST)
            else:
                response = Response({
                    'status': 'Unauthorized',
                    'message': 'Username or password is incorrect'
                }, status=status.HTTP_401_UNAUTHORIZED)

        return response


class LogoutView(views.APIView):
    def get(self, request):
        logout(request)
        return Response({}, status=status.HTTP_204_NO_CONTENT)


class LoggedInView(views.APIView):
    def get(self, request):
        data = {'isLoggedIn': request.user.is_authenticated}
        return Response(data, status=status.HTTP_200_OK)
