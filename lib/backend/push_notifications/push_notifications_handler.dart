import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
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
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'SignIn': ParameterData.none(),
  'verified-email': ParameterData.none(),
  'SignUp': ParameterData.none(),
  'NewPassword': ParameterData.none(),
  'ChooseLanguage': ParameterData.none(),
  'KnowU': (data) async => ParameterData(
        allParams: {
          'editKnowU': getParameter<bool>(data, 'editKnowU'),
        },
      ),
  'CONTACTDATA2-M-144': ParameterData.none(),
  'CONTACTDATA2-M-145': (data) async => ParameterData(
        allParams: {
          'edit': getParameter<DocumentReference>(data, 'edit'),
        },
      ),
  'WhatAreYouInterestedIn': ParameterData.none(),
  'Skills': ParameterData.none(),
  'ProfileView': ParameterData.none(),
  'Details1-M-152': ParameterData.none(),
  'Details2-M-153': ParameterData.none(),
  'TASK-M-197': ParameterData.none(),
  'TASK-M-198': (data) async => ParameterData(
        allParams: {
          'edit': getParameter<DocumentReference>(data, 'edit'),
        },
      ),
  'TASK-M-200': ParameterData.none(),
  'CONTACTDATA2-M-221': ParameterData.none(),
  'CONTACTDATA2-M-202': ParameterData.none(),
  'Calnendar-M-203': ParameterData.none(),
  'Calnendar-M-205': ParameterData.none(),
  'Calnendar-M-208': ParameterData.none(),
  'Taskerdetails-M-215': ParameterData.none(),
  'Taskerdetails-M-217': ParameterData.none(),
  'Taskerdetails-M-218': ParameterData.none(),
  'MyNetwork': ParameterData.none(),
  'search-M-12': ParameterData.none(),
  'Describe-M-150': ParameterData.none(),
  'Calender': ParameterData.none(),
  'Profile': ParameterData.none(),
  'ContactData': ParameterData.none(),
  'homePage-M-03': ParameterData.none(),
  'homePage-M-04': ParameterData.none(),
  'homePage-M-05': ParameterData.none(),
  'MyTasks': ParameterData.none(),
  'Skills2': ParameterData.none(),
  'Identification': ParameterData.none(),
  'Identification2': ParameterData.none(),
  'Education': ParameterData.none(),
  'Education2': ParameterData.none(),
  'homePage-M-06': ParameterData.none(),
  'Rates': ParameterData.none(),
  'homePage-M-07': ParameterData.none(),
  'Rates2': ParameterData.none(),
  'TaskAppointment': ParameterData.none(),
  'sign_up-M-126': ParameterData.none(),
  'DateofBirth-M-173': ParameterData.none(),
  'sign_up_M-165': ParameterData.none(),
  'Signup-M-166': ParameterData.none(),
  'sign_up_M-168': ParameterData.none(),
  'rate_m-169': ParameterData.none(),
  'sign_upEducation': ParameterData.none(),
  'Rates_M-171': ParameterData.none(),
  'DescribeYourself': ParameterData.none(),
  'ChooseSkillls-M146': ParameterData.none(),
  'Profile-M-151': ParameterData.none(),
  'searchResultTasker': ParameterData.none(),
  'tasks': ParameterData.none(),
  'searchResult': ParameterData.none(),
  'chat': (data) async => ParameterData(
        allParams: {
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
          'chatUserRef': getParameter<DocumentReference>(data, 'chatUserRef'),
        },
      ),
  'chats': (data) async => ParameterData(
        allParams: {
          'task': getParameter<DocumentReference>(data, 'task'),
        },
      ),
  'appointmentlist': ParameterData.none(),
  'TASK-M-199': ParameterData.none(),
  'appointment': ParameterData.none(),
  'appointmentdeatls': (data) async => ParameterData(
        allParams: {
          'appiontmentdeatls':
              getParameter<DocumentReference>(data, 'appiontmentdeatls'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'Howitworks': ParameterData.none(),
  'TaskPublish': (data) async => ParameterData(
        allParams: {
          'messagePoster': getParameter<bool>(data, 'messagePoster'),
          'task': getParameter<DocumentReference>(data, 'task'),
          'editTask': getParameter<bool>(data, 'editTask'),
        },
      ),
  'appointmentdeatlsRquested': (data) async => ParameterData(
        allParams: {
          'appiontmentdeatls':
              getParameter<DocumentReference>(data, 'appiontmentdeatls'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'CONTACTDATA2-M-145Copy': ParameterData.none(),
  'test': ParameterData.none(),
  'profile_scan': (data) async => ParameterData(
        allParams: {
          'appiontmentdeatls':
              getParameter<DocumentReference>(data, 'appiontmentdeatls'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'editEducation': (data) async => ParameterData(
        allParams: {
          'educationDocument':
              getParameter<DocumentReference>(data, 'educationDocument'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
