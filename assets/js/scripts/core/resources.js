angular.module('timetracker')
.factory('Login', LoginResource)
.constant('base_url', 'http://127.0.0.1/TimeTracker/');

LoginResource.$inject = ['$resource', 'base_url'];
function LoginResource($resource, base_url){
    return $resource(base_url+'Check/')
}

