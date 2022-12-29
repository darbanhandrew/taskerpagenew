import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseSkillBottomSheetWidget extends StatefulWidget {
  const ChooseSkillBottomSheetWidget({
    Key? key,
    this.userSkill,
  }) : super(key: key);

  final UserSkillRecord? userSkill;

  @override
  _ChooseSkillBottomSheetWidgetState createState() =>
      _ChooseSkillBottomSheetWidgetState();
}

class _ChooseSkillBottomSheetWidgetState
    extends State<ChooseSkillBottomSheetWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: StreamBuilder<UserSkillRecord>(
        stream: UserSkillRecord.getDocument(widget.userSkill!.reference),
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
          final columnUserSkillRecord = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 50, 15, 25),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '82qlc2lk' /* Choose Your Skills */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: StreamBuilder<List<SkillRecord>>(
                        stream: querySkillRecord(
                          queryBuilder: (skillRecord) => skillRecord.where(
                              'category_ref',
                              isEqualTo: widget.userSkill!.skillCategoryRef),
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
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<SkillRecord> gridViewSkillRecordList =
                              snapshot.data!;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 3,
                              childAspectRatio: 4,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewSkillRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewSkillRecord =
                                  gridViewSkillRecordList[gridViewIndex];
                              return InkWell(
                                onTap: () async {
                                  if (widget.userSkill!.skillRefs!
                                          .toList()
                                          .contains(
                                              gridViewSkillRecord.reference) ==
                                      true) {
                                    final userSkillUpdateData = {
                                      'skill_refs': FieldValue.arrayRemove(
                                          [gridViewSkillRecord.reference]),
                                    };
                                    await widget.userSkill!.reference
                                        .update(userSkillUpdateData);
                                    return;
                                  } else {
                                    final userSkillUpdateData = {
                                      'skill_refs': FieldValue.arrayUnion(
                                          [gridViewSkillRecord.reference]),
                                    };
                                    await widget.userSkill!.reference
                                        .update(userSkillUpdateData);
                                    return;
                                  }
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        columnUserSkillRecord.skillRefs!
                                                .toList()
                                                .contains(gridViewSkillRecord
                                                    .reference)
                                            ? FlutterFlowTheme.of(context)
                                                .primaryColor
                                            : FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                        Color(0xFF8A8A8A),
                                      ),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Text(
                                          gridViewSkillRecord.displayName!,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: columnUserSkillRecord
                                                        .skillRefs!
                                                        .toList()
                                                        .contains(
                                                            gridViewSkillRecord
                                                                .reference)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 30,
                thickness: 0.5,
                indent: 15,
                endIndent: 15,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 25),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'q2nn8pun' /* Skill Level */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxHeight: double.infinity,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
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
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<SkillLevelRecord> gridViewSkillLevelRecordList =
                            snapshot.data!;
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 3,
                            childAspectRatio: 7,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewSkillLevelRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewSkillLevelRecord =
                                gridViewSkillLevelRecordList[gridViewIndex];
                            return InkWell(
                              onTap: () async {
                                if (widget.userSkill!.skillLevels!
                                        .toList()
                                        .contains(gridViewSkillLevelRecord
                                            .reference) ==
                                    true) {
                                  final userSkillUpdateData = {
                                    'skill_levels': FieldValue.arrayRemove(
                                        [gridViewSkillLevelRecord.reference]),
                                  };
                                  await widget.userSkill!.reference
                                      .update(userSkillUpdateData);
                                  return;
                                } else {
                                  final userSkillUpdateData = {
                                    'skill_levels': FieldValue.arrayUnion(
                                        [gridViewSkillLevelRecord.reference]),
                                  };
                                  await widget.userSkill!.reference
                                      .update(userSkillUpdateData);
                                  return;
                                }
                              },
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    color: columnUserSkillRecord.skillLevels!
                                            .toList()
                                            .contains(gridViewSkillLevelRecord
                                                .reference)
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: Text(
                                        gridViewSkillLevelRecord.displayName!,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  columnUserSkillRecord
                                                          .skillLevels!
                                                          .toList()
                                                          .contains(
                                                              gridViewSkillLevelRecord
                                                                  .reference)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .tertiaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        'pf2w40og' /* Add Skills */,
                      ),
                      options: FFButtonOptions(
                        width: 200,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
