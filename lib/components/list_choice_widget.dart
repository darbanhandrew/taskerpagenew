import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListChoiceWidget extends StatefulWidget {
  const ListChoiceWidget({
    Key? key,
    this.selectChoice,
  }) : super(key: key);

  final DocumentReference? selectChoice;

  @override
  _ListChoiceWidgetState createState() => _ListChoiceWidgetState();
}

class _ListChoiceWidgetState extends State<ListChoiceWidget> {
  String? choiceChipsValue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<FildRecord>>(
      stream: queryFildRecord(
        singleRecord: true,
      ),
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
        List<FildRecord> choiceChipsFildRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final choiceChipsFildRecord = choiceChipsFildRecordList.isNotEmpty
            ? choiceChipsFildRecordList.first
            : null;
        return FlutterFlowChoiceChips(
          options: choiceChipsFildRecord!.values!
              .toList()
              .map((label) => ChipData(label))
              .toList(),
          onChanged: (val) async {
            setState(() => choiceChipsValue = val?.first);
            if (choiceChipsValue != null && choiceChipsValue != '') {
              final fildUpdateData = {
                ...createFildRecordData(
                  type: 'radio',
                  value: true,
                ),
                'values': choiceChipsFildRecord!.values!.toList(),
              };
              await choiceChipsFildRecord!.reference.update(fildUpdateData);
            } else {
              final fildUpdateData = {
                ...createFildRecordData(
                  type: 'radio',
                  value: false,
                ),
                'values': choiceChipsFildRecord!.values!.toList(),
              };
              await choiceChipsFildRecord!.reference.update(fildUpdateData);
            }
          },
          selectedChipStyle: ChipStyle(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
            iconColor: Colors.white,
            iconSize: 18,
            elevation: 4,
          ),
          unselectedChipStyle: ChipStyle(
            backgroundColor: Colors.white,
            textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFFE3E7ED),
                ),
            iconColor: Color(0xFFE3E7ED),
            iconSize: 18,
            elevation: 4,
          ),
          chipSpacing: 10,
          multiselect: false,
          alignment: WrapAlignment.start,
        );
      },
    );
  }
}
