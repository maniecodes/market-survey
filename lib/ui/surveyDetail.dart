import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyDetail extends StatelessWidget {
  dynamic data = Get.arguments;

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
                    'Customer Card Number',
                  ),
                  subtitle: Text('${data[0].cardNo}'),
                ),
                ListTile(
                  // leading: Text('1.'),
                  title: Text(
                    'Customer Surname',
                  ),
                  subtitle: Text('${data[0].surname}'),
                ),
                ListTile(
                  // leading: Text('2.'),
                  title: Text(
                    'Customer Other Names',
                  ),
                  subtitle: Text('${data[0].otherNames}'),
                ),
                data[0].customerTypeID != null
                    ? ListTile(
                        // leading: Text('3.'),
                        title: Text(
                          'Customer ID Type',
                        ),
                        subtitle: Text('${data[0].customerTypeID}'),
                      )
                    : SizedBox(),
                data[0].customerTypeID != null
                    ? ListTile(
                        // leading: Text('4.'),
                        title: Text(
                          '${data[0].customerTypeLabel}',
                        ),
                        subtitle: Text('${data[0].otherNames}'),
                      )
                    : SizedBox(),
                data[0].bvn != null
                    ? ListTile(
                        // leading: Text('5.'),
                        title: Text(
                          'Customer BVN',
                        ),
                        subtitle: Text('${data[0].bvn}'),
                      )
                    : SizedBox(),
                data[0].otherNumber != null
                    ? ListTile(
                        // leading: Text('6.'),
                        title: Text(
                          'Customer Phone Number',
                        ),
                        subtitle: Text('${data[0].otherNumber}'),
                      )
                    : SizedBox(),
                data[0].dateOfBirth != null
                    ? ListTile(
                        // leading: Text('7.'),
                        title: Text(
                          'Customer date of birth',
                        ),
                        subtitle: Text('${data[0].dateOfBirth}'),
                      )
                    : SizedBox(),
                ListTile(
                  // leading: Text('8.'),
                  title: Text(
                    'Customer Gender',
                  ),
                  subtitle: Text('${data[0].gender}'),
                ),
                data[0].maritalStatus != null
                    ? ListTile(
                        // leading: Text('9.'),
                        title: Text(
                          'Customer marital status',
                        ),
                        subtitle: Text('${data[0].maritalStatus}'),
                      )
                    : SizedBox(),
                data[0].address != null
                    ? ListTile(
                        // leading: Text('10.'),
                        title: Text(
                          'Customer Surname',
                        ),
                        subtitle: Text('${data[0].otherNames}'),
                      )
                    : SizedBox(),
                data[0].customerIDImageUrl != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer ID photo',
                        ),
                        subtitle: Text('${data[0].customerIDImageName}'),
                      )
                    : SizedBox(),
                data[0].customerImageUrl != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Photo',
                        ),
                        subtitle: Text('${data[0].customerImageName}'),
                      )
                    : SizedBox(),
                data[0].alternativeSurname != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Surname',
                        ),
                        subtitle: Text('${data[0].alternativeSurname}'),
                      )
                    : SizedBox(),
                data[0].alternativeOtherName != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Other Name',
                        ),
                        subtitle: Text('${data[0].alternativeOtherName}'),
                      )
                    : SizedBox(),
                data[0].alternativePhone != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Phone Number',
                        ),
                        subtitle: Text('${data[0].alternativePhone}'),
                      )
                    : SizedBox(),
                data[0].alternativeSecondPhone != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Second Phone Number',
                        ),
                        subtitle: Text('${data[0].alternativeSecondPhone}'),
                      )
                    : SizedBox(),
                data[0].alternativeContactRelationship != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Contact Relationship',
                        ),
                        subtitle:
                            Text('${data[0].alternativeContactRelationship}'),
                      )
                    : SizedBox(),
                data[0].collectionPoint != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Collection Point',
                        ),
                        subtitle: Text('${data[0].collectionPoint}'),
                      )
                    : SizedBox(),
                data[0].paymentPlan != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Payment Plan',
                        ),
                        subtitle: Text('${data[0].paymentPlan}'),
                      )
                    : SizedBox(),
                data[0].salesAgent != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Sales Agent',
                        ),
                        subtitle: Text('${data[0].salesAgent}'),
                      )
                    : SizedBox(),
                data[0].responserLocation != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Responder Locationn',
                        ),
                        subtitle: Text('${data[0].responserLocation}'),
                      )
                    : SizedBox(),
              ],
            )),
      ),
    );
  }
}
