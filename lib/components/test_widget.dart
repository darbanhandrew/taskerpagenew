import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  bool? checkboxListTileValue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Color(0xFF95A1AC),
            ),
            child: CheckboxListTile(
              value: checkboxListTileValue ??= true,
              onChanged: (newValue) async {
                setState(() => checkboxListTileValue = newValue!);
              },
              title: Text(
                FFLocalizations.of(context).getText(
                  'oppaz55a' /* Title */,
                ),
                style: FlutterFlowTheme.of(context).title3,
              ),
              subtitle: Text(
                FFLocalizations.of(context).getText(
                  'lsdq5gw1' /* Subtitle */,
                ),
                style: FlutterFlowTheme.of(context).subtitle2,
              ),
              tileColor: Color(0xFFF5F5F5),
              activeColor: FlutterFlowTheme.of(context).primaryColor,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ),
        ],
      ),
    );
  }
}
