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
              collapsedHeight: 2,
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
                                  text: '১/১. অধ্যায়: ',
                                  style: Style()
                                      .headerText
                                      .copyWith(color: MyColor.appColor),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                        'আল্লাহু রাসূল ( সাল্লাল্লাহু আলাইহি ওয়া সাল্লাম)- এর প্রতী কিভাবে ওয়াহী [১] শুরু হয়েছিল। ',
                                        style: Style().headerText.copyWith(
                                            color: MyColor.appBlackColor,
                                            fontSize: 17)),
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
                                    MyColor.appBlackColor.withOpacity(.4),
                                  ),
                                ),
                              ),
                              Text(
                                databaseController.sectionsList[1]['number'].toString(),
                                style: Style().smallText.copyWith(
                                    color:
                                    MyColor.appBlackColor.withOpacity(0.5),
                                    fontSize: 15),
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
                                              "সহিহ হাদিস",
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
                              "১/১. অধ্যায়:",style: Style().headerText.copyWith(color: MyColor.color),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
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