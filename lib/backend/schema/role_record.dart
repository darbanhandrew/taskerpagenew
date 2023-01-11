import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'role_record.g.dart';

abstract class RoleRecord implements Built<RoleRecord, RoleRecordBuilder> {
  static Serializer<RoleRecord> get serializer => _$roleRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'display_message')
  String? get displayMessage;

  BuiltList<TranslatableStringStruct>? get locale;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RoleRecordBuilder builder) => builder
    ..name = ''
    ..displayMessage = ''
    ..locale = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('role');

  static Stream<RoleRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RoleRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static RoleRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => RoleRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..displayMessage = snapshot.data['display_message']
          ..locale = safeGet(() => ListBuilder(snapshot.data['locale']
              .map((data) => createTranslatableStringStruct(
                    language: safeGet(() =>
                        toRef((data as Map<String, dynamic>)['language'])),
                    text: (data as Map<String, dynamic>)['text'],
                    create: true,
                    clearUnsetFields: false,
                  ).toBuilder())))
          ..ffRef = RoleRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RoleRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'role',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  RoleRecord._();
  factory RoleRecord([void Function(RoleRecordBuilder) updates]) = _$RoleRecord;

  static RoleRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRoleRecordData({
  String? name,
  String? displayMessage,
}) {
  final firestoreData = serializers.toFirestore(
    RoleRecord.serializer,
    RoleRecord(
      (r) => r
        ..name = name
        ..displayMessage = displayMessage
        ..locale = null,
    ),
  );

  return firestoreData;
}
