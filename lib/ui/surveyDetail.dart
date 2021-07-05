import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class SurveyDetail extends StatefulWidget {
  @override
  _SurveyDetailState createState() => _SurveyDetailState();
}

typedef Marker MarkerUpdateAction(Marker marker);

class _SurveyDetailState extends State<SurveyDetail> {
  dynamic data = Get.arguments;

  _SurveyDetailState();
  static final LatLng center = const LatLng(-33.86711, 151.1947171);

  GoogleMapController? controller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  int _markerIdCounter = 1;

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LatLng sourceLocation = LatLng(data[0].latitude, data[0].longitude);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text('Survey Detail'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            //width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height / 3,
            child: GoogleMap(
              myLocationEnabled: true,
              compassEnabled: true,
              tiltGesturesEnabled: false,
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: sourceLocation,
                zoom: 11.0,
              ),
              markers: <Marker>{
                Marker(
                  markerId: MarkerId("marker_1"),
                  position: sourceLocation,
                  icon: BitmapDescriptor.defaultMarker,
                )
              },
            ),
          ),
          Expanded(
            flex: 2,
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: ListView(
              //physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  // leading: Text('1.'),
                  title: Text(
                    'Marketer Name',
                  ),
                  subtitle: Text("${data[1].firstName}  ${data[1].lastName}"),
                ),
                Divider(
                  thickness: 0.5,
                ),
                data[0].responserLocation != null
                    ? ListTile(
                        //leading: Icon(Icons.location_city),
                        title: Text(
                          'Responder Location',
                        ),
                        subtitle: Text('${data[0].responserLocation}'),
                      )
                    : SizedBox(),
                data[0].responserLocation != null
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                ListTile(
                  //leading: Text('1.'),
                  title: Text(
                    'Customer Card Number',
                  ),
                  subtitle: Text('${data[0].cardNo}'),
                ),
                Divider(
                  thickness: 0.5,
                ),
                data[0].amount != null
                    ? ListTile(
                        // leading: Text('1.'),
                        title: Text(
                          'Amount',
                        ),
                        subtitle: Text('${data[0].amount}'),
                      )
                    : SizedBox(),
                data[0].amount != null
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                data[0].surname != null
                    ? ListTile(
                        // leading: Text('1.'),
                        title: Text(
                          'Customer Surname',
                        ),
                        subtitle: Text('${data[0].surname}'),
                      )
                    : SizedBox(),
                data[0].surname != null
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                data[0].otherNames != null
                    ? ListTile(
                        // leading: Text('2.'),
                        title: Text(
                          'Customer Other Names',
                        ),
                        subtitle: Text('${data[0].otherNames}'))
                    : SizedBox(),
                data[0].otherNames != null
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
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
                    ? Divider(
                        thickness: 0.5,
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
                data[0].customerTypeID != null
                    ? Divider(
                        thickness: 0.5,
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
                data[0].bvn != null
                    ? Divider(
                        thickness: 0.5,
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
                data[0].otherNumber != null
                    ? Divider(
                        thickness: 0.5,
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
                data[0].dateOfBirth != null
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                data[0].gender != null
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Gender',
                        ),
                        subtitle: Text('${data[0].gender}'))
                    : SizedBox(),
                data[0].gender != null
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                data[0].maritalStatus != null
                    ? ListTile(
                        // leading: Text('9.'),
                        title: Text(
                          'Customer marital status',
                        ),
                        subtitle: Text('${data[0].maritalStatus}'),
                      )
                    : SizedBox(),
                data[0].maritalStatus != null
                    ? Divider(
                        thickness: 0.5,
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
                data[0].address != null
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                data[0].customerIDImageUrl != null
                    ? ListTile(
                        // leading: Text('10.'),
                        title: Text(
                          'Customer ID Image',
                        ),
                      )
                    : SizedBox(),
                data[0].customerIDImageUrl != null
                    ? Image.network(
                        data[0].customerImageUrl.toString(),
                        height: 200,
                        width: 200,
                        fit: BoxFit.fitHeight,
                      )
                    : SizedBox(),
                data[0].customerIDImageName != null
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                data[0].customerIDImageName != null
                    ? ListTile(
                        // leading: Text('10.'),
                        title: Text(
                          'Customer Photo',
                        ),
                      )
                    : SizedBox(),
                data[0].customerImageUrl != null
                    ? Image.network(
                        data[0].customerImageUrl.toString(),
                        height: 200,
                        width: 200,
                        fit: BoxFit.fitHeight,
                      )
                    : SizedBox(),
                data[0].customerImageUrl != null
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                data[0].alternativeSurname != null &&
                        data[0].alternativeSurname != ''
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Surname',
                        ),
                        subtitle: Text('${data[0].alternativeSurname}'),
                      )
                    : SizedBox(),
                data[0].alternativeSurname != null &&
                        data[0].alternativeSurname != ''
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                data[0].alternativeOtherName != null &&
                        data[0].alternativeOtherName != ''
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Other Name',
                        ),
                        subtitle: Text('${data[0].alternativeOtherName}'),
                      )
                    : SizedBox(),
                data[0].alternativeOtherName != null &&
                        data[0].alternativeOtherName != ''
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                data[0].alternativePhone != null &&
                        data[0].alternativePhone != ''
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Phone Number',
                        ),
                        subtitle: Text('${data[0].alternativePhone}'),
                      )
                    : SizedBox(),
                data[0].alternativePhone != null &&
                        data[0].alternativePhone != ''
                    ? Divider(
                        thickness: 0.5,
                      )
                    : SizedBox(),
                data[0].alternativeSecondPhone != null &&
                        data[0].alternativeSecondPhone != ''
                    ? ListTile(
                        // leading: Text('8.'),
                        title: Text(
                          'Customer Alternative Second Phone Number',
                        ),
                        subtitle: Text('${data[0].alternativeSecondPhone}'),
                      )
                    : SizedBox(),
                data[0].alternativeSecondPhone != null &&
                        data[0].alternativeSecondPhone != ''
                    ? Divider(
                        thickness: 0.5,
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
                data[0].alternativeContactRelationship != null
                    ? Divider(
                        thickness: 0.5,
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
                data[0].collectionPoint != null
                    ? Divider(
                        thickness: 0.5,
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
                data[0].paymentPlan != null
                    ? Divider(
                        thickness: 0.5,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
