// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:survey/models/survey.dart';
// import 'package:survey/service/surveyDetailService.dart';

// class SurveyDetailController extends GetxController {
//   Rxn<SurveyModel> surveyList = Rxn<SurveyModel>();
//   SurveyDetailService _surveyDetailService = SurveyDetailService();
//  SurveyModel? get surveys => surveyList.value;
//   set survey(SurveyModel? value) => this.surveyList.value;

//   RxString id = ''.obs;
//   @override
//   void onInit() {
//     super.onInit();
//     print('calling fisrt');
//     // surveyList.bindStream(_surveyDetailService.getSurverysByID(id.value)!);
//   }

//   getSurveyDetails(String a) {
//     //surveyList.bindStream(_surveyDetailService.getSurverysByID(a)!);
//     print(surveyList);
//   }
// }
