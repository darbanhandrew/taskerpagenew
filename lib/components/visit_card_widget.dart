import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VisitCardWidget extends StatefulWidget {
  const VisitCardWidget({
    Key? key,
    this.userDocument,
  }) : super(key: key);

  final DocumentReference? userDocument;

  @override
  _VisitCardWidgetState createState() => _VisitCardWidgetState();
}

class _VisitCardWidgetState extends State<VisitCardWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UserRecord>(
      stream: UserRecord.getDocument(widget.userDocument!),
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
        final containerUserRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 190,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Color(0x4B1A1F24),
                offset: Offset(0, 2),
              )
            ],
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).tertiaryColor,
                FlutterFlowTheme.of(context).primaryColor
              ],
              stops: [0, 1],
              begin: AlignmentDirectional(0.94, -1),
              end: AlignmentDirectional(-0.94, 1),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        containerUserRecord.photoUrl!,
                        width: 44,
                        height: 14,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        containerUserRecord.uid!.maybeHandleOverflow(
                          maxChars: 16,
                          replacement: '…',
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 32, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '${containerUserRecord.nameTitle} ${containerUserRecord.firstName} ${containerUserRecord.lastName}',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        containerUserRecord.rate!.toString(),
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 32,
                            ),
                      ),
                      RatingBarIndicator(
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Color(0xFFEDD656),
                        ),
                        direction: Axis.horizontal,
                        rating: containerUserRecord.rate!,
                        unratedColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        itemCount: 5,
                        itemSize: 40,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${containerUserRecord.roleType}-${containerUserRecord.accountType}',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto Mono',
                              color: Colors.white,
                            ),
                      ),
                      Text(
                        dateTimeFormat(
                          'yQQQ',
                          containerUserRecord.createdTime!,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto Mono',
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
