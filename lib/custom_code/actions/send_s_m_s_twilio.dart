// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

import 'package:twilio_flutter/twilio_flutter.dart';

Future sendSMSTwilio(
  String phoneUser,
  String messageSMS,
) async {
  var twilioFlutter = TwilioFlutter(
      accountSid: 'MGeee53440f881fe37a9aa3537dbebfb55',
      authToken: '5dda8539fb71057c4902376be62582fb',
      twilioNumber: '+19854667073');

  twilioFlutter.sendSMS(toNumber: phoneUser, messageBody: messageSMS);
}
