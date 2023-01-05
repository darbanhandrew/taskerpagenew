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
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
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

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'SignIn': (data) async => SignInWidget(),
  'SignUp': (data) async => SignUpWidget(),
  'ForgotPassword': (data) async => ForgotPasswordWidget(),
  'NewPassword': (data) async => NewPasswordWidget(),
  'ChooseLanguage': (data) async => ChooseLanguageWidget(),
  'KnowU': (data) async => KnowUWidget(
        editKnowU: getParameter(data, 'editKnowU'),
      ),
  'CONTACTDATA2-M-144': (data) async => Contactdata2M144Widget(),
  'CONTACTDATA2-M-145': (data) async => Contactdata2M145Widget(),
  'WhatAreYouInterestedIn': (data) async => WhatAreYouInterestedInWidget(),
  'Skills': (data) async => NavBarPage(initialPage: 'Skills'),
  'ProfileView': (data) async => NavBarPage(initialPage: 'ProfileView'),
  'Details1-M-152': (data) async => Details1M152Widget(),
  'Details2-M-153': (data) async => Details2M153Widget(),
  'TASK-M-197': (data) async => TaskM197Widget(),
  'TASK-M-198': (data) async => TaskM198Widget(),
  'TASK-M-200': (data) async => TaskM200Widget(),
  'CONTACTDATA2-M-221': (data) async => Contactdata2M221Widget(),
  'CONTACTDATA2-M-202': (data) async => Contactdata2M202Widget(),
  'Calnendar-M-203': (data) async => CalnendarM203Widget(),
  'Calnendar-M-205': (data) async => CalnendarM205Widget(),
  'Calnendar-M-208': (data) async => CalnendarM208Widget(),
  'Taskerdetails-M-215': (data) async => TaskerdetailsM215Widget(),
  'Taskerdetails-M-217': (data) async => TaskerdetailsM217Widget(),
  'Taskerdetails-M-218': (data) async => TaskerdetailsM218Widget(),
  'search-M-12': (data) async => SearchM12Widget(),
  'MyNetwork': (data) async => MyNetworkWidget(),
  'Describe-M-150': (data) async => DescribeM150Widget(),
  'Calender': (data) async => CalenderWidget(),
  'Profile': (data) async => ProfileWidget(),
  'ContactData': (data) async => ContactDataWidget(),
  'homePage-M-03': (data) async => NavBarPage(initialPage: 'homePage-M-03'),
  'homePage-M-04': (data) async => HomePageM04Widget(),
  'homePage-M-05': (data) async => HomePageM05Widget(),
  'MyTasks': (data) async => MyTasksWidget(),
  'Skills2': (data) async => Skills2Widget(),
  'Identification': (data) async => IdentificationWidget(),
  'Identification2': (data) async => Identification2Widget(),
  'Education': (data) async => NavBarPage(initialPage: 'Education'),
  'Education2': (data) async => Education2Widget(),
  'homePage-M-06': (data) async => HomePageM06Widget(),
  'homePage-M-07': (data) async => HomePageM07Widget(),
  'Rates': (data) async => RatesWidget(),
  'Rates2': (data) async => Rates2Widget(),
  'TaskAppointment': (data) async => TaskAppointmentWidget(),
  'sign_up-M-126': (data) async => SignUpM126Widget(),
  'DateofBirth-M-173': (data) async => DateofBirthM173Widget(),
  'sign_up_M-165': (data) async => SignUpM165Widget(),
  'sign_up_M-167': (data) async => SignUpM167Widget(),
  'Signup-M-166': (data) async => SignupM166Widget(),
  'sign_up_M-168': (data) async => SignUpM168Widget(),
  'rate_m-169': (data) async => RateM169Widget(),
  'sign_upEducation': (data) async => SignUpEducationWidget(),
  'Rates_M-171': (data) async => RatesM171Widget(),
  'ChooseSkillls-M146': (data) async => ChooseSkilllsM146Widget(),
  'DescribeYourself': (data) async => DescribeYourselfWidget(),
  'Profile-M-151': (data) async => ProfileM151Widget(),
  'serach_result_task': (data) async => SerachResultTaskWidget(),
  'serach_result': (data) async => SerachResultWidget(),
  'chats': (data) async => ChatsWidget(
        task: getParameter(data, 'task'),
      ),
  'chat': (data) async => ChatWidget(
        chatRef: getParameter(data, 'chatRef'),
        chatUserRef: getParameter(data, 'chatUserRef'),
      ),
  'TASK-M-199': (data) async => TaskM199Widget(),
  'appointment': (data) async => AppointmentWidget(),
  'TaskPubish': (data) async => TaskPubishWidget(
        messagePoster: getParameter(data, 'messagePoster'),
        task: getParameter(data, 'task'),
      ),
  'appointmentlist': (data) async => NavBarPage(initialPage: 'appointmentlist'),
  'appointmentdeatls': (data) async => AppointmentdeatlsWidget(
        appiontmentdeatls: getParameter(data, 'appiontmentdeatls'),
        acceptInlistappointment: getParameter(data, 'acceptInlistappointment'),
      ),
  'Howitworks': (data) async => HowitworksWidget(),
  'appointmentdeatlsRquested': (data) async => AppointmentdeatlsRquestedWidget(
        appiontmentdeatls: getParameter(data, 'appiontmentdeatls'),
        acceptInlistappointment: getParameter(data, 'acceptInlistappointment'),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

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
