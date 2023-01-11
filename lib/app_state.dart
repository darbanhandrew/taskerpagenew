import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _language = prefs.getString('ff_language')?.ref ?? _language;
    _country = prefs.getString('ff_country')?.ref ?? _country;
    _createdTask = prefs.getString('ff_createdTask')?.ref ?? _createdTask;
    _locationFilter = _latLngFromString(prefs.getString('ff_locationFilter')) ??
        _locationFilter;
    _chosenSkills = prefs
            .getStringList('ff_chosenSkills')
            ?.map((path) => path.ref)
            .toList() ??
        _chosenSkills;
    _chosenSkillLevels = prefs
            .getStringList('ff_chosenSkillLevels')
            ?.map((path) => path.ref)
            .toList() ??
        _chosenSkillLevels;
    _editAddress = prefs.getBool('ff_editAddress') ?? _editAddress;
    _isEditing = prefs.getBool('ff_isEditing') ?? _isEditing;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _language =
      FirebaseFirestore.instance.doc('/language/yvjeDSvwxu00o1HQboPZ');
  DocumentReference? get language => _language;
  set language(DocumentReference? _value) {
    _language = _value;
    _value != null
        ? prefs.setString('ff_language', _value.path)
        : prefs.remove('ff_language');
  }

  DocumentReference? _country =
      FirebaseFirestore.instance.doc('/country/CMNv4PtUuT5KTDPBI80d');
  DocumentReference? get country => _country;
  set country(DocumentReference? _value) {
    _country = _value;
    _value != null
        ? prefs.setString('ff_country', _value.path)
        : prefs.remove('ff_country');
  }

  List<DocumentReference> _chosenCategories = [];
  List<DocumentReference> get chosenCategories => _chosenCategories;
  set chosenCategories(List<DocumentReference> _value) {
    _chosenCategories = _value;
  }

  void addToChosenCategories(DocumentReference _value) {
    _chosenCategories.add(_value);
  }

  void removeFromChosenCategories(DocumentReference _value) {
    _chosenCategories.remove(_value);
  }

  DocumentReference? _chosenEducationDegree;
  DocumentReference? get chosenEducationDegree => _chosenEducationDegree;
  set chosenEducationDegree(DocumentReference? _value) {
    _chosenEducationDegree = _value;
  }

  DocumentReference? _createdTask;
  DocumentReference? get createdTask => _createdTask;
  set createdTask(DocumentReference? _value) {
    _createdTask = _value;
    _value != null
        ? prefs.setString('ff_createdTask', _value.path)
        : prefs.remove('ff_createdTask');
  }

  int _OrderDefineMessages = 0;
  int get OrderDefineMessages => _OrderDefineMessages;
  set OrderDefineMessages(int _value) {
    _OrderDefineMessages = _value;
  }

  bool _phoneAppointment = false;
  bool get phoneAppointment => _phoneAppointment;
  set phoneAppointment(bool _value) {
    _phoneAppointment = _value;
  }

  String _AddressAppointment = '';
  String get AddressAppointment => _AddressAppointment;
  set AddressAppointment(String _value) {
    _AddressAppointment = _value;
  }

  bool _typeAppointment = false;
  bool get typeAppointment => _typeAppointment;
  set typeAppointment(bool _value) {
    _typeAppointment = _value;
  }

  DocumentReference? _addresAppointtment;
  DocumentReference? get addresAppointtment => _addresAppointtment;
  set addresAppointtment(DocumentReference? _value) {
    _addresAppointtment = _value;
  }

  bool _acceptPhone = false;
  bool get acceptPhone => _acceptPhone;
  set acceptPhone(bool _value) {
    _acceptPhone = _value;
  }

  String _filds = '';
  String get filds => _filds;
  set filds(String _value) {
    _filds = _value;
  }

  List<dynamic> _JsonUserFields = [];
  List<dynamic> get JsonUserFields => _JsonUserFields;
  set JsonUserFields(List<dynamic> _value) {
    _JsonUserFields = _value;
  }

  void addToJsonUserFields(dynamic _value) {
    _JsonUserFields.add(_value);
  }

  void removeFromJsonUserFields(dynamic _value) {
    _JsonUserFields.remove(_value);
  }

  LatLng? _locationFilter;
  LatLng? get locationFilter => _locationFilter;
  set locationFilter(LatLng? _value) {
    _locationFilter = _value;
    _value != null
        ? prefs.setString('ff_locationFilter', _value.serialize())
        : prefs.remove('ff_locationFilter');
  }

  List<DocumentReference> _skillLevelFilter = [];
  List<DocumentReference> get skillLevelFilter => _skillLevelFilter;
  set skillLevelFilter(List<DocumentReference> _value) {
    _skillLevelFilter = _value;
  }

  void addToSkillLevelFilter(DocumentReference _value) {
    _skillLevelFilter.add(_value);
  }

  void removeFromSkillLevelFilter(DocumentReference _value) {
    _skillLevelFilter.remove(_value);
  }

  bool _rateCheck = false;
  bool get rateCheck => _rateCheck;
  set rateCheck(bool _value) {
    _rateCheck = _value;
  }

  List<DocumentReference> _skillCategoryFillter = [];
  List<DocumentReference> get skillCategoryFillter => _skillCategoryFillter;
  set skillCategoryFillter(List<DocumentReference> _value) {
    _skillCategoryFillter = _value;
  }

  void addToSkillCategoryFillter(DocumentReference _value) {
    _skillCategoryFillter.add(_value);
  }

  void removeFromSkillCategoryFillter(DocumentReference _value) {
    _skillCategoryFillter.remove(_value);
  }

  List<DocumentReference> _skillFillter = [];
  List<DocumentReference> get skillFillter => _skillFillter;
  set skillFillter(List<DocumentReference> _value) {
    _skillFillter = _value;
  }

  void addToSkillFillter(DocumentReference _value) {
    _skillFillter.add(_value);
  }

  void removeFromSkillFillter(DocumentReference _value) {
    _skillFillter.remove(_value);
  }

  List<DocumentReference> _chosenSkills = [];
  List<DocumentReference> get chosenSkills => _chosenSkills;
  set chosenSkills(List<DocumentReference> _value) {
    _chosenSkills = _value;
    prefs.setStringList('ff_chosenSkills', _value.map((x) => x.path).toList());
  }

  void addToChosenSkills(DocumentReference _value) {
    _chosenSkills.add(_value);
    prefs.setStringList(
        'ff_chosenSkills', _chosenSkills.map((x) => x.path).toList());
  }

  void removeFromChosenSkills(DocumentReference _value) {
    _chosenSkills.remove(_value);
    prefs.setStringList(
        'ff_chosenSkills', _chosenSkills.map((x) => x.path).toList());
  }

  List<DocumentReference> _chosenSkillLevels = [];
  List<DocumentReference> get chosenSkillLevels => _chosenSkillLevels;
  set chosenSkillLevels(List<DocumentReference> _value) {
    _chosenSkillLevels = _value;
    prefs.setStringList(
        'ff_chosenSkillLevels', _value.map((x) => x.path).toList());
  }

  void addToChosenSkillLevels(DocumentReference _value) {
    _chosenSkillLevels.add(_value);
    prefs.setStringList(
        'ff_chosenSkillLevels', _chosenSkillLevels.map((x) => x.path).toList());
  }

  void removeFromChosenSkillLevels(DocumentReference _value) {
    _chosenSkillLevels.remove(_value);
    prefs.setStringList(
        'ff_chosenSkillLevels', _chosenSkillLevels.map((x) => x.path).toList());
  }

  bool _editAddress = false;
  bool get editAddress => _editAddress;
  set editAddress(bool _value) {
    _editAddress = _value;
    prefs.setBool('ff_editAddress', _value);
  }

  bool _isEditing = false;
  bool get isEditing => _isEditing;
  set isEditing(bool _value) {
    _isEditing = _value;
    prefs.setBool('ff_isEditing', _value);
  }

  bool _checkEdit = false;
  bool get checkEdit => _checkEdit;
  set checkEdit(bool _value) {
    _checkEdit = _value;
  }

  bool _checkEditPersonalInformation = false;
  bool get checkEditPersonalInformation => _checkEditPersonalInformation;
  set checkEditPersonalInformation(bool _value) {
    _checkEditPersonalInformation = _value;
  }

  DocumentReference? _editedEducation;
  DocumentReference? get editedEducation => _editedEducation;
  set editedEducation(DocumentReference? _value) {
    _editedEducation = _value;
  }

  bool _editNum = false;
  bool get editNum => _editNum;
  set editNum(bool _value) {
    _editNum = _value;
  }

  bool _isSorting = false;
  bool get isSorting => _isSorting;
  set isSorting(bool _value) {
    _isSorting = _value;
  }

  double _distanceFilter = 2.4;
  double get distanceFilter => _distanceFilter;
  set distanceFilter(double _value) {
    _distanceFilter = _value;
  }

  bool _taskOrTasker = false;
  bool get taskOrTasker => _taskOrTasker;
  set taskOrTasker(bool _value) {
    _taskOrTasker = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
