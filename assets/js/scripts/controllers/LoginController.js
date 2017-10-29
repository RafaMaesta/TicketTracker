angular.module('timetracker')
.controller('LoginController', LoginCtrl)
LoginCtrl.$inject = ['$scope', '$mdToast', 'Login']
function LoginCtrl($scope, $mdToast, Login) {
    
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
                    console.log(data)
                })
            }
        }
    }