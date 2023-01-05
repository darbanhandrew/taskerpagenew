import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  TaskerpageFirebaseUser? initialUser;
  TaskerpageFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(TaskerpageFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : HomePageM03Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : HomePageM03Widget(),
          routes: [
            FFRoute(
              name: 'SignIn',
              path: 'signIn',
              builder: (context, params) => SignInWidget(),
            ),
            FFRoute(
              name: 'SignUp',
              path: 'signUp',
              builder: (context, params) => SignUpWidget(),
            ),
            FFRoute(
              name: 'ForgotPassword',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'NewPassword',
              path: 'newPassword',
              builder: (context, params) => NewPasswordWidget(),
            ),
            FFRoute(
              name: 'ChooseLanguage',
              path: 'chooseLanguage',
              builder: (context, params) => ChooseLanguageWidget(),
            ),
            FFRoute(
              name: 'KnowU',
              path: 'knowU',
              builder: (context, params) => KnowUWidget(
                editKnowU: params.getParam('editKnowU', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'CONTACTDATA2-M-144',
              path: 'contactdata2M144',
              builder: (context, params) => Contactdata2M144Widget(),
            ),
            FFRoute(
              name: 'CONTACTDATA2-M-145',
              path: 'contactdata2M145',
              builder: (context, params) => Contactdata2M145Widget(),
            ),
            FFRoute(
              name: 'WhatAreYouInterestedIn',
              path: 'whatAreYouInterestedIn',
              builder: (context, params) => WhatAreYouInterestedInWidget(),
            ),
            FFRoute(
              name: 'Skills',
              path: 'skills',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Skills')
                  : SkillsWidget(),
            ),
            FFRoute(
              name: 'ProfileView',
              path: 'profileView',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ProfileView')
                  : ProfileViewWidget(),
            ),
            FFRoute(
              name: 'Details1-M-152',
              path: 'details1M152',
              builder: (context, params) => Details1M152Widget(),
            ),
            FFRoute(
              name: 'Details2-M-153',
              path: 'details2M153',
              builder: (context, params) => Details2M153Widget(),
            ),
            FFRoute(
              name: 'TASK-M-197',
              path: 'taskM197',
              builder: (context, params) => TaskM197Widget(),
            ),
            FFRoute(
              name: 'TASK-M-198',
              path: 'taskM198',
              builder: (context, params) => TaskM198Widget(),
            ),
            FFRoute(
              name: 'TASK-M-200',
              path: 'taskM200',
              builder: (context, params) => TaskM200Widget(),
            ),
            FFRoute(
              name: 'CONTACTDATA2-M-221',
              path: 'contactdata2M221',
              builder: (context, params) => Contactdata2M221Widget(),
            ),
            FFRoute(
              name: 'CONTACTDATA2-M-202',
              path: 'contactdata2M202',
              builder: (context, params) => Contactdata2M202Widget(),
            ),
            FFRoute(
              name: 'Calnendar-M-203',
              path: 'calnendarM203',
              builder: (context, params) => CalnendarM203Widget(),
            ),
            FFRoute(
              name: 'Calnendar-M-205',
              path: 'calnendarM205',
              builder: (context, params) => CalnendarM205Widget(),
            ),
            FFRoute(
              name: 'Calnendar-M-208',
              path: 'calnendarM208',
              builder: (context, params) => CalnendarM208Widget(),
            ),
            FFRoute(
              name: 'Taskerdetails-M-215',
              path: 'taskerdetailsM215',
              builder: (context, params) => TaskerdetailsM215Widget(),
            ),
            FFRoute(
              name: 'Taskerdetails-M-217',
              path: 'taskerdetailsM217',
              builder: (context, params) => TaskerdetailsM217Widget(),
            ),
            FFRoute(
              name: 'Taskerdetails-M-218',
              path: 'taskerdetailsM218',
              builder: (context, params) => TaskerdetailsM218Widget(),
            ),
            FFRoute(
              name: 'search-M-12',
              path: 'searchM12',
              builder: (context, params) => SearchM12Widget(),
            ),
            FFRoute(
              name: 'MyNetwork',
              path: 'myNetwork',
              builder: (context, params) => MyNetworkWidget(),
            ),
            FFRoute(
              name: 'Describe-M-150',
              path: 'describeM150',
              builder: (context, params) => DescribeM150Widget(),
            ),
            FFRoute(
              name: 'Calender',
              path: 'calender',
              builder: (context, params) => CalenderWidget(),
            ),
            FFRoute(
              name: 'Profile',
              path: 'profile',
              builder: (context, params) => ProfileWidget(),
            ),
            FFRoute(
              name: 'ContactData',
              path: 'contactData',
              builder: (context, params) => ContactDataWidget(),
            ),
            FFRoute(
              name: 'homePage-M-03',
              path: 'homePageM03',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'homePage-M-03')
                  : HomePageM03Widget(),
            ),
            FFRoute(
              name: 'homePage-M-04',
              path: 'homePageM04',
              builder: (context, params) => HomePageM04Widget(),
            ),
            FFRoute(
              name: 'homePage-M-05',
              path: 'homePageM05',
              builder: (context, params) => HomePageM05Widget(),
            ),
            FFRoute(
              name: 'MyTasks',
              path: 'myTasks',
              builder: (context, params) => MyTasksWidget(),
            ),
            FFRoute(
              name: 'Skills2',
              path: 'skills2',
              builder: (context, params) => Skills2Widget(),
            ),
            FFRoute(
              name: 'Identification',
              path: 'identification',
              builder: (context, params) => IdentificationWidget(),
            ),
            FFRoute(
              name: 'Identification2',
              path: 'identification2',
              builder: (context, params) => Identification2Widget(),
            ),
            FFRoute(
              name: 'Education',
              path: 'education',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Education')
                  : EducationWidget(),
            ),
            FFRoute(
              name: 'Education2',
              path: 'education2',
              builder: (context, params) => Education2Widget(),
            ),
            FFRoute(
              name: 'homePage-M-06',
              path: 'homePageM06',
              builder: (context, params) => HomePageM06Widget(),
            ),
            FFRoute(
              name: 'homePage-M-07',
              path: 'homePageM07',
              builder: (context, params) => HomePageM07Widget(),
            ),
            FFRoute(
              name: 'Rates',
              path: 'rates',
              builder: (context, params) => RatesWidget(),
            ),
            FFRoute(
              name: 'Rates2',
              path: 'rates2',
              builder: (context, params) => Rates2Widget(),
            ),
            FFRoute(
              name: 'TaskAppointment',
              path: 'taskAppointment',
              builder: (context, params) => TaskAppointmentWidget(),
            ),
            FFRoute(
              name: 'sign_up-M-126',
              path: 'signUpM126',
              builder: (context, params) => SignUpM126Widget(),
            ),
            FFRoute(
              name: 'DateofBirth-M-173',
              path: 'dateofBirthM173',
              builder: (context, params) => DateofBirthM173Widget(),
            ),
            FFRoute(
              name: 'sign_up_M-165',
              path: 'signUpM165',
              builder: (context, params) => SignUpM165Widget(),
            ),
            FFRoute(
              name: 'sign_up_M-167',
              path: 'signUpM167',
              builder: (context, params) => SignUpM167Widget(),
            ),
            FFRoute(
              name: 'Signup-M-166',
              path: 'signupM166',
              builder: (context, params) => SignupM166Widget(),
            ),
            FFRoute(
              name: 'sign_up_M-168',
              path: 'signUpM168',
              builder: (context, params) => SignUpM168Widget(),
            ),
            FFRoute(
              name: 'rate_m-169',
              path: 'rateM169',
              builder: (context, params) => RateM169Widget(),
            ),
            FFRoute(
              name: 'sign_upEducation',
              path: 'signUpEducation',
              builder: (context, params) => SignUpEducationWidget(),
            ),
            FFRoute(
              name: 'Rates_M-171',
              path: 'ratesM171',
              builder: (context, params) => RatesM171Widget(),
            ),
            FFRoute(
              name: 'ChooseSkillls-M146',
              path: 'chooseSkilllsM146',
              builder: (context, params) => ChooseSkilllsM146Widget(),
            ),
            FFRoute(
              name: 'DescribeYourself',
              path: 'describeYourself',
              builder: (context, params) => DescribeYourselfWidget(),
            ),
            FFRoute(
              name: 'Profile-M-151',
              path: 'profileM151',
              builder: (context, params) => ProfileM151Widget(),
            ),
            FFRoute(
              name: 'serach_result_task',
              path: 'serachResultTask',
              builder: (context, params) => SerachResultTaskWidget(),
            ),
            FFRoute(
              name: 'serach_result',
              path: 'serachResult',
              builder: (context, params) => SerachResultWidget(),
            ),
            FFRoute(
              name: 'tasks',
              path: 'tasks',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'tasks')
                  : TasksWidget(),
            ),
            FFRoute(
              name: 'chats',
              path: 'taskChats',
              builder: (context, params) => ChatsWidget(
                task: params.getParam(
                    'task', ParamType.DocumentReference, false, ['task']),
              ),
            ),
            FFRoute(
              name: 'chat',
              path: 'chat',
              builder: (context, params) => ChatWidget(
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
                chatUserRef: params.getParam('chatUserRef',
                    ParamType.DocumentReference, false, ['user']),
              ),
            ),
            FFRoute(
              name: 'TASK-M-199',
              path: 'taskM199',
              builder: (context, params) => TaskM199Widget(),
            ),
            FFRoute(
              name: 'appointment',
              path: 'appointment',
              builder: (context, params) => AppointmentWidget(),
            ),
            FFRoute(
              name: 'TaskPubish',
              path: 'taskPubish',
              builder: (context, params) => TaskPubishWidget(
                messagePoster: params.getParam('messagePoster', ParamType.bool),
                task: params.getParam(
                    'task', ParamType.DocumentReference, false, ['task']),
              ),
            ),
            FFRoute(
              name: 'appointmentlist',
              path: 'appointmentlist',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'appointmentlist')
                  : AppointmentlistWidget(),
            ),
            FFRoute(
              name: 'appointmentdeatls',
              path: 'appointmentdeatls',
              builder: (context, params) => AppointmentdeatlsWidget(
                appiontmentdeatls: params.getParam('appiontmentdeatls',
                    ParamType.DocumentReference, false, ['appointment']),
                acceptInlistappointment:
                    params.getParam('acceptInlistappointment', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'Howitworks',
              path: 'howitworks',
              builder: (context, params) => HowitworksWidget(),
            ),
            FFRoute(
              name: 'appointmentdeatlsRquested',
              path: 'appointmentdeatlsRquested',
              builder: (context, params) => AppointmentdeatlsRquestedWidget(
                appiontmentdeatls: params.getParam('appiontmentdeatls',
                    ParamType.DocumentReference, false, ['appointment']),
                acceptInlistappointment:
                    params.getParam('acceptInlistappointment', ParamType.bool),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/homePageM03';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  child: Center(
                    child: Image.asset(
                      'assets/images/tasker.page.png',
                      width: 150,
                      height: 28,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
