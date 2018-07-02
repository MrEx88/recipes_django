(function() {
    'use strict';
    
    angular.module('recipes', ['ngRoute'])
          .run(['$http', function($http) {
              $http.defaults.xsrfHeaderName = 'X-CSRFToken';
              $http.defaults.xsrfCookieName = 'csrftoken';
          }])
          .config(['$routeProvider', function($routeProvider) {
              $routeProvider
                  .when('/login/', {
                      templateUrl: '/static/html/login.html',
                      controller: 'LoginController',
                  })
                  .when('/myRecipes/',
                      {
                          templateUrl: '/static/html/recipes.html',
                          controller: 'RecipesController',
                      })
                  .when('/allRecipes/',
                  {
                      templateUrl: '/static/html/recipes.html',
                      controller: 'RecipesController',
                  })
                  .when('/addRecipe/',
                      {
                          templateUrl: '/static/html/add-recipe.html',
                          controller: 'AddRecipeController',
                      })
                  .otherwise({
                      redirectTo: '/myRecipes/'
                  });
              }
          ]);
}());