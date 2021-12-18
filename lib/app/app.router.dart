// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/buysell/buysell_view.dart';
import '../ui/createaccount/createaccount_view.dart';
import '../ui/dashboard/dashboard_view.dart';
import '../ui/login/login_view.dart';
import '../ui/newdashboard/newdashboard_view.dart';
import '../ui/profile/profile_view.dart';
import '../ui/profileediting/profileedit_view.dart';
import '../ui/share/share_view.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String loginView = '/login-view';
  static const String dashboardView = '/dashboard-view';
  static const String newDashboardView = '/new-dashboard-view';
  static const String shareView = '/share-view';
  static const String buySellView = '/buy-sell-view';
  static const String profileEditView = '/profile-edit-view';
  static const String profileView = '/profile-view';
  static const String createAccountView = '/create-account-view';
  static const all = <String>{
    startUpView,
    loginView,
    dashboardView,
    newDashboardView,
    shareView,
    buySellView,
    profileEditView,
    profileView,
    createAccountView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.dashboardView, page: DashboardView),
    RouteDef(Routes.newDashboardView, page: NewDashboardView),
    RouteDef(Routes.shareView, page: ShareView),
    RouteDef(Routes.buySellView, page: BuySellView),
    RouteDef(Routes.profileEditView, page: ProfileEditView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.createAccountView, page: CreateAccountView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    DashboardView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const DashboardView(),
        settings: data,
      );
    },
    NewDashboardView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const NewDashboardView(),
        settings: data,
      );
    },
    ShareView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ShareView(),
        settings: data,
      );
    },
    BuySellView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const BuySellView(),
        settings: data,
      );
    },
    ProfileEditView: (data) {
      var args = data.getArgs<ProfileEditViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ProfileEditView(
          key: args.key,
          email: args.email,
          name: args.name,
          telgramId: args.telgramId,
          createdAt: args.createdAt,
        ),
        settings: data,
      );
    },
    ProfileView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
    CreateAccountView: (data) {
      var args = data.getArgs<CreateAccountViewArguments>(
        orElse: () => CreateAccountViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CreateAccountView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// ProfileEditView arguments holder class
class ProfileEditViewArguments {
  final Key? key;
  final String email;
  final String name;
  final String telgramId;
  final String createdAt;
  ProfileEditViewArguments(
      {this.key,
      required this.email,
      required this.name,
      required this.telgramId,
      required this.createdAt});
}

/// CreateAccountView arguments holder class
class CreateAccountViewArguments {
  final Key? key;
  CreateAccountViewArguments({this.key});
}
