(function() {
    angular.module('recipes').factory('recipesService', ['$http', '$location', function($http, $location) {
        return {
            getUsersRecipes: function() {
                //todo: need to add user id some how. Or do I. maybe i can do it in django
                return $http.get('/api/recipes/')
                            .then(function(response) {
                                return response.data;
                            })
                            .catch(function(response) {
                                if (response.status == 403) {
                                    $location.path('/login/');
                                }
                                return [];
                            });
            },
            addRecipe: function(recipe) {
                return $http.post('/api/recipes/', recipe)
                            .then(function(response) {
                                return response.data;
                            });
            }
        };
    }]);
})();