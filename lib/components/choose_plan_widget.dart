import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/stripe/payment_manager.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChoosePlanWidget extends StatefulWidget {
  const ChoosePlanWidget({Key? key}) : super(key: key);

  @override
  _ChoosePlanWidgetState createState() => _ChoosePlanWidgetState();
}

class _ChoosePlanWidgetState extends State<ChoosePlanWidget> {
  String? paymentId;

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'z3y68zld' /* Upgrade your accout */,
                ),
                style: FlutterFlowTheme.of(context).title3,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 8),
              child: Text(
                FFLocalizations.of(context).getText(
                  'cohhpszn' /* Choose one of the  plans below... */,
                ),
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
            StreamBuilder<List<PlanRecord>>(
              stream: queryPlanRecord(),
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
                List<PlanRecord> listViewPlanRecordList = snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewPlanRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewPlanRecord =
                        listViewPlanRecordList[listViewIndex];
                    return Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  var _shouldSetState = false;
                                  final paymentResponse =
                                      await processStripePayment(
                                    context,
                                    amount: (listViewPlanRecord.onSale!
                                            ? listViewPlanRecord.salePrice!
                                            : listViewPlanRecord.price!)
                                        .round(),
                                    currency: 'EUR',
                                    customerEmail: currentUserEmail,
                                    customerName:
                                        '${valueOrDefault(currentUserDocument?.nameTitle, '')}${valueOrDefault(currentUserDocument?.firstName, '')}${valueOrDefault(currentUserDocument?.lastName, '')}',
                                    description:
                                        listViewPlanRecord.description!,
                                    allowGooglePay: false,
                                    allowApplePay: false,
                                    buttonColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    buttonTextColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                  );
                                  if (paymentResponse.paymentId == null) {
                                    if (paymentResponse.errorMessage != null) {
                                      showSnackbar(
                                        context,
                                        'Error: ${paymentResponse.errorMessage}',
                                      );
                                    }
                                    return;
                                  }
                                  paymentId = paymentResponse.paymentId!;

                                  _shouldSetState = true;
                                  if (paymentId != null && paymentId != '') {
                                    final transactionsCreateData =
                                        createTransactionsRecordData(
                                      name: random_data.randomString(
                                        1,
                                        10,
                                        true,
                                        false,
                                        true,
                                      ),
                                      amount: listViewPlanRecord.onSale!
                                          ? listViewPlanRecord.salePrice
                                          : listViewPlanRecord.price,
                                      status: true.toString(),
                                      tax: 0.0,
                                      createdAt: getCurrentTimestamp,
                                      vendorName: 'Stripe',
                                      paymentId: paymentId,
                                    );
                                    await TransactionsRecord.createDoc(
                                            currentUserReference!)
                                        .set(transactionsCreateData);

                                    final userUpdateData = {
                                      ...createUserRecordData(
                                        isPremium: true,
                                        maxChatOrder:
                                            listViewPlanRecord.chartMaxOrder,
                                      ),
                                      'max_number_of_appointments':
                                          FieldValue.increment(
                                              listViewPlanRecord
                                                  .numberOfAppointments!),
                                    };
                                    await currentUserReference!
                                        .update(userUpdateData);
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Congratulations'),
                                          content: Text(
                                              'You\'r now a premium user.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  Navigator.pop(context);
                                  if (_shouldSetState) setState(() {});
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        listViewPlanRecord.name!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          listViewPlanRecord.onSale!
                                              ? listViewPlanRecord.salePrice
                                                  ?.toString()
                                              : listViewPlanRecord.price
                                                  ?.toString(),
                                          'Free',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
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
          ],
        ),
      ),
    );
  }
}
