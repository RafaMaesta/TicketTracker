angular.module('timetracker')
.factory('Login', LoginResource);


LoginResource.$inject = ['$resource'];
function LoginResource($resource){
    return $resource('./Check/')
}

