import 'package:flutter/material.dart';
import 'package:survey/models/survey.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                      "Registration recieved for customer  ${survey.otherNames}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                          color: Colors.black)),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'submitted ',
                      style: TextStyle(fontSize: 12.0, color: Colors.black54),
                    ),
                    Icon(
                      Icons.timeline,
                      color: Colors.black54,
                      size: 10.0,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      ' $createdDate',
                      style: TextStyle(fontSize: 12.0, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
