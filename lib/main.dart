import 'package:all_hadis/const/color_const.dart';
import 'package:all_hadis/widgets/custome_app_bar.dart';
import 'package:flutter/material.dart';

import 'const/text_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All Hadis',
      home: Scaffold(
        backgroundColor: MyColor.appScaffoldColor,
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              elevation: 0,
              backgroundColor: MyColor.appColor,
              flexibleSpace: CustomAppBar(),
              pinned: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Material(
                  color: MyColor.appScaffoldColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(top: 17),
                    ),
                  ),
                ),
              ),
              expandedHeight: 65,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                text: '১/১ অধ্যায়: ',
                                style: Style()
                                    .headerText
                                    .copyWith(color: MyColor.appColor),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'আল্লাহু রাসূল ( সাল্লাল্লাহু আলাইহি ওয়া সাল্লাম)- এর প্রতী কিভাবে ওয়াহী [১] শুরু হয়েছিল। ',
                                      style: Style().headerText.copyWith(
                                          color: MyColor.appBlackColor)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: SizedBox(
                                width: double.infinity,
                                child: Divider(
                                  color: MyColor.appBlackColor.withOpacity(.4),
                                ),
                              ),
                            ),
                            Text(
                              "এ মর্মে আল্লাহ তা,আলার বাণী: নিশ্চই আমি আপনার প্রতী সেরূপ ওয়াহী প্রেরণ করেছি যেরূপ নূহ ও তার পরবর্তী নবীদের প্রতী ওয়াহী প্রেরণ করেছিলাম।(সূরা আন-নিসা ৪/১৬৩)",
                              style: Style()
                                  .smallText
                                  .copyWith(color: MyColor.appBlackColor),
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
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text("data"),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("সহিহ বুখারী",
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
                                  children: [
                                    Material(
                                      color: MyColor.appColor.withOpacity(.8),
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
                                    const SizedBox(width: 5,),
                                    Icon(Icons.mode_edit_sharp,color: MyColor.appBlackColor.withOpacity(.4),)
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text("اربك تكست هو اول موقع يسمح لزواره الكرام بتحويل الكتابة العربي ربك تكست هو اول موقع يسمح لزواره الكرام بتحويل الكتابة العربي ربك تكست هو اول موقع يسمح لزواره الكرام بتحويل الكتابة العربي الى كتابة مفهومة من قبل اغلب برامج التصميم مثل الفوتوشوب و الافترايفكتس و البريمير و الافد ميدا اربك تكست هو اول موقع يسمح لزواره الكرام بتحويل الكتابة العربي الى كتابة مفهومة من قبل اغلب برامج التصميم مثل الفوتوشوب و الافترايفكتس و البريمير و الافد ميدا كومبوزر و السموك و برامج اخرى كثير",textAlign: TextAlign.right,style: Style().smallText.copyWith(color: MyColor.appBlackColor,fontSize: 24,),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
