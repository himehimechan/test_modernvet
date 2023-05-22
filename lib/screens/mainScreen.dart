import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:test_modernvet/config/config.dart';
import 'package:test_modernvet/models/character_model.dart';

import 'package:test_modernvet/modules/mainScreen/mainScreen.dart';
import 'package:test_modernvet/widgets/button.dart';
import 'package:test_modernvet/widgets/cached_image.dart';

import '../widgets/body_builder.dart';

class MainScreen extends StatelessWidget {
  final MainScreenController mainScreenController;

  const MainScreen(this.mainScreenController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Obx(() => BodyBuilder(
        apiRequestStatus: mainScreenController.pageLoadStatus.value,
        child: _bodyMainScreen(),
        reload: () => {mainScreenController.loadData()},
      )),
    );
  }

  Widget _bodyMainScreen(){
    character_model data = mainScreenController.dataCharacter.value;
    var randomIndex = 0;
    var lengthData = 0;
    if(!data.isNull) {
      lengthData = data.results?.length??0;
      if(lengthData > 0){
        debugPrint("length $lengthData");
        Random random = Random();
        randomIndex = random.nextInt(lengthData);
      }
    }
    return lengthData > 0 ? ListView(
      children: [
        Gap(20.h),
        Text(
          StringsValue.header,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 20.sp,
            fontWeight: FontWeight.w400
          ),
        ),
        Gap(100.h),
        Center(
          child: Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border:Border.all(color: const Color(0xffffffff), width: 3.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedImage(
                  imageUrl: data.results![randomIndex].image!,
                  height: 132.h,
                  width: 132.w,
                ),
                Gap(11.h),
                Text(
                  data.results![randomIndex].name??"",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff)
                  ),
                ),
                Gap(35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          StringsValue.genderText,
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffffffff)
                          ),
                        ),
                        Text(
                          data.results![randomIndex].gender??"",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffffffff)
                          ),
                        ),
                      ],
                    ),),
                    Flexible(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          StringsValue.locationText,
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffffffff)
                          ),
                        ),
                        Text(
                          data.results![randomIndex].location!.name??"",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffffffff)
                          ),
                        ),
                      ],
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
        Gap(100.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Button(text: StringsValue.generateText, color: Color(0xff3873AD),
              onPress: ()=>mainScreenController.loadData(), height: 59.w,
              radius: 24, textSize: 24.sp, textColor: Color(0xffffffff),
              fontWeight: FontWeight.w400,
              borderColor: Color(0xff3873AD)),)
      ],
    ):Container();
  }
}