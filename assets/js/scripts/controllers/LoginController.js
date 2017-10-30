angular.module('timetracker')
.controller('LoginController', LoginCtrl)
LoginCtrl.$inject = ['$scope', '$mdToast', 'Login', 'base_url']
function LoginCtrl($scope, $mdToast, Login, base_url) {
    
        $scope.user = {}
        
        $scope.getLogin = function() {
            let user = angular.copy($scope.user)
    
            if (!user.login|| !user.password) {
                $mdToast.show(
                    $mdToast.simple()
                      .textContent('User and password fields cannot be blank!')
                      .position('top right')
                      .hideDelay(3000)
                  );
            }
            else{
                Login.save({txtLogin: user.login, txtSenha: user.password}, function(data){
                    if(data['$resolved']){
                        console.log(base_url+'Home/')
                        window.location = base_url+'Home/'
                    }
                    else{
                        window.location = base_url+'Login/'
                    }
                })
                
            }
        }
    }