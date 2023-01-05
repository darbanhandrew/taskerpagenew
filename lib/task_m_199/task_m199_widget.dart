import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/drawwerright_widget.dart';
import '../components/task_creation_drawer_content_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskM199Widget extends StatefulWidget {
  const TaskM199Widget({Key? key}) : super(key: key);

  @override
  _TaskM199WidgetState createState() => _TaskM199WidgetState();
}

class _TaskM199WidgetState extends State<TaskM199Widget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  List<String>? choiceChipsValues;
  TextEditingController? textController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController?.dispose();
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
        final taskM199TaskRecord = snapshot.data!;
        return Title(
            title: 'TASK-M-199',
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
                toolbarHeight: 60,
                elevation: 7,
              ),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 45, 40),
                                              child: Container(
                                                width: 70,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Group_2196.png',
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.none,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 110, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SelectionArea(
                                                            child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '42ah0pv9' /* Select your task */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 0),
                                  child: StreamBuilder<List<SkillRecord>>(
                                    stream: querySkillRecord(
                                      queryBuilder: (skillRecord) =>
                                          skillRecord.where('category_ref',
                                              isEqualTo:
                                                  taskM199TaskRecord.category),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<SkillRecord>
                                          gridViewSkillRecordList =
                                          snapshot.data!;
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 2,
                                          childAspectRatio: 4,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            gridViewSkillRecordList.length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewSkillRecord =
                                              gridViewSkillRecordList[
                                                  gridViewIndex];
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final taskUpdateData =
                                                    createTaskRecordData(
                                                  skill: gridViewSkillRecord
                                                      .reference,
                                                );
                                                await taskM199TaskRecord
                                                    .reference
                                                    .update(taskUpdateData);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  border: Border.all(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      gridViewSkillRecord
                                                                  .reference ==
                                                              taskM199TaskRecord
                                                                  .skill
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    gridViewSkillRecord
                                                        .displayName!,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF8A8A8A),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
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
                                      15, 0, 0, 8),
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7jekclyy' /* Skill level */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 0, 40, 0),
                                  child: StreamBuilder<List<SkillLevelRecord>>(
                                    stream: querySkillLevelRecord(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<SkillLevelRecord>
                                          gridViewSkillLevelRecordList =
                                          snapshot.data!;
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 0,
                                          mainAxisSpacing: 0,
                                          childAspectRatio: 7,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            gridViewSkillLevelRecordList.length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewSkillLevelRecord =
                                              gridViewSkillLevelRecordList[
                                                  gridViewIndex];
                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      if (taskM199TaskRecord
                                                              .skillLevels!
                                                              .toList()
                                                              .contains(
                                                                  gridViewSkillLevelRecord
                                                                      .reference) ==
                                                          false) {
                                                        final taskUpdateData = {
                                                          'skill_levels':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            gridViewSkillLevelRecord
                                                                .reference
                                                          ]),
                                                        };
                                                        await taskM199TaskRecord
                                                            .reference
                                                            .update(
                                                                taskUpdateData);
                                                        return;
                                                      } else {
                                                        final taskUpdateData = {
                                                          'skill_levels':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            gridViewSkillLevelRecord
                                                                .reference
                                                          ]),
                                                        };
                                                        await taskM199TaskRecord
                                                            .reference
                                                            .update(
                                                                taskUpdateData);
                                                        return;
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                        border: Border.all(
                                                          color: taskM199TaskRecord
                                                                  .skillLevels!
                                                                  .toList()
                                                                  .contains(
                                                                      gridViewSkillLevelRecord
                                                                          .reference)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
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
                                                          gridViewSkillLevelRecord
                                                              .displayName!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: taskM199TaskRecord
                                                                        .skillLevels!
                                                                        .toList()
                                                                        .contains(gridViewSkillLevelRecord
                                                                            .reference)
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
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
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
                                      15, 0, 0, 8),
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ztlgykx8' /* Languages  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                      child:
                                          StreamBuilder<List<LanguageRecord>>(
                                        stream: queryLanguageRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          List<LanguageRecord>
                                              choiceChipsLanguageRecordList =
                                              snapshot.data!;
                                          return FlutterFlowChoiceChips(
                                            options:
                                                choiceChipsLanguageRecordList
                                                    .map((e) => e.displayName)
                                                    .withoutNulls
                                                    .toList()
                                                    .map((label) =>
                                                        ChipData(label))
                                                    .toList(),
                                            onChanged: (val) => setState(
                                                () => choiceChipsValues = val),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                              iconColor: Colors.white,
                                              iconSize: 18,
                                              elevation: 4,
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor: Colors.white,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFE3E7ED),
                                                      ),
                                              iconColor: Color(0xFFE3E7ED),
                                              iconSize: 18,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 10, 0),
                                              elevation: 4,
                                            ),
                                            chipSpacing: 15,
                                            multiselect: true,
                                            initialized:
                                                choiceChipsValues != null,
                                            alignment: WrapAlignment.center,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 40,
                                  thickness: 0.5,
                                  indent: 15,
                                  endIndent: 15,
                                  color: Color(0xFFDEDEDE),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.91,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                      color: Color(0xFFD4D4D4),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: textController,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'k9dh7ofa' /* Description */,
                                            ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'vckt87i7' /* Write your task description */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00D4D4D4),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00D4D4D4),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                          textAlign: TextAlign.start,
                                          maxLines: null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 8, 15, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            final selectedFile =
                                                await selectFile(
                                                    allowedExtensions: ['pdf']);
                                            if (selectedFile != null) {
                                              setState(() =>
                                                  isMediaUploading = true);
                                              String? downloadUrl;
                                              try {
                                                showUploadMessage(
                                                  context,
                                                  'Uploading file...',
                                                  showLoading: true,
                                                );
                                                downloadUrl = await uploadData(
                                                    selectedFile.storagePath,
                                                    selectedFile.bytes);
                                              } finally {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                isMediaUploading = false;
                                              }
                                              if (downloadUrl != null) {
                                                setState(() => uploadedFileUrl =
                                                    downloadUrl!);
                                                showUploadMessage(
                                                  context,
                                                  'Success!',
                                                );
                                              } else {
                                                setState(() {});
                                                showUploadMessage(
                                                  context,
                                                  'Failed to upload file',
                                                );
                                                return;
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: 138,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                color: Color(0xFFF36121),
                                              ),
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'pftbj3l2' /* Upload File */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFFF36121),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
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
                      Container(
                        width: double.infinity,
                        height: 60,
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      's5gka6d6' /* <   Back */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF292929),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(200, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      final taskUpdateData = {
                                        ...createTaskRecordData(
                                          description:
                                              taskM199TaskRecord.description,
                                          file: uploadedFileUrl,
                                          name:
                                              'Task ${random_data.randomInteger(100, 999).toString()}',
                                        ),
                                        'languages': choiceChipsValues,
                                      };
                                      await taskM199TaskRecord.reference
                                          .update(taskUpdateData);

                                      context.pushNamed('CONTACTDATA2-M-202');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '7oygvolm' /* Next   > */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 100,
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
