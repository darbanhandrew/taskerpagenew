import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottom_sheet_appointment_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    this.chatRef,
    this.chatUserRef,
  }) : super(key: key);

  final DocumentReference? chatRef;
  final DocumentReference? chatUserRef;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  AppointmentRecord? createdAppointment;
  ScrollController? listViewController2;
  ScrollController? rowController;
  TextEditingController? textController;
  ScrollController? columnController;
  ScrollController? listViewController1;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await columnController?.animateTo(
        columnController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    columnController = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    rowController = ScrollController();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    columnController?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    rowController?.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UserRecord>(
      stream: UserRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final chatUserRecord = snapshot.data!;
        return Title(
            title: 'chat',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                  automaticallyImplyLeading: true,
                  leading: InkWell(
                    onTap: () async {
                      context.pop();
                    },
                    child: Icon(
                      Icons.chevron_left_sharp,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  title: Text(
                    '${chatUserRecord.firstName} ${chatUserRecord.lastName}',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 5,
                ),
              ),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          controller: columnController,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: StreamBuilder<List<ChatMessagesRecord>>(
                                  stream: queryChatMessagesRecord(
                                    queryBuilder: (chatMessagesRecord) =>
                                        chatMessagesRecord
                                            .where('chat',
                                                isEqualTo: widget.chatRef)
                                            .orderBy('timestamp',
                                                descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ChatMessagesRecord>
                                        listViewChatMessagesRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      reverse: true,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewChatMessagesRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewChatMessagesRecord =
                                            listViewChatMessagesRecordList[
                                                listViewIndex];
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (listViewChatMessagesRecord
                                                    .user !=
                                                currentUserReference)
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15, 5, 15, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxHeight:
                                                              double.infinity,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFF0E509C),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            5),
                                                                child: Text(
                                                                  listViewChatMessagesRecord
                                                                      .text!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                              if (listViewChatMessagesRecord
                                                                      .appointment !=
                                                                  null)
                                                                StreamBuilder<
                                                                    AppointmentRecord>(
                                                                  stream: AppointmentRecord
                                                                      .getDocument(
                                                                          listViewChatMessagesRecord
                                                                              .appointment!),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final rowAppointmentRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            rowAppointmentRecord.accepted!
                                                                                ? 'Cancel appointment'
                                                                                : 'Accept appointment',
                                                                            'Accept appointment',
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20,
                                                                                5,
                                                                                20,
                                                                                5),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Colors.white,
                                                                                  fontSize: 14,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      'relative',
                                                                      listViewChatMessagesRecord
                                                                          .timestamp!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (listViewChatMessagesRecord
                                                    .user ==
                                                currentUserReference)
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15, 5, 15, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxHeight:
                                                              double.infinity,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            5),
                                                                child: Text(
                                                                  listViewChatMessagesRecord
                                                                      .text!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                              if (listViewChatMessagesRecord
                                                                      .appointment !=
                                                                  null)
                                                                StreamBuilder<
                                                                    AppointmentRecord>(
                                                                  stream: AppointmentRecord
                                                                      .getDocument(
                                                                          listViewChatMessagesRecord
                                                                              .appointment!),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final rowAppointmentRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            rowAppointmentRecord.accepted!
                                                                                ? 'Appointment Accepted'
                                                                                : 'Pending ',
                                                                            'Accept appointment',
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20,
                                                                                5,
                                                                                20,
                                                                                5),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Colors.white,
                                                                                  fontSize: 14,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                        'relative',
                                                                        listViewChatMessagesRecord
                                                                            .timestamp!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                      controller: listViewController1,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 8, 0, 8),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: rowController,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 30,
                                          decoration: BoxDecoration(),
                                          child: StreamBuilder<
                                              List<DefineMessageRecord>>(
                                            stream: queryDefineMessageRecord(
                                              queryBuilder: (defineMessageRecord) =>
                                                  defineMessageRecord.where(
                                                      'order',
                                                      isEqualTo: FFAppState()
                                                          .OrderDefineMessages),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<DefineMessageRecord>
                                                  listViewDefineMessageRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    listViewDefineMessageRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewDefineMessageRecord =
                                                      listViewDefineMessageRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 5, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (listViewDefineMessageRecord
                                                                .type ==
                                                            'appointment') {
                                                          final appointmentCreateData =
                                                              {
                                                            ...createAppointmentRecordData(
                                                              typeAppointment:
                                                                  FFAppState().typeAppointment ==
                                                                          false
                                                                      ? 'In Person'
                                                                      : 'By Phone',
                                                              createdBy:
                                                                  currentUserReference,
                                                              createdAt:
                                                                  getCurrentTimestamp,
                                                              phone:
                                                                  currentPhoneNumber,
                                                              invited: widget
                                                                  .chatUserRef,
                                                            ),
                                                            'users': [
                                                              currentUserReference
                                                            ],
                                                          };
                                                          var appointmentRecordReference =
                                                              AppointmentRecord
                                                                  .collection
                                                                  .doc();
                                                          await appointmentRecordReference
                                                              .set(
                                                                  appointmentCreateData);
                                                          createdAppointment =
                                                              AppointmentRecord
                                                                  .getDocumentFromData(
                                                                      appointmentCreateData,
                                                                      appointmentRecordReference);

                                                          final appointmentAddressCreateData =
                                                              createAppointmentAddressRecordData(
                                                            address:
                                                                createAddressStruct(
                                                              city: FFAppState()
                                                                  .AddressAppointment,
                                                              clearUnsetFields:
                                                                  false,
                                                              create: true,
                                                            ),
                                                          );
                                                          await AppointmentAddressRecord
                                                                  .createDoc(
                                                                      createdAppointment!
                                                                          .reference)
                                                              .set(
                                                                  appointmentAddressCreateData);

                                                          final appointmentUpdateData =
                                                              {
                                                            'users': FieldValue
                                                                .arrayUnion([
                                                              widget.chatUserRef
                                                            ]),
                                                          };
                                                          await createdAppointment!
                                                              .reference
                                                              .update(
                                                                  appointmentUpdateData);
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            isDismissible:
                                                                false,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.5,
                                                                  child:
                                                                      BottomSheetAppointmentWidget(
                                                                    ediAppointment:
                                                                        createdAppointment!
                                                                            .reference,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        } else {
                                                          final chatMessagesCreateData =
                                                              createChatMessagesRecordData(
                                                            user:
                                                                currentUserReference,
                                                            text:
                                                                listViewDefineMessageRecord
                                                                    .messages,
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            chat:
                                                                widget.chatRef,
                                                          );
                                                          await ChatMessagesRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  chatMessagesCreateData);

                                                          final chatsUpdateData =
                                                              createChatsRecordData(
                                                            lastMessage:
                                                                listViewDefineMessageRecord
                                                                    .messages,
                                                            lastMessageTime:
                                                                getCurrentTimestamp,
                                                            lastMessageSentBy:
                                                                currentUserReference,
                                                          );
                                                          await widget.chatRef!
                                                              .update(
                                                                  chatsUpdateData);
                                                          await columnController
                                                              ?.animateTo(
                                                            columnController!
                                                                .position
                                                                .maxScrollExtent,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .OrderDefineMessages =
                                                                FFAppState()
                                                                        .OrderDefineMessages +
                                                                    1;
                                                          });
                                                        }

                                                        setState(() {});
                                                      },
                                                      text:
                                                          listViewDefineMessageRecord
                                                              .displayName!,
                                                      options: FFButtonOptions(
                                                        height: 40,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 5, 0),
                                                        color: Colors.white,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                controller: listViewController2,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.83,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                            color: Color(0xFFE3E3E3),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 15, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/Repeat_Grid_9.png',
                                                    width: 5,
                                                    height: 25,
                                                    fit: BoxFit.none,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 100,
                                              child: VerticalDivider(
                                                width: 0,
                                                thickness: 1,
                                                indent: 8,
                                                endIndent: 8,
                                              ),
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                controller: textController,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'oh12onby' /* Write a message... */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFD2D2D2),
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                maxLines: null,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final chatMessagesCreateData =
                                              createChatMessagesRecordData(
                                            user: currentUserReference,
                                            text: textController!.text,
                                            timestamp: getCurrentTimestamp,
                                            chat: widget.chatRef,
                                          );
                                          await ChatMessagesRecord.collection
                                              .doc()
                                              .set(chatMessagesCreateData);

                                          final chatsUpdateData =
                                              createChatsRecordData(
                                            lastMessage: textController!.text,
                                            lastMessageTime:
                                                getCurrentTimestamp,
                                            lastMessageSentBy:
                                                currentUserReference,
                                          );
                                          await widget.chatRef!
                                              .update(chatsUpdateData);
                                          setState(() {
                                            textController?.clear();
                                          });
                                          await columnController?.animateTo(
                                            columnController!
                                                .position.maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Image.asset(
                                          'assets/images/Mask_Group_201.png',
                                          width: 25,
                                          height: 25,
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
