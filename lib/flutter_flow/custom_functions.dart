import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

List<String> countryCodeOptions(List<CountryRecord> country) {
  List<String> optionsLabel = <String>[];
  for (CountryRecord c in country) {
    optionsLabel.add(c.code! + ' (' + c.phoneCode! + ')');
  }
  return optionsLabel;
}

String getIndex(int index) {
  return (index + 1).toString();
}

DocumentReference getFirstItemFromList(List<DocumentReference> users) {
  return users[0];
}
