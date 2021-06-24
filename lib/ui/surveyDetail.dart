import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/models/survey.dart';

class SurveyDetail extends StatelessWidget {
  final SurveyModel data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text('Survey Detail'),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: [
                ListTile(
                  // leading: Text('1.'),
                  title: Text(
                    'Customer Surname',
                  ),
                  subtitle: Text('${data.surname}'),
                ),
                ListTile(
                  // leading: Text('2.'),
                  title: Text(
                    'Customer Other Names',
                  ),
                  subtitle: Text('${data.otherNames}'),
                ),
                data.customerTypeID != null
                    ? ListTile(
                        // leading: Text('3.'),
                        title: Text(
                          'Customer ID Type',
                        ),
                        subtitle: Text('${data.customerTypeID}'),
                      )
                    : SizedBox(),
                data.customerTypeID != null
                    ? ListTile(
                        // leading: Text('4.'),
                        title: Text(
                          '${data.customerTypeLabel}',
                        ),
                        subtitle: Text('${data.otherNames}'),
                      )
                    : SizedBox(),
                data.bvn != null
                    ? ListTile(
                        // leading: Text('5.'),
                        title: Text(
                          'Customer BVN',
                        ),
                        subtitle: Text('${data.bvn}'),
                      )
                    : SizedBox(),
                data.otherNumber != null
                    ? ListTile(
                        // leading: Text('6.'),
                        title: Text(
                          'Customer Other Number',
                        ),
                        subtitle: Text('${data.otherNumber}'),
                      )
                    : SizedBox(),
                data.dateOfBirth != null
                    ? ListTile(
                        // leading: Text('7.'),
                        title: Text(
                          'Customer date of birth',
                        ),
                        subtitle: Text('${data.dateOfBirth}'),
                      )
                    : SizedBox(),
                ListTile(
                  // leading: Text('8.'),
                  title: Text(
                    'Customer Gender',
                  ),
                  subtitle: Text('${data.gender}'),
                ),
                data.maritalStatus != null
                    ? ListTile(
                        // leading: Text('9.'),
                        title: Text(
                          'Customer marital status',
                        ),
                        subtitle: Text('${data.maritalStatus}'),
                      )
                    : SizedBox(),
                data.address != null
                    ? ListTile(
                        // leading: Text('10.'),
                        title: Text(
                          'Customer Surname',
                        ),
                        subtitle: Text('${data.otherNames}'),
                      )
                    : SizedBox(),
                data.customerIDImageUrl != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer ID photo',
                        ),
                        subtitle: Text('${data.customerIDImageName}'),
                      )
                    : SizedBox(),
                data.customerImageUrl != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Photo',
                        ),
                        subtitle: Text('${data.customerImageName}'),
                      )
                    : SizedBox(),
                data.alternativeSurname != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Surname',
                        ),
                        subtitle: Text('${data.alternativeSurname}'),
                      )
                    : SizedBox(),
                data.alternativeOtherName != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Other Name',
                        ),
                        subtitle: Text('${data.alternativeOtherName}'),
                      )
                    : SizedBox(),
                data.alternativePhone != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Phone Number',
                        ),
                        subtitle: Text('${data.alternativePhone}'),
                      )
                    : SizedBox(),
                data.alternativeSecondPhone != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Second Phone Number',
                        ),
                        subtitle: Text('${data.alternativeSecondPhone}'),
                      )
                    : SizedBox(),
                data.alternativeContactRelationship != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Contact Relationship',
                        ),
                        subtitle:
                            Text('${data.alternativeContactRelationship}'),
                      )
                    : SizedBox(),
                data.phoneType != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Phone Type',
                        ),
                        subtitle: Text('${data.phoneType}'),
                      )
                    : SizedBox(),
                data.deviceSerial != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Device Serial Number',
                        ),
                        subtitle: Text('${data.deviceSerial}'),
                      )
                    : SizedBox(),
                data.serviceCenter != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Serive Center',
                        ),
                        subtitle: Text('${data.serviceCenter}'),
                      )
                    : SizedBox(),
                data.paymentPlan != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Payment Plan',
                        ),
                        subtitle: Text('${data.paymentPlan}'),
                      )
                    : SizedBox(),
                data.sellingDSR != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Are you the selling DSR',
                        ),
                        subtitle: Text('${data.sellingDSR}'),
                      )
                    : SizedBox(),
                data.dsrName != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Name of the DSR',
                        ),
                        subtitle: Text('${data.dsrName}'),
                      )
                    : SizedBox(),
                data.responserLocation != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Responder Locationn',
                        ),
                        subtitle: Text('${data.responserLocation}'),
                      )
                    : SizedBox(),
              ],
            )),
      ),
    );
  }
}
