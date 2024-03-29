<%@ page import="main.helper.Const" %>
<!DOCTYPE HTML>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>${userModel.name} ${userModel.surname}</title>

    <jsp:include page="include/angular_common.jsp"/>
</head>

<body ng-app="BaseApp" ng-cloak>

<jsp:include page="include/toolbar.jsp">
    <jsp:param name="title" value="${userModel.name.concat(' ').concat(userModel.surname)}"/>
</jsp:include>

<md-content ng-controller="PageController as ctrl"
            layout-padding
            layout="column"
            style="background: #e8e8e8">
    <div layout="row"
         layout-wrap
         layout-align="center">

        <div flex="70"
             flex-xs="100"
             layout-padding
             style="height: 200px"
             layout="row"
             layout-align="start end"
             md-colors="{backgroundColor: 'default-primary-500'}">
            <h1 ng-if="isMyPage">{{user.name}} {{user.surname}} {{user.middleName}} (me)</h1>
            <h1 ng-if="!isMyPage">{{user.name}} {{user.surname}} {{user.middleName}}</h1>
        </div>

        <div md-whiteframe="16"
             flex="70"
             flex-xs="100">
            <section class="list-holder">
                <md-list>
                    <md-subheader class="md-primary">Main info</md-subheader>

                    <md-list-item class="md-2-line">
                        <md-icon md-svg-icon="account-card-details"></md-icon>

                        <div class="md-list-item-text">
                            <h3 ng-if="user.name">
                                {{user.name}} {{user.surname}} {{user.middleName}}
                            </h3>
                            <h3 ng-if="!user.name">- Not specified -</h3>

                            <p>Name</p>
                        </div>
                    </md-list-item>

                    <md-list-item class="md-2-line">
                        <md-icon md-svg-icon="email"></md-icon>

                        <div class="md-list-item-text">
                            <h3 ng-if="user.email">
                                {{user.email}}</h3>
                            <h3 ng-if="!user.email">- Not specified -</h3>

                            <p>Email</p>
                        </div>
                    </md-list-item>
                </md-list>
            </section>

            <section class="list-holder">
                <md-list flex>
                    <md-subheader class="md-primary">Passport info</md-subheader>

                    <md-list-item class="md-2-line">
                        <md-icon md-svg-icon="human"></md-icon>

                        <div class="md-list-item-text">
                            <h3 ng-if="user.userData.passportSeries">
                                {{user.userData.passportSeries}}</h3>
                            <h3 ng-if="!user.userData.passportSeries">- Not specified -</h3>

                            <p>Series</p>
                        </div>
                    </md-list-item>

                    <md-list-item class="md-2-line">
                        <md-icon md-svg-icon="human-handsup"></md-icon>

                        <div class="md-list-item-text">
                            <h3 ng-if="user.userData.passportNumber">
                                {{user.userData.passportNumber}}</h3>
                            <h3 ng-if="!user.userData.passportNumber">- Not specified -</h3>

                            <p>Number</p>
                        </div>
                    </md-list-item>

                    <md-list-item class="md-2-line">
                        <md-icon md-svg-icon="human-male"></md-icon>

                        <div class="md-list-item-text">
                            <h3 ng-if="user.userData.passportValidity">
                                {{user.userData.passportValidity}}</h3>
                            <h3 ng-if="!user.userData.passportValidity">- Not specified -</h3>

                            <p>Validity</p>
                        </div>
                    </md-list-item>

                    <md-list-item class="md-2-line">
                        <md-icon md-svg-icon="human-handsdown"></md-icon>

                        <div class="md-list-item-text">
                            <h3 ng-if="user.userData.passportRegistration">
                                {{user.userData.passportRegistration}}</h3>
                            <h3 ng-if="!user.userData.passportRegistration">- Not specified -</h3>

                            <p>Registration</p>
                        </div>
                    </md-list-item>

                    <md-list-item class="md-2-line md-padding"
                                  ng-if="user.userData.passportPhotos.length > 0">
                        <div class="md-list-item-text">
                            <div layout="row"
                                 flex
                                 layout-wrap>
                                <md-content flex-gt-md="33"
                                            flex-xs="100"
                                            flex-gt-xs="33"
                                            flex-xl="20"
                                            class="md-padding"
                                            layout="column"
                                            ng-repeat="passportFile in user.userData.passportPhotos">
                                    <md-card
                                            md-whiteframe="{{height}}"
                                            ng-init="height = 2; showControls = false"
                                            ng-mouseenter="height = 6; showControls = true"
                                            ng-mouseleave="height = 2; showControls = false">
                                        <md-card-header class="md-card-header"
                                                        ng-click="ctrl.showUserInfoCard($event, $index)"
                                                        md-whiteframe="2">
                                            <md-card-header-text>
                                                <p style="word-break: break-all">{{passportFile.fileName}}</p>
                                            </md-card-header-text>
                                        </md-card-header>

                                        <md-card-content>
                                            <img src=<%=Const.PASSPORT_SCAN_UPLOAD_PATH%>{{passportFile.fileName}}
                                                 style="max-width: 100%;"/>
                                        </md-card-content>

                                        <md-card-actions layout="row" layout-align="end center">
                                            <md-button class="md-icon-button"
                                                       aria-label="Settings">
                                                <md-icon md-svg-icon=""></md-icon>
                                            </md-button>

                                            <md-button class="md-icon-button"
                                                       ng-show="showControls"
                                                       ng-click="ctrl.deleteDocument($event, $index)"
                                                       aria-label="Settings">
                                                <md-tooltip md-direction="bottom"
                                                            md-direction="left">
                                                    Delete document
                                                </md-tooltip>
                                                <md-icon md-svg-icon="delete"></md-icon>
                                            </md-button>

                                            <md-button class="md-icon-button"
                                                       ng-show="showControls"
                                                       aria-label="Done"
                                                       ng-click="ctrl.openFullPhoto(passportFile.fileName)">
                                                <md-tooltip md-direction="bottom" md-direction="left">Open
                                                </md-tooltip>
                                                <md-icon md-svg-icon="arrow-expand"></md-icon>
                                            </md-button>
                                        </md-card-actions>
                                    </md-card>
                                </md-content>
                            </div>
                        </div>
                    </md-list-item>
                </md-list>
            </section>

            <section class="list-holder">
                <md-list flex>
                    <md-subheader class="md-primary">Additional info</md-subheader>

                    <md-list-item class="md-2-line">
                        <md-icon md-svg-icon="phone"></md-icon>

                        <div class="md-list-item-text">
                            <h3 ng-if="user.userData.phone">
                                {{user.userData.phone}}</h3>
                            <h3 ng-if="!user.userData.phone">- Not specified -</h3>

                            <p>Phone</p>
                        </div>
                    </md-list-item>
                </md-list>
            </section>

            <section class="list-holder">
                <md-list flex>
                    <md-subheader class="md-primary">Bonus card</md-subheader>

                    <md-list-item class="md-2-line">
                        <md-icon md-svg-icon="domain"></md-icon>

                        <div class="md-list-item-text">
                            <h3 ng-if="user.userData.companyName">
                                {{user.userData.companyName}}</h3>
                            <h3 ng-if="!user.userData.companyName">- Not specified -</h3>

                            <p>Company name</p>
                        </div>
                    </md-list-item>

                    <md-list-item class="md-2-line">
                        <md-icon md-svg-icon="cards"></md-icon>

                        <div class="md-list-item-text">
                            <h3 ng-if="user.userData.bonusCardNumber">
                                {{user.userData.bonusCardNumber}}</h3>
                            <h3 ng-if="!user.userData.bonusCardNumber">- Not specified -</h3>

                            <p>Card number</p>
                        </div>
                    </md-list-item>
                </md-list>
            </section>

            <section class="list-holder">
                <md-subheader class="md-primary">Orders</md-subheader>

                <div layout="row"
                     flex
                     layout-wrap
                     class="md-padding">
                    <md-content flex-gt-md="33"
                                flex-xs="100"
                                flex-gt-xs="50"
                                flex-xl="25"
                                layout="column"
                                ng-repeat="order in orders">
                        <md-card
                                md-whiteframe="{{height}}"
                                ng-init="height = 2; showControls = false"
                                ng-mouseenter="height = 6; showControls = true"
                                ng-mouseleave="height = 2; showControls = false">
                            <md-card-header class="md-card-header"
                                            ng-click="ctrl.showUserInfoCard($event, $index)"
                                            md-whiteframe="2">
                                <md-card-header-text>
                                    <span class="md-title">{{order.buying_item_name}}</span>
                                    <span class="md-subhead">{{order.date}}</span>
                                </md-card-header-text>
                            </md-card-header>

                            <md-card-content>
                                <p style="max-height: 200px; overflow: auto">{{order.buying_comment}}</p>
                            </md-card-content>

                            <md-card-actions layout="row"
                                             layout-align="end end">
                                <md-button class="md-icon-button">
                                </md-button>

                                <md-button class="md-icon-button"
                                           aria-label="Settings"
                                           ng-show="showControls"
                                           ng-click="ctrl.showOrderInfoCard($event, $index)">
                                    <md-tooltip md-direction="bottom" md-direction="left">Send email with details
                                    </md-tooltip>
                                    <md-icon md-svg-icon="email"></md-icon>
                                </md-button>

                                <md-button class="md-icon-button"
                                           aria-label="Settings"
                                           ng-show="showControls"
                                           ng-click="ctrl.showOrderInfoCard($event, $index)">
                                    <md-tooltip md-direction="bottom" md-direction="left">Buyer info</md-tooltip>
                                    <md-icon md-svg-icon="account"></md-icon>
                                </md-button>

                                <md-button class="md-icon-button"
                                           aria-label="Settings"
                                           ng-show="showControls"
                                           ng-click="ctrl.showOrderInfoCard($event, $index)">
                                    <md-tooltip md-direction="bottom" md-direction="left">Order info</md-tooltip>
                                    <md-icon md-svg-icon="information-outline"></md-icon>
                                </md-button>
                            </md-card-actions>
                        </md-card>
                    </md-content>
                </div>
            </section>
        </div>
    </div>

    <md-button class="md-fab fab"
               aria-label="Edit profile"
               ng-if="isMyPage"
               ng-click="ctrl.redirect('/user/me/edit/')">
        <md-tooltip md-direction="bottom" md-direction="left">Edit profile</md-tooltip>
        <md-icon md-svg-src="account-edit"></md-icon>
    </md-button>
