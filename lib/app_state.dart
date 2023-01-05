import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

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

  bool _field = false;
  bool get field => _field;
  set field(bool _value) {
    _field = _value;
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
