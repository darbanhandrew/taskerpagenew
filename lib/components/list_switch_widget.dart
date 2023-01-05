import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListSwitchWidget extends StatefulWidget {
  const ListSwitchWidget({
    Key? key,
    this.switchAction,
  }) : super(key: key);

  final DocumentReference? switchAction;

  @override
  _ListSwitchWidgetState createState() => _ListSwitchWidgetState();
}

class _ListSwitchWidgetState extends State<ListSwitchWidget> {
  bool? switchValue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Switch(
      value: switchValue ??= true,
      onChanged: (newValue) async {
        setState(() => switchValue = newValue!);
        if (newValue!) {
          final fildUpdateData = createFildRecordData(
            value: true,
          );
          await widget.switchAction!.update(fildUpdateData);
        } else {
          final fildUpdateData = createFildRecordData(
            value: false,
          );
          await widget.switchAction!.update(fildUpdateData);
        }
      },
      activeColor: FlutterFlowTheme.of(context).primaryColor,
    );
  }
}