</md-content>

<script type="text/javascript">
    app.controller('PageController', ['$scope', '$window', '$http', '$mdDialog', '$mdToast',
        function ($scope, $window, $http, $mdDialog, $mdToast) {
            $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
            $scope.user = ${user};
            $scope.orders = ${orders};
            $scope.isMyPage = ${isMyPage};

            this.redirect = function (url) {
                window.location.href = url;
            };

            this.openFullPhoto = function (fileName) {
                window.open('<%=Const.PASSPORT_SCAN_UPLOAD_PATH%>' + fileName, '_blank');
            };

            this.deleteDocument = function (ev, index) {
                console.log($scope.user.userData.passportPhotos[index].id);

                $mdDialog.show($mdDialog.confirm()
                        .clickOutsideToClose(true)
                        .title('Attention')
                        .textContent('This action cannot be undone. Delete document?')
                        .ariaLabel('delete_dialog')
                        .ok('Yes')
                        .cancel('No')
                        .targetEvent(ev)
                ).then(function () {
                    $http({
                        method: 'DELETE',
                        url: '/api/documents/' + $scope.user.userData.passportPhotos[index].id
                    }).then(function (response) {
                        $scope.user.userData.passportPhotos.splice(index, 1);

                        $mdToast.show($mdToast.simple()
                                .textContent('Document deleted')
                                .position('bottom')
                                .hideDelay(3000));
                    }, function (response) {
                        $mdToast.show($mdToast.simple()
                                .textContent('Error occurred. Try again later')
                                .position('bottom')
                                .hideDelay(3000));
                    })
                }, function () {

                });
            };

            this.showOrderInfoCard = function (ev, index) {
                $mdDialog.show({
                    controller: DialogController,
                    templateUrl: '/jsp/template/order_info.tmpl.jsp',
                    parent: angular.element(document.body),
                    targetEvent: ev,
                    clickOutsideToClose: true,
                    fullscreen: $scope.customFullscreen, // Only for -xs, -sm breakpoints.
                    resolve: {
                        order: function () {
                            return $scope.orders[index];
                        }
                    }
                }).then(function (answer) {
                }, function () {
                });
            };

            function DialogController($scope, $mdDialog, order) {
                $scope.order = order;

                $scope.cancel = function () {
                    $mdDialog.cancel();
                };
            }
        }]);
</script>
</body>
</html>