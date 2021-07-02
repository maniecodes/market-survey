import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:andelinks/controllers/controllers.dart';
import 'package:andelinks/routes/routes.dart';
import 'package:andelinks/ui/widgets/surveyCard.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class HomePage extends GetWidget<AuthController> {
  final data = Get.find<AuthController>().getUser;
  final user = Get.find<UserController>();
  final dashboard = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    print('not getting here');
    print(dashboard.isEmailVerified);
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
          )),
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
      body: Obx(
        () => dashboard.isEmailVerified.value
            ? Get.find<UserController>().user.role == 0
                ? GetX<DashboardController>(
                    init: Get.put<DashboardController>(DashboardController()),
                    builder: (DashboardController dashboardController) {
                      if (dashboardController.allSurveys != null) {
                        return GroupedListView<dynamic, String>(
                          elements: dashboardController.allSurveys!,
                          groupBy: (survey) {
                            return formatter.format(DateTime.parse(
                                survey.createdAt.toDate().toString()));
                          },
                          order: GroupedListOrder.DESC,
                          groupSeparatorBuilder: (String value) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              value,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          itemBuilder: (c, survey) {
                            // print(survey.createdAt.toDate().toString());
                            return SurveyCard(
                                survey: survey,
                                onTap: () async {
                                  Get.toNamed(Routes.VIEW_SURVERY, arguments: [
                                    survey,
                                    await Get.find<UserController>()
                                        .getUserDetailsById(survey.uid)
                                  ]);
                                });
                          },
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  )
                : GetX<DashboardController>(
                    init: Get.put<DashboardController>(DashboardController()),
                    builder: (DashboardController dashboardController) {
                      if (dashboardController.surveys != null) {
                        return GroupedListView<dynamic, String>(
                          elements: dashboardController.surveys!,
                          groupBy: (survey) {
                            return formatter.format(DateTime.parse(
                                survey.createdAt.toDate().toString()));
                          },
                          order: GroupedListOrder.DESC,
                          groupSeparatorBuilder: (String value) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              value,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          itemBuilder: (c, survey) {
                            // print(survey.createdAt.toDate().toString());
                            return SurveyCard(
                                // uid: controller.getUser.uid,
                                survey: survey,
                                onTap: () async {
                                  Get.toNamed(Routes.VIEW_SURVERY, arguments: [
                                    survey,
                                    await Get.find<UserController>()
                                        .getUserDetailsById(survey.uid)
                                  ]);
                                });
                          },
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  )
            : Text('${dashboard.isEmailVerified}'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Get.toNamed(Routes.CUSTOMER_TYPE);
        },
      ),
    );
  }
}
