
import 'package:all_hadis/const/color_const.dart';
import 'package:all_hadis/const/text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(Icons.arrow_back_ios,color: MyColor.appWhiteColor,),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("সহিহ বুখারী",style: Style().headerText),
                      Text("ওহীর সূচনা অধ্যায়",style: Style().smallText,)
                    ],
                  ),
                ),
              ],
            ),
            const Icon(Icons.menu_outlined,color: MyColor.appWhiteColor,)
          ],
        ),
      ),
    );
  }
}