import 'package:all_hadis/const/color_const.dart';
import 'package:flutter/material.dart';

class Style {
  TextStyle headerText =  const TextStyle(color: MyColor.appWhiteColor,fontSize: 18,fontWeight: FontWeight.w600,overflow: TextOverflow.clip);
  TextStyle mediumText =  TextStyle(color: MyColor.appBlackColor.withOpacity(0.8),fontSize: 15,fontWeight: FontWeight.w600,overflow: TextOverflow.clip);
  TextStyle smallText =  const TextStyle(color: Colors.white,fontSize: 13,overflow: TextOverflow.clip,);
}