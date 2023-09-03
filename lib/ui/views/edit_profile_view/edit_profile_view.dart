import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../shared/colors.dart';
import '../../shared/utils.dart';
import 'edit_profile_controller.dart';

class editProfileView extends StatefulWidget {
  const editProfileView({
    Key? key,
    required this.name,
    required this.phoneNumber,
  }) : super(key: key);
  final String name;
  final int phoneNumber;

  @override
  _editProfileViewState createState() => _editProfileViewState();
}

class _editProfileViewState extends State<editProfileView> {
  late EditProfileController controller;

  void initState() {
    controller =
        Get.put(EditProfileController(widget.name, widget.phoneNumber));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenWidth(3)),
        child: CustomAppBar(
          firstText: "الملف الشخصي",
          svgName: "ic_nav_bar_profile",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(17)),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(8),
                      bottom: screenWidth(60),
                      start: screenWidth(50)),
                  child: CustomText(
                    textType: TextStyleType.SMALL,
                    text: "اسم المستخدم",
                    textColor: AppColors.darkPurpleColor,
                  ),
                ),
                CustomTextFormField(
                    hintText: "اسم المستخدم",
                    hintTextSize: 11,
                    fillColor: AppColors.lightCyanColor,
                    prefixIcon: "ic_text_field_user",
                    suffixIcon: "ic_edit",
                    prefixIconColor: AppColors.darkPurpleColor,
                    controller: controller.userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'الرجاء إدخال الاسم';
                      }
                      ;
                    }),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(30),
                      bottom: screenWidth(60),
                      start: screenWidth(50)),
                  child: CustomText(
                    textType: TextStyleType.SMALL,
                    text: "رقم الهاتف",
                    textColor: AppColors.darkPurpleColor,
                  ),
                ),
                CustomTextFormField(
                  hintText: "رقم الهاتف",
                  hintTextSize: 11,
                  fillColor: AppColors.lightCyanColor,
                  prefixIcon: "ic_text_field_phone",
                  suffixIcon: "ic_edit",
                  controller: controller.phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال رقم الهاتف';
                    }
                    return null;
                  },
                ),
                (screenWidth(2.1)).ph,
                CustomButton(
                    text: "حفظ التغييرات",
                    buttonTypeEnum: ButtonTypeEnum.CUSTOM,
                    onPressed: () => controller.editProfileInfo()),
                (screenWidth(50)).ph,
                Center(
                  child: InkWell(
                      onTap: () => Get.off(ProfileView()),
                      child: CustomText(
                        textType: TextStyleType.BODY,
                        text: 'تراجع',
                        textDecoration: TextDecoration.underline,
                        textColor: AppColors.darkPurpleColor,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
