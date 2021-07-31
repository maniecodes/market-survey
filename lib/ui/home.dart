import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:andelinks/controllers/controllers.dart';
import 'package:andelinks/routes/routes.dart';
import 'package:andelinks/ui/widgets/surveyCard.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends GetWidget<AuthController> {
  final auth = Get.find<AuthController>().getUser;
  final user = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.black,
      primary: Colors.black87,
      minimumSize: Size(40, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: GetX<UserController>(
          initState: (_) async {
            Get.find<UserController>().user = await user.getUserDetails();
          },
          builder: (_) {
            return Text(
              'Welcome ' + _.user.firstName.toString(),
              style: Theme.of(context).textTheme.headline1,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: GetX<UserController>(
          initState: (_) async {
            Get.find<UserController>().user = await user.getUserDetails();
          },
          builder: (_) {
            return Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(_.user.firstName.toString()),
                  accountEmail: Text(_.user.email.toString()),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Home'),
                      leading: Icon(Icons.home),
                      onTap: () => Get.back(),
                    ),
                    controller.getUser.emailVerified
                        ? ListTile(
                            title: Text('Create Survery'),
                            leading: Icon(Icons.favorite),
                            onTap: () => Get.toNamed(Routes.CUSTOMER_TYPE))
                        : SizedBox(),
                    // ListTile(
                    //   title: Text('Change Password'),
                    //   leading: Icon(Icons.lock),
                    //   onTap: () {},
                    // ),
                    ListTile(
                      title: Text('Logout'),
                      leading: Icon(Icons.exit_to_app),
                      onTap: () => Get.find<AuthController>().signOut(),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
      body: auth.emailVerified
          ? Obx(
              () => Get.find<UserController>().user.role == 0
                  ? SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
                      controller:
                          Get.find<DashboardController>().refreshController,
                      onRefresh: Get.find<DashboardController>().onRefresh,
                      onLoading: Get.find<DashboardController>().onLoading,
                      child: GetX<DashboardController>(
                        init:
                            Get.put<DashboardController>(DashboardController()),
                        builder: (DashboardController dashboardController) {
                          if (dashboardController.allSurveys != null) {
                            return dashboardController.allSurveys!.length != 0
                                ? GroupedListView<dynamic, String>(
                                    elements: dashboardController.allSurveys!,
                                    groupBy: (survey) {
                                      return formatter.format(DateTime.parse(
                                          survey.createdAt
                                              .toDate()
                                              .toString()));
                                    },
                                    order: GroupedListOrder.DESC,
                                    groupSeparatorBuilder: (String value) =>
                                        Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    itemBuilder: (c, survey) {
                                      return SurveyCard(
                                          survey: survey,
                                          onTap: () async {
                                            Get.toNamed(Routes.VIEW_SURVERY,
                                                arguments: [
                                                  survey,
                                                  await Get.find<
                                                          UserController>()
                                                      .getUserDetailsById(
                                                          survey.uid)
                                                ]);
                                          });
                                    },
                                  )
                                : Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/empty1.gif',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          fit: BoxFit.fitHeight,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: RichText(
                                            text: TextSpan(
                                                text:
                                                    'No survey found. Click on the',
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          '  + sign to get started.')
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    )
                  : SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
                      controller:
                          Get.find<DashboardController>().refreshController,
                      onRefresh: Get.find<DashboardController>().onRefresh,
                      onLoading: Get.find<DashboardController>().onLoading,
                      child: GetX<DashboardController>(
                        init:
                            Get.put<DashboardController>(DashboardController()),
                        builder: (DashboardController dashboardController) {
                          if (dashboardController.surveys != null) {
                            return dashboardController.surveys!.length != 0
                                ? GroupedListView<dynamic, String>(
                                    elements: dashboardController.surveys!,
                                    groupBy: (survey) {
                                      return formatter.format(DateTime.parse(
                                          survey.createdAt
                                              .toDate()
                                              .toString()));
                                    },
                                    order: GroupedListOrder.DESC,
                                    groupSeparatorBuilder: (String value) =>
                                        Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    itemBuilder: (c, survey) {
                                      // print(survey.createdAt.toDate().toString());
                                      return SurveyCard(
                                          // uid: controller.getUser.uid,
                                          survey: survey,
                                          onTap: () async {
                                            Get.toNamed(Routes.VIEW_SURVERY,
                                                arguments: [
                                                  survey,
                                                  await Get.find<
                                                          UserController>()
                                                      .getUserDetailsById(
                                                          survey.uid)
                                                ]);
                                          });
                                    },
                                  )
                                : Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/empty1.gif',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          fit: BoxFit.fitHeight,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: RichText(
                                            text: TextSpan(
                                                text:
                                                    'No survey found. Click on the',
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          '  + sign to get started.')
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
            )
          : Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/email_verify.png',
                    height: MediaQuery.of(context).size.height / 2,
                    fit: BoxFit.fitHeight,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: RichText(
                      text: TextSpan(
                          text: 'check your email to verify your account.',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    ' Click on refresh after verifying your account.')
                          ]),
                    ),
                  ),
                  TextButton(
                      style: flatButtonStyle,
                      onPressed: controller.checkVerification,
                      child: Text(
                        'Resend Verification / Refresh',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: auth.emailVerified
          ? FloatingActionButton(
              isExtended: true,
              child: Icon(Icons.add),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Get.toNamed(Routes.CUSTOMER_TYPE);
              },
            )
          : null,
    );
  }
}
