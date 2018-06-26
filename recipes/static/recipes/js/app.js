(function(){
    'use strict';
    
    angular.module('recipes', ['ngRoute'])
        .config(['$routeProvider', function($routeProvider) {
            $routeProvider
                .when('/myRecipes',
                    {
                        templateUrl: 'static/recipes/angularjsTemplates/my-recipes.html',
                        controller: 'MyRecipesController',
                    })
                .when('/addRecipe',
                    {
                        templateUrl: 'static/recipes/angularjsTemplates/add-recipe.html',
                        controller: 'AddRecipeController',
                    })
                .otherwise({
                    redirectTo: 'myRecipes'
                });
            }
        ]);
}());