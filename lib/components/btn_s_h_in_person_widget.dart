import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BtnSHInPersonWidget extends StatefulWidget {
  const BtnSHInPersonWidget({Key? key}) : super(key: key);

  @override
  _BtnSHInPersonWidgetState createState() => _BtnSHInPersonWidgetState();
}

class _BtnSHInPersonWidgetState extends State<BtnSHInPersonWidget> {
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
      height: 588,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
        child: StreamBuilder<List<UserAddressRecord>>(
          stream: queryUserAddressRecord(),
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
            List<UserAddressRecord> listViewUserAddressRecordList =
                snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: listViewUserAddressRecordList.length,
              itemBuilder: (context, listViewIndex) {
                final listViewUserAddressRecord =
                    listViewUserAddressRecordList[listViewIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: InkWell(
                    onTap: () async {
                      FFAppState().update(() {
                        FFAppState().AddressAppointment =
                            listViewUserAddressRecord.address.street!;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            listViewUserAddressRecord.address.location!
                                .toString(),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
