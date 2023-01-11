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

String getIndex(int index) {
  return (index + 1).toString();
}

String minusOne(int index) {
  return (index - 1).toString();
}

DocumentReference getFirstItemFromList(List<DocumentReference> users) {
  return users[0];
}

List<UserRecord> getUserMaximumDistance(
  List<UserRecord> users,
  LatLng location,
  double maxDistance,
) {
  // First create some emptyList
  List<UserRecord> usersList = [];
  List<double> listKm = [];
  double lat1 = location.latitude;
  double lon1 = location.longitude;
  // This iterates through the single documents "places" in the List
  for (UserRecord user in users) {
    double lat2 = user.location!.latitude;
    double lon2 = user.location!.longitude;
    // This is doing math for distance calculations on the surface of a spheroid
    var c = math.cos;
    var p = 0.017453292519943295;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    // This is getting us the distance
    var d = (12742 * math.asin(math.sqrt(a)));
    String inString = d.toStringAsFixed(2); // '2.35'
    double inDouble = double.parse(inString);
    listKm.add(inDouble);
    // Sort the documents that will be returned by distance
    listKm.sort();
    int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
    // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
    if (inDouble <= maxDistance) {
      // If its within our radius, add it to the list of places documents that will be returned
      usersList.insert(listKmIndex, user);
    }
  }
  return usersList;
}

List<TaskRecord> getTaskMaximumDistance(
  List<TaskRecord> tasks,
  LatLng location,
  double maxDistance,
) {
  // First create some emptyList
  List<TaskRecord> tasksList = [];
  List<double> listKm = [];
  double lat1 = location.latitude;
  double lon1 = location.longitude;
  // This iterates through the single documents "places" in the List
  for (TaskRecord task in tasks) {
    double lat2 = task.location!.latitude;
    double lon2 = task.location!.longitude;
    // This is doing math for distance calculations on the surface of a spheroid
    var c = math.cos;
    var p = 0.017453292519943295;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    // This is getting us the distance
    var d = (12742 * math.asin(math.sqrt(a)));
    String inString = d.toStringAsFixed(2); // '2.35'
    double inDouble = double.parse(inString);
    listKm.add(inDouble);
    // Sort the documents that will be returned by distance
    listKm.sort();
    int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
    // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
    if (inDouble <= maxDistance) {
      // If its within our radius, add it to the list of places documents that will be returned
      tasksList.insert(listKmIndex, task);
    }
  }
  return tasksList;
}

TranslatableStringStruct? skillCategoryLocale(
  DocumentReference language,
  SkillCategoryRecord skillCategory,
) {
  if (skillCategory.locale != null) {
    for (TranslatableStringStruct t in skillCategory.locale!) {
      if (t.language == language) {
        return t;
      }
    }
  }
  return null;
}

TranslatableStringStruct? skillLocale(
  DocumentReference language,
  SkillRecord skill,
) {
  if (skill.locale != null) {
    for (TranslatableStringStruct t in skill.locale!) {
      if (t.language == language) {
        return t;
      }
    }
  }
  return null;
}

TranslatableStringStruct? skillLevelLocale(
  DocumentReference language,
  SkillLevelRecord skillLevel,
) {
  if (skillLevel.locale != null) {
    for (TranslatableStringStruct t in skillLevel.locale!) {
      if (t.language == language) {
        return t;
      }
    }
  }
  return null;
}

TranslatableStringStruct? educationLocale(
  DocumentReference language,
  EducationDegreeRecord education,
) {
  if (education.locale != null) {
    for (TranslatableStringStruct t in education.locale!) {
      if (t.language == language) {
        return t;
      }
    }
  }
  return null;
}

TranslatableStringStruct? roleLocale(
  DocumentReference language,
  RoleRecord role,
) {
  if (role.locale != null) {
    for (TranslatableStringStruct t in role.locale!) {
      if (t.language == language) {
        return t;
      }
    }
  }
  return null;
}

bool? interSectionList(
  List<DocumentReference> localList,
  List<DocumentReference> userList,
) {
  if (localList.length != 0) {
    localList.removeWhere((item) => !userList.contains(item));

    if (localList.length != 0) {
      return true;
    } else {
      return false;
    }
  } else {
    return true;
  }
}

bool? interSectionSkillLists(
  List<DocumentReference> localList,
  List<DocumentReference> userList,
) {
  if (localList.length != 0) {
    localList.removeWhere((item) => !userList.contains(item));

    if (localList.length != 0) {
      return true;
    } else {
      return false;
    }
  } else {
    return true;
  }
}

bool? interSectionTaskSkillLists(
  List<DocumentReference> localList,
  DocumentReference userList,
) {
  if (localList.length != 0) {
    if (localList.contains(userList)) {
      return true;
    } else {
      return false;
    }
  } else {
    return true;
  }
}

bool? interSectionSkillLevelLists(
  List<DocumentReference> localList,
  List<DocumentReference> userList,
) {
  if (localList.length != 0) {
    localList.removeWhere((item) => !userList.contains(item));

    if (localList.length != 0) {
      return true;
    } else {
      return false;
    }
  } else {
    return true;
  }
}

bool? interSectionListSkillCategory(
  List<DocumentReference> localList,
  DocumentReference userList,
) {
  if (localList.length != 0) {
    if (localList.contains(userList)) {
      return true;
    } else {
      return false;
    }
  } else {
    return true;
  }
}

bool calculateDistance(
  LatLng? chosenLocation,
  LatLng? userLocation,
  double? distance,
) {
  if (chosenLocation == null ||
      chosenLocation == LatLng(0, 0) ||
      distance == null) {
    return true;
  } else {
    if (userLocation == null) {
      return true;
    }
    double lat1 = chosenLocation.latitude;
    double lon1 = chosenLocation.longitude;
    double lat2 = userLocation.latitude;
    double lon2 = userLocation.longitude;
    double p = 0.017453292519943295;
    double a = 0.5 -
        math.cos((lat2 - lat1) * p) / 2 +
        math.cos(lat1 * p) *
            math.cos(lat2 * p) *
            (1 - math.cos((lon2 - lon1) * p)) /
            2;
    return 12742 * math.asin(math.sqrt(a)) < distance;
  }
}

bool timeDifference(
  DateTime time1,
  int hours,
  DateTime currentTime,
) {
  Duration difference = time1.difference(currentTime);
  if (difference.inHours > hours) {
    return true;
  } else {
    return false;
  }
}

int? convertDoubleToInt(double? doubleInteger) {
  if (doubleInteger == null) {
    return null;
  }
  return doubleInteger.round();
}
