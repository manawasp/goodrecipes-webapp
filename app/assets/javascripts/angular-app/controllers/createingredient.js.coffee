angular.module('app').controller("createingredientCtrl", ($scope, $location, $cookieStore, authorization, api, ingredientService)->
  console.log 'createingredientCtrl running'
  $scope.error = ''
  $scope.ingredient = {blacklist: [], labels: [], color: "", name: ''}

  $scope.addLabel = (label) ->
    idx = $scope.ingredient.labels.indexOf(label)
    if label && label.length > 0 && idx == -1
      $scope.ingredient.labels.push label
  $scope.addBlacklist = (label) ->
    idx = $scope.ingredient.blacklist.indexOf(label)
    if label && label.length > 0 && idx == -1
      $scope.ingredient.blacklist.push label
  $scope.delLabel = (label) ->
    idx = $scope.ingredient.labels.indexOf(label)
    if idx != -1
      $scope.ingredient.labels.splice(idx, 1)
  $scope.delBlacklist = (label) ->
    idx = $scope.ingredient.blacklist.indexOf(label)
    if idx != -1
      $scope.ingredient.blacklist.splice(idx, 1)

  $scope.hide = ->
    $mdDialog.hide()

  $scope.cancel = ->
    $mdDialog.cancel()

  $scope.answer = (answer) ->
    $mdDialog.hide answer

  $scope.create_ingredient = () ->
    data = {labels: $scope.ingredient, blacklist: $scope.blacklist, name: $scope.name}
    ingredientService.create(data
    ).success((data) ->
      console.log "sucees modif"
      console.log data
    ).error((data) ->
      console.log "echec modif"
      console.log data
    )
)