import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/drawwerright_widget.dart';
import '../components/task_creation_drawer_content_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskerdetailsM215Widget extends StatefulWidget {
  const TaskerdetailsM215Widget({Key? key}) : super(key: key);

  @override
  _TaskerdetailsM215WidgetState createState() =>
      _TaskerdetailsM215WidgetState();
}

class _TaskerdetailsM215WidgetState extends State<TaskerdetailsM215Widget> {
  bool? switchValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<TaskRecord>(
      stream: TaskRecord.getDocument(FFAppState().createdTask!),
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
        final taskerdetailsM215TaskRecord = snapshot.data!;
        return Title(
            title: 'Taskerdetails-M-215',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.white,
              drawer: Container(
                width: 200,
                child: Drawer(
                  elevation: 10,
                  child: TaskCreationDrawerContentWidget(),
                ),
              ),
              endDrawer: Container(
                width: MediaQuery.of(context).size.width,
                child: Drawer(
                  elevation: 16,
                  child: DrawwerrightWidget(),
                ),
              ),
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: Text(
                  'tasker.page',
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 22,
                      ),
                ),
                actions: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.menu,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 30,
                    ),
                    onPressed: () async {
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                ],
                centerTitle: false,
                toolbarHeight: 70,
                elevation: 5,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 27, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 72, 40),
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: InkWell(
                                              onTap: () async {
                                                scaffoldKey.currentState!
                                                    .openDrawer();
                                              },
                                              child: Image.asset(
                                                'assets/images/Group_2196.png',
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 110, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SelectionArea(
                                                        child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '6e7gi4fp' /* Tasker type */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    )),
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
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 0, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'xltsaoz0' /* Tasker gender */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 15, 0),
                                      child: GridView(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 0,
                                          childAspectRatio: 3.5,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final taskUpdateData =
                                                    createTaskRecordData(
                                                  taskerType:
                                                      createTaskerTypeStruct(
                                                    gender: 'Male',
                                                    clearUnsetFields: false,
                                                  ),
                                                );
                                                await taskerdetailsM215TaskRecord
                                                    .reference
                                                    .update(taskUpdateData);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  border: Border.all(
                                                    color:
                                                        taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .gender ==
                                                                'Male'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '9al7saux' /* Male */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: taskerdetailsM215TaskRecord
                                                                          .taskerType
                                                                          .gender ==
                                                                      'Male'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final taskUpdateData =
                                                    createTaskRecordData(
                                                  taskerType:
                                                      createTaskerTypeStruct(
                                                    gender: 'Female',
                                                    clearUnsetFields: false,
                                                  ),
                                                );
                                                await taskerdetailsM215TaskRecord
                                                    .reference
                                                    .update(taskUpdateData);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  border: Border.all(
                                                    color:
                                                        taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .gender ==
                                                                'Female'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiaryColor,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'lgxur0kg' /* Female */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: taskerdetailsM215TaskRecord
                                                                          .taskerType
                                                                          .gender ==
                                                                      'Female'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final taskUpdateData =
                                                    createTaskRecordData(
                                                  taskerType:
                                                      createTaskerTypeStruct(
                                                    fieldValues: {
                                                      'gender':
                                                          FieldValue.delete(),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                );
                                                await taskerdetailsM215TaskRecord
                                                    .reference
                                                    .update(taskUpdateData);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  border: Border.all(
                                                    color: taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .gender ==
                                                                null ||
                                                            taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .gender ==
                                                                ''
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiaryColor,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'o664j19o' /* Doesn't matter */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: taskerdetailsM215TaskRecord
                                                                              .taskerType
                                                                              .gender ==
                                                                          null ||
                                                                      taskerdetailsM215TaskRecord
                                                                              .taskerType
                                                                              .gender ==
                                                                          ''
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 30,
                                thickness: 0.5,
                                indent: 15,
                                endIndent: 15,
                                color: Color(0xFFDEDEDE),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 0, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'sd76t2jh' /* Tasker age */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 15, 0),
                                      child: GridView(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 0,
                                          childAspectRatio: 3.5,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final taskUpdateData =
                                                    createTaskRecordData(
                                                  taskerType:
                                                      createTaskerTypeStruct(
                                                    taskerAgeStart: 0,
                                                    taskerAgeEnd: 20,
                                                    clearUnsetFields: false,
                                                  ),
                                                );
                                                await FFAppState()
                                                    .createdTask!
                                                    .update(taskUpdateData);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  border: Border.all(
                                                    color: (taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .taskerAgeStart ==
                                                                0) &&
                                                            (taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .taskerAgeStart ==
                                                                20)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiaryColor,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ys251dq2' /* <20 */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: (taskerdetailsM215TaskRecord
                                                                              .taskerType
                                                                              .taskerAgeStart ==
                                                                          0) &&
                                                                      (taskerdetailsM215TaskRecord
                                                                              .taskerType
                                                                              .taskerAgeStart ==
                                                                          20)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final taskUpdateData =
                                                    createTaskRecordData(
                                                  taskerType:
                                                      createTaskerTypeStruct(
                                                    taskerAgeStart: 21,
                                                    taskerAgeEnd: 40,
                                                    clearUnsetFields: false,
                                                  ),
                                                );
                                                await FFAppState()
                                                    .createdTask!
                                                    .update(taskUpdateData);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  border: Border.all(
                                                    color: (taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .taskerAgeStart ==
                                                                21) &&
                                                            (taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .taskerAgeStart ==
                                                                40)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiaryColor,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'zleu6pmw' /* 20-40 */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: (taskerdetailsM215TaskRecord
                                                                              .taskerType
                                                                              .taskerAgeStart ==
                                                                          21) &&
                                                                      (taskerdetailsM215TaskRecord
                                                                              .taskerType
                                                                              .taskerAgeStart ==
                                                                          40)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final taskUpdateData =
                                                    createTaskRecordData(
                                                  taskerType:
                                                      createTaskerTypeStruct(
                                                    taskerAgeStart: 41,
                                                    taskerAgeEnd: 90,
                                                    clearUnsetFields: false,
                                                  ),
                                                );
                                                await FFAppState()
                                                    .createdTask!
                                                    .update(taskUpdateData);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  border: Border.all(
                                                    color: (taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .taskerAgeStart ==
                                                                41) &&
                                                            (taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .taskerAgeStart ==
                                                                90)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiaryColor,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'k9th9ex0' /* 40> */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: (taskerdetailsM215TaskRecord
                                                                              .taskerType
                                                                              .taskerAgeStart ==
                                                                          41) &&
                                                                      (taskerdetailsM215TaskRecord
                                                                              .taskerType
                                                                              .taskerAgeStart ==
                                                                          90)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final taskUpdateData =
                                                    createTaskRecordData(
                                                  taskerType:
                                                      createTaskerTypeStruct(
                                                    fieldValues: {
                                                      'tasker_age_start':
                                                          FieldValue.delete(),
                                                      'tasker_age_end':
                                                          FieldValue.delete(),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                );
                                                await FFAppState()
                                                    .createdTask!
                                                    .update(taskUpdateData);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  border: Border.all(
                                                    color: (taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .taskerAgeStart ==
                                                                null) &&
                                                            (taskerdetailsM215TaskRecord
                                                                    .taskerType
                                                                    .taskerAgeStart ==
                                                                null)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .tertiaryColor,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '6hjzea81' /* Doesn't matter */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: (taskerdetailsM215TaskRecord
                                                                              .taskerType
                                                                              .taskerAgeStart ==
                                                                          null) &&
                                                                      (taskerdetailsM215TaskRecord
                                                                              .taskerType
                                                                              .taskerAgeStart ==
                                                                          null)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 30,
                                thickness: 0.5,
                                indent: 15,
                                endIndent: 15,
                                color: Color(0xFFDEDEDE),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 15, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 0, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'wbow2tvc' /* Identified */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Switch(
                                          value: switchValue ??= true,
                                          onChanged: (newValue) async {
                                            setState(
                                                () => switchValue = newValue!);
                                          },
                                          activeColor: Color(0xFFF36121),
                                          activeTrackColor: Color(0xFFECECEC),
                                          inactiveTrackColor: Color(0xFFECECEC),
                                          inactiveThumbColor: Color(0xFF8A8A8A),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Color(0xFFE0E3E7),
                              offset: Offset(0, -8),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (taskerdetailsM215TaskRecord.taskerType == null)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'hod7pci9' /* PUBLISH TASK */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 235,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ],
                              ),
                            if (taskerdetailsM215TaskRecord.taskerType != null)
                              FFButtonWidget(
                                onPressed: () async {
                                  final taskUpdateData = createTaskRecordData(
                                    taskerType: createTaskerTypeStruct(
                                      identified: switchValue,
                                      clearUnsetFields: false,
                                    ),
                                  );
                                  await taskerdetailsM215TaskRecord.reference
                                      .update(taskUpdateData);

                                  context.pushNamed('Taskerdetails-M-217');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'higimudu' /* Next > */,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(3),
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
