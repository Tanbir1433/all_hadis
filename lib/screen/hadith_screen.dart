import 'package:all_hadis/const/color_const.dart';
import 'package:all_hadis/const/text_style.dart';
import 'package:all_hadis/controller/database_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gui_shape/geo/geo.dart';
import 'package:gui_shape/gui/gui.dart';


class HadithScreen extends StatelessWidget {
  HadithScreen({
    super.key,
  });
  final DatabaseController databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.appColor,
      body: Obx(() {
        if (databaseController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              collapsedHeight: 1,
              toolbarHeight: 0,
              elevation: 0,
              backgroundColor: MyColor.appColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            color: MyColor.appWhiteColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 7,
                              left: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(databaseController.booksList[0].title!,
                                    style: Style().headerText),
                                Text(
                                  databaseController.chapterList[0].title!,
                                  style: Style().smallText,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.menu_outlined,
                        color: MyColor.appWhiteColor,
                      )
                    ],
                  ),
                ),
              ),
              pinned: true,
              expandedHeight: 50,
              clipBehavior: Clip.hardEdge,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20)
                )
              ),
            ),
            SliverToBoxAdapter(
              child: Material(
                color: MyColor.appScaffoldColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      Material(
                        color: MyColor.appWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: databaseController.sectionsList[0]['number']+" ",
                                  style: Style()
                                      .mediumText
                                      .copyWith(color: MyColor.appColor),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:databaseController.sectionsList[0]['title'],
                                        style: Style().mediumText),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 15),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Divider(
                                    color:
                                    MyColor.appBlackColor.withOpacity(.1),
                                  ),
                                ),
                              ),
                              Text(
                                databaseController.sectionsList[0]['preface'],
                                style: Style().mediumText.copyWith(
                                    color: MyColor.appBlackColor,fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: GuiShapeBorder(
                                            shape: GuiShapePolygon(
                                              sides: 6,
                                              cornerRadius: 3,
                                              startAngle: GeoAngle(degree: 90),
                                            ),
                                          ),
                                          minimumSize: const Size(35, 55),
                                          backgroundColor: MyColor.buttonColor,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          databaseController.booksList[0].abvrCode!,
                                          style: const TextStyle(
                                              color: MyColor.appWhiteColor,
                                              fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(databaseController.booksList[0].title!,
                                              style: Style().mediumText),
                                          Text(
                                            "হাদিস: ১",
                                            style: Style().headerText.copyWith(
                                                color: MyColor.appColor),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Material(
                                        color: MyColor.appColor.withOpacity(.7),
                                        borderRadius: BorderRadius.circular(15),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 12),
                                          child: Center(
                                            child: Text(
                                              databaseController.hadithList[0].grade!,
                                              style: Style().smallText,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.ellipsisVertical,
                                        color: MyColor.appBlackColor
                                            .withOpacity(.4),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                  databaseController.hadithList[0].ar!,                                  textAlign: TextAlign.right,
                                  style: Style().arabicText),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[0].narrator!,
                                  style: Style().headerText.copyWith(color: MyColor.color)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[0].bn!,
                                  style: Style().headerText.copyWith(fontWeight:FontWeight.normal,color: MyColor.appBlackColor)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Material(
                        color: MyColor.appWhiteColor,
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                            child: Text(
                              databaseController.sectionsList[1]['number'],style: Style().headerText.copyWith(color: MyColor.buttonColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: GuiShapeBorder(
                                            shape: GuiShapePolygon(
                                              sides: 6,
                                              cornerRadius: 3,
                                              startAngle: GeoAngle(degree: 90),
                                            ),
                                          ),
                                          minimumSize: const Size(35, 55),
                                          backgroundColor: MyColor.buttonColor,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          databaseController.booksList[0].abvrCode!,
                                          style: const TextStyle(
                                              color: MyColor.appWhiteColor,
                                              fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(databaseController.booksList[0].title!,
                                              style: Style().mediumText),
                                          Text(
                                            "হাদিস: ২",
                                            style: Style().headerText.copyWith(
                                                color: MyColor.appColor),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Material(
                                        color: MyColor.appColor.withOpacity(.7),
                                        borderRadius: BorderRadius.circular(15),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 12),
                                          child: Center(
                                            child: Text(
                                              databaseController.hadithList[0].grade!,
                                              style: Style().smallText,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.ellipsisVertical,
                                        color: MyColor.appBlackColor
                                            .withOpacity(.4),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                  databaseController.hadithList[1].ar!,                                  textAlign: TextAlign.right,
                                  style: Style().arabicText),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[1].narrator!,
                                  style: Style().headerText.copyWith(color: MyColor.color)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[1].bn!,
                                  style: Style().headerText.copyWith(fontWeight:FontWeight.normal,color: MyColor.appBlackColor)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Material(
                        color: MyColor.appWhiteColor,
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                            child: Text(
                              databaseController.sectionsList[2]['number'],style: Style().headerText.copyWith(color: MyColor.buttonColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: GuiShapeBorder(
                                            shape: GuiShapePolygon(
                                              sides: 6,
                                              cornerRadius: 3,
                                              startAngle: GeoAngle(degree: 90),
                                            ),
                                          ),
                                          minimumSize: const Size(35, 55),
                                          backgroundColor: MyColor.buttonColor,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          databaseController.booksList[0].abvrCode!,
                                          style: const TextStyle(
                                              color: MyColor.appWhiteColor,
                                              fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(databaseController.booksList[0].title!,
                                              style: Style().mediumText),
                                          Text(
                                            "হাদিস: ৩",
                                            style: Style().headerText.copyWith(
                                                color: MyColor.appColor),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Material(
                                        color: MyColor.appColor.withOpacity(.7),
                                        borderRadius: BorderRadius.circular(15),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 12),
                                          child: Center(
                                            child: Text(
                                              databaseController.hadithList[0].grade!,
                                              style: Style().smallText,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.ellipsisVertical,
                                        color: MyColor.appBlackColor
                                            .withOpacity(.4),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                  databaseController.hadithList[2].ar!,                                  textAlign: TextAlign.right,
                                  style: Style().arabicText),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[2].narrator!,
                                  style: Style().headerText.copyWith(color: MyColor.color)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[2].bn!,
                                  style: Style().headerText.copyWith(fontWeight:FontWeight.normal,color: MyColor.appBlackColor)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Material(
                        color: MyColor.appWhiteColor,
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                            child: Text(
                              databaseController.sectionsList[3]['number'],style: Style().headerText.copyWith(color: MyColor.buttonColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: GuiShapeBorder(
                                            shape: GuiShapePolygon(
                                              sides: 6,
                                              cornerRadius: 3,
                                              startAngle: GeoAngle(degree: 90),
                                            ),
                                          ),
                                          minimumSize: const Size(35, 55),
                                          backgroundColor: MyColor.buttonColor,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          databaseController.booksList[0].abvrCode!,
                                          style: const TextStyle(
                                              color: MyColor.appWhiteColor,
                                              fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(databaseController.booksList[0].title!,
                                              style: Style().mediumText),
                                          Text(
                                            "হাদিস: 8",
                                            style: Style().headerText.copyWith(
                                                color: MyColor.appColor),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Material(
                                        color: MyColor.appColor.withOpacity(.7),
                                        borderRadius: BorderRadius.circular(15),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 12),
                                          child: Center(
                                            child: Text(
                                              databaseController.hadithList[0].grade!,
                                              style: Style().smallText,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.ellipsisVertical,
                                        color: MyColor.appBlackColor
                                            .withOpacity(.4),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                  databaseController.hadithList[3].ar!,                                  textAlign: TextAlign.right,
                                  style: Style().arabicText),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[3].narrator!,
                                  style: Style().headerText.copyWith(color: MyColor.color)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[3].bn!,
                                  style: Style().headerText.copyWith(fontWeight:FontWeight.normal,color: MyColor.appBlackColor)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Material(
                        color: MyColor.appWhiteColor,
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                            child: Text(
                              databaseController.sectionsList[4]['number'],style: Style().headerText.copyWith(color: MyColor.buttonColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: GuiShapeBorder(
                                            shape: GuiShapePolygon(
                                              sides: 6,
                                              cornerRadius: 3,
                                              startAngle: GeoAngle(degree: 90),
                                            ),
                                          ),
                                          minimumSize: const Size(35, 55),
                                          backgroundColor: MyColor.buttonColor,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          databaseController.booksList[0].abvrCode!,
                                          style: const TextStyle(
                                              color: MyColor.appWhiteColor,
                                              fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(databaseController.booksList[0].title!,
                                              style: Style().mediumText),
                                          Text(
                                            "হাদিস: 5",
                                            style: Style().headerText.copyWith(
                                                color: MyColor.appColor),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Material(
                                        color: MyColor.appColor.withOpacity(.7),
                                        borderRadius: BorderRadius.circular(15),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 12),
                                          child: Center(
                                            child: Text(
                                              databaseController.hadithList[0].grade!,
                                              style: Style().smallText,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.ellipsisVertical,
                                        color: MyColor.appBlackColor
                                            .withOpacity(.4),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                  databaseController.hadithList[4].ar!,                                  textAlign: TextAlign.right,
                                  style: Style().arabicText),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[4].narrator!,
                                  style: Style().headerText.copyWith(color: MyColor.color)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  databaseController.hadithList[4].bn!,
                                  style: Style().headerText.copyWith(fontWeight:FontWeight.normal,color: MyColor.appBlackColor)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}