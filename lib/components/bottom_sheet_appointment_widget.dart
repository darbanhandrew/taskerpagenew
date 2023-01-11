import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/btn_s_h_by_phone_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomSheetAppointmentWidget extends StatefulWidget {
  const BottomSheetAppointmentWidget({
    Key? key,
    this.ediAppointment,
  }) : super(key: key);

  final DocumentReference? ediAppointment;

  @override
  _BottomSheetAppointmentWidgetState createState() =>
      _BottomSheetAppointmentWidgetState();
}

class _BottomSheetAppointmentWidgetState
    extends State<BottomSheetAppointmentWidget> {
  DateTime? datePicked;

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
      height: 423,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: StreamBuilder<AppointmentRecord>(
        stream: AppointmentRecord.getDocument(widget.ediAppointment!),
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
          final columnAppointmentRecord = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'ttaczirq' /* Set Aoppointment */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 17,
                          ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 25, 15, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'bzn01qim' /* Type Appointment */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            FFAppState().update(() {
                              FFAppState().typeAppointment = false;
                            });
                          },
                          text: FFLocalizations.of(context).getText(
                            'imc1k1fo' /* In Person */,
                          ),
                          options: FFButtonOptions(
                            width: 180,
                            height: 40,
                            color: Colors.white,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: !FFAppState().typeAppointment
                                          ? FlutterFlowTheme.of(context)
                                              .primaryColor
                                          : FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            borderSide: BorderSide(
                              color: !FFAppState().typeAppointment
                                  ? FlutterFlowTheme.of(context).primaryColor
                                  : FlutterFlowTheme.of(context).tertiaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: BtnSHByPhoneWidget(),
                              );
                            },
                          ).then((value) => setState(() {}));

                          FFAppState().update(() {
                            FFAppState().typeAppointment = true;
                          });
                        },
                        text: FFLocalizations.of(context).getText(
                          'ni47bthy' /* By Phone */,
                        ),
                        options: FFButtonOptions(
                          width: 180,
                          height: 40,
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Poppins',
                                color: FFAppState().typeAppointment
                                    ? FlutterFlowTheme.of(context).primaryColor
                                    : FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: FFAppState().typeAppointment
                                ? FlutterFlowTheme.of(context).primaryColor
                                : FlutterFlowTheme.of(context).tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 30,
                  thickness: 0.5,
                  indent: 15,
                  endIndent: 15,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'jxyllw7l' /* Appointment Date */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: InkWell(
                          onTap: () async {
                            final _datePickedDate = await showDatePicker(
                              context: context,
                              initialDate: getCurrentTimestamp,
                              firstDate: getCurrentTimestamp,
                              lastDate: DateTime(2050),
                            );

                            TimeOfDay? _datePickedTime;
                            if (_datePickedDate != null) {
                              _datePickedTime = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(getCurrentTimestamp),
                              );
                            }

                            if (_datePickedDate != null &&
                                _datePickedTime != null) {
                              setState(
                                () => datePicked = DateTime(
                                  _datePickedDate.year,
                                  _datePickedDate.month,
                                  _datePickedDate.day,
                                  _datePickedTime!.hour,
                                  _datePickedTime.minute,
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: 40,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 50, 0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          'M/d h:mm a',
                                          datePicked,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        'YMMMD',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF222222),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 30,
                  thickness: 0.5,
                  indent: 15,
                  endIndent: 15,
                ),
                if (!FFAppState().typeAppointment)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<UserAddressRecord>>(
                          stream: queryUserAddressRecord(
                            parent: currentUserReference,
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
                            List<UserAddressRecord>
                                listViewUserAddressRecordList = snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewUserAddressRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewUserAddressRecord =
                                    listViewUserAddressRecordList[
                                        listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().addresAppointtment =
                                            listViewUserAddressRecord.reference;
                                      });

                                      final appointmentUpdateData =
                                          createAppointmentRecordData(
                                        address: updateAddressStruct(
                                          listViewUserAddressRecord.address,
                                          clearUnsetFields: false,
                                        ),
                                      );
                                      await widget.ediAppointment!
                                          .update(appointmentUpdateData);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: listViewUserAddressRecord
                                                      .reference ==
                                                  FFAppState()
                                                      .addresAppointtment
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryColor
                                              : FlutterFlowTheme.of(context)
                                                  .tertiaryColor,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${listViewUserAddressRecord.address.city} ${listViewUserAddressRecord.address.street} ${listViewUserAddressRecord.address.postalCode}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color:
                                                      listViewUserAddressRecord
                                                                  .reference ==
                                                              FFAppState()
                                                                  .addresAppointtment
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                ),
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
                    ],
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (FFAppState().typeAppointment == false) {
                            final appointmentUpdateData =
                                createAppointmentRecordData(
                              dateTime: datePicked,
                              typeAppointment:
                                  FFAppState().typeAppointment == false
                                      ? 'In Person'
                                      : 'By Phone',
                              accepted: false,
                            );
                            await columnAppointmentRecord.reference
                                .update(appointmentUpdateData);

                            final userUpdateData = {
                              'max_number_of_appointments':
                                  FieldValue.increment(-(1)),
                            };
                            await currentUserReference!.update(userUpdateData);
                            Navigator.pop(context);
                          } else {
                            if (FFAppState().acceptPhone == true) {
                              final appointmentUpdateData =
                                  createAppointmentRecordData(
                                dateTime: datePicked,
                                typeAppointment:
                                    FFAppState().typeAppointment == false
                                        ? 'In Person'
                                        : 'By Phone',
                                phone: currentPhoneNumber,
                                accepted: false,
                              );
                              await columnAppointmentRecord.reference
                                  .update(appointmentUpdateData);

                              final userUpdateData = {
                                'max_number_of_appointments':
                                    FieldValue.increment(-(1)),
                              };
                              await currentUserReference!
                                  .update(userUpdateData);
                              Navigator.pop(context);
                            } else {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: BtnSHByPhoneWidget(),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          height: 40,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'fajumx7g' /* Apply */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 13,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await columnAppointmentRecord.reference.delete();
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'xccefah1' /* cancel */,
                          ),
                          options: FFButtonOptions(
                            width: 80,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
