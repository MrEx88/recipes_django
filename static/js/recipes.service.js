(function() {
    angular.module('recipes').factory('recipesService', ['$http', function($http) {
        return {
            getUsersBookmarks: function() {
                //todo: need to add user id some how. Or do I. maybe i can do it in django
                return $http.get('/api/bookmarks/')
                            .then(function(response) {
                                return response.data;
                            });
            },
            getUsersRecipes: function() {
                //todo: need to add user id some how. Or do I. maybe i can do it in django
                return $http.get('/api/recipes/')
                            .then(function(response) {
                                return response.data;
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