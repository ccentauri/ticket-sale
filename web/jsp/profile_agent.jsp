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

<md-content ng-controller="PageController as ctrl">
    <section>
        <md-list flex>
            <md-subheader class="md-primary">Main info</md-subheader>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Name</h3>
                    <p ng-if="user.name">
                        {{user.name}}</p>
                    <p ng-if="!user.name">null</p>
                </div>
            </md-list-item>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Surname</h3>
                    <p ng-if="user.surname">
                        {{user.surname}}</p>
                    <p ng-if="!user.surname">null</p>
                </div>
            </md-list-item>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Middle name</h3>
                    <p ng-if="user.middleName">
                        {{user.middleName}}</p>
                    <p ng-if="!user.middleName">null</p>
                </div>
            </md-list-item>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Email</h3>
                    <p ng-if="user.email">
                        {{user.email}}</p>
                    <p ng-if="!user.email">null</p>
                </div>
            </md-list-item>
        </md-list>
    </section>

    <section>
        <md-list flex>
            <md-subheader class="md-primary">Passport info</md-subheader>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Passport series</h3>
                    <p ng-if="user.userData.passportSeries">
                        {{user.userData.passportSeries}}</p>
                    <p ng-if="!user.userData.passportSeries">null</p>
                </div>
            </md-list-item>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Passport number</h3>
                    <p ng-if="user.userData.passportNumber">
                        {{user.userData.passportNumber}}</p>
                    <p ng-if="!user.userData.passportNumber">null</p>
                </div>
            </md-list-item>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Passport validity</h3>
                    <p ng-if="user.userData.passportValidity">
                        {{user.userData.passportValidity}}</p>
                    <p ng-if="!user.userData.passportValidity">null</p>
                </div>
            </md-list-item>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Passport registration</h3>
                    <p ng-if="user.userData.passportRegistration">
                        {{user.userData.passportRegistration}}</p>
                    <p ng-if="!user.userData.passportRegistration">null</p>
                </div>
            </md-list-item>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Passport scan</h3>
                    <a ng-if="user.userData.passportUrl"
                       ng-href="/passport/scan/{{user.userData.passportUrl}}" target="_blank">
                        Open
                    </a>
                    <p ng-if="!user.userData.passportUrl">null</p>
                </div>
            </md-list-item>
        </md-list>
    </section>

    <section>
        <md-list flex>
            <md-subheader class="md-primary">Additional info</md-subheader>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Phone</h3>
                    <p ng-if="user.userData.phone">
                        {{user.userData.phone}}</p>
                    <p ng-if="!user.userData.phone">null</p>
                </div>
            </md-list-item>
        </md-list>
    </section>

    <section>
        <md-list flex>
            <md-subheader class="md-primary">Bonus card</md-subheader>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Company name</h3>
                    <p ng-if="user.userData.companyName">
                        {{user.userData.companyName}}</p>
                    <p ng-if="!user.userData.companyName">null</p>
                </div>
            </md-list-item>

            <md-list-item class="md-2-line">
                <div class="md-list-item-text">
                    <h3>Card number</h3>
                    <p ng-if="user.userData.bonusCardNumber">
                        {{user.userData.bonusCardNumber}}</p>
                    <p ng-if="!user.userData.bonusCardNumber">null</p>
                </div>
            </md-list-item>
        </md-list>
    </section>
</md-content>

<script type="text/javascript">
    app.controller('PageController', ['$scope', '$window', '$http', '$mdDialog', '$mdToast',
        function ($scope, $window, $http, $mdDialog, $mdToast) {
            $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
            $scope.user = ${user};

        }]);
</script>
</body>
</html>