(function() {
    angular.module('recipes').service('recipesService', ['$http', '$location', function($http, $location) {
        var self = this;
        self.shared = [];
            this.getUsersRecipes = function() {
                //todo: need to add user id some how. Or do I. maybe i can do it in django
                return $http.get('/api/recipes/')
                            .then(function(response) {
                                self.shared = response.data;
                                return response.data;
                            })
                            .catch(function(response) {
                                if (response.status == 403) {
                                    $location.path('/login/');
                                }
                                return [];
                            });
            }

            this.addRecipe = function(recipe) {
                return $http.post('/api/recipes/', recipe)
                            .then(function(response) {
                                self.shared.push(response.data);
                                return response.data;
                            });
            }
    }]);
})();