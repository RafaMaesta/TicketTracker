angular.module('timetracker')
.controller('LoginController', LoginCtrl)
LoginCtrl.$inject = ['$scope', '$mdToast', 'Login']
function LoginCtrl($scope, $mdToast, Login) {
    
        $scope.user = {}
        
        $scope.login = function() {
            let user = angular.copy($scope.user)
            console.log(user)
            console.log(user.login)
    
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