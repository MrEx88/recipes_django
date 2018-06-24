(function(){
    'use strict';
    
    angular.module('recipes', [])
        .controller('RecipesController', ['$scope', '$http', RecipesController]);
        
    function RecipesController($scope, $http) {
        
        $scope.recipes = [
            {
                "id": 1,
                "name": "Greek Yogurt Chicken",
                "ingredients": "chicken thighs\r\ngreek yogurt\r\nlemon\r\nrosemary\r\nsalt\r\npepper",
                "instructions": "Combine all ingredients into a plastic storage bag and mix well. After it has been marinating for 30 minutes, place in a baking dish and cook for 25-30 minutes on 420 degree.",
                "imagePath": null,
                "created": "2016-06-30T01:19:09Z",
                "modified": "2016-07-14T00:52:39Z"
            },
            {
                "id": 2,
                "name": "Oatmeal Banana Chews",
                "ingredients": "2 cups of oats\r\n3 bananas\r\n1/3 applesauce\r\n1/4 cup almond milk\r\n1 tp of vanilla\r\n1 tp cinnamon",
                "instructions": "Preheat oven to 350 degrees.\r\n\r\nFirst mash the bananas them, mix the rest of the ingredients together real well. Drop spoonfuls onto a baking sheet and bake for 15-20 minutes.",
                "imagePath": null,
                "created": "2016-07-01T22:11:48Z",
                "modified": "2016-07-01T22:11:48Z"
            },
            {
                "id": 3,
                "name": "Beef Enchiladas with Zucchini",
                "ingredients": "2lbs of ground beef\r\n1/2 an onion\r\n5-6 garlic cloves\r\n3 zucchini\r\n4 cups of grated cheese\r\n20oz of enchilada sauce",
                "instructions": "Preheat oven to 350 degrees.\r\n\r\nChop onion and garlic and cook together with ground beef. Use a vegetable peeler to peel the zucchini into strips. In a baking dish create layers of ingredients in this order: zucchini strips, beef mixture, little bit of enchilada sauce, little bit of cheese. The top layer should be covered with zucchini strips pretty well, now add the rest of the enchilada sauce and spread evenly. Bake for 30 minutes, take it out of the oven add the rest of the cheese and let set for 5 -10 minutes or until cheese is melted.",
                "imagePath": null,
                "created": "2016-07-08T00:42:57Z",
                "modified": "2016-07-08T00:42:57Z"
            }
        ];
        
        $scope.getIngredientRowCount = function(ingredients) {
            return (ingredients.match(/\r\n/g) || []).length;
        }
    }
}());