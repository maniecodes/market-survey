import 'package:andelinks/models/models.dart';
import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';

class SurveyCard extends StatelessWidget {
  final SurveyModel survey;
  final GestureDragCancelCallback onTap;

  const SurveyCard({Key? key, required this.survey, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UserModel user = UserModel(firstName: '', lastName: '');
    String createdDate = DateTime.parse('${survey.createdAt!.toDate()}')
        .relative(appendIfAfter: 'ago');

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 2),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade100,
                offset: Offset(1, 1),
                blurRadius: 2,
                spreadRadius: .2,
              )
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                survey.customerImageUrl != null
                    ? Image.network(
                        survey.customerImageUrl.toString(),
                        height: 50,
                        width: 50,
                        fit: BoxFit.fitHeight,
                      )
                    : Image.asset(
                        'assets/noimage2.jpeg',
                        height: 50,
                        width: 50,
                        fit: BoxFit.fitHeight,
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: RichText(
                          text: TextSpan(
                              text: "Registration recieved for ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                  color: Colors.black),
                              children: <TextSpan>[
                                survey.otherNames != null
                                    ? TextSpan(
                                        text: ' ${survey.otherNames}',
                                      )
                                    : TextSpan(text: 'an existing customer')
                              ]),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          // Text(
                          //   'Saving cus ',
                          //   style: TextStyle(
                          //       fontSize: 12.0, color: Colors.black54),
                          // ),
                          // Icon(
                          //   Icons.timeline,
                          //   color: Colors.black54,
                          //   size: 10.0,
                          // ),
                          // SizedBox(
                          //   width: 2,
                          // ),
                          Text(
                            ' $createdDate',
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.black54),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '- ',
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.black54),
                          ),
                          survey.customerType == 'Borrowing'
                              ? Text(
                                  'New Credit Sale',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black54),
                                )
                              : Text(''),
                          survey.customerType == 'Saving'
                              ? Text(
                                  'New Target Saving',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black54),
                                )
                              : Text(''),
                          survey.customerType == 'ExistingSaving'
                              ? Text(
                                  'New Target Saving',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black54),
                                )
                              : Text(''),
                          survey.customerType == 'ExistingBorrowing'
                              ? Text(
                                  'Existing Credit Sale',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black54),
                                )
                              : Text(''),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
