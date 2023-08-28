import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/translation/app_translation.dart';
import 'package:flutter_templete/core/utils/string_utils.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_grid_view.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_image.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/text_button.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/login_view/login_view.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_controller.dart';
import 'package:flutter_templete/ui/views/signup_view/signup_view_widgets/custom_radio.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: screenWidth(25),
              vertical: screenWidth(20),
            ),
            children: [
              screenHeight(35).ph,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/svgs/ic_back.svg',
                        width: screenWidth(15),
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: CustomText(
                      textType: TextStyleType.SUBTITLE,
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.darkGreyColor,
                      text: tr('key_create_account'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  )
                ],
              ),
              (screenHeight(45)).ph,
              CustomImages(imageName: 'img_signup'),
              (screenHeight(40)).ph,
              CustomText(
                textAlign: TextAlign.start,
                textType: TextStyleType.SUBTITLE,
                text: tr('key_user_name'),
                textColor: AppColors.normalPurpleColor,
              ),
              (screenHeight(70)).ph,
              CustomTextFormField(
                hintText: tr('key_user_name'),
                fillColor: AppColors.lightCyanColorOpacity,
                prefixIcon: 'ic_text_field_user',
                controller: controller.usernameController,
                validator: (value) {
                  if (value!.isEmpty || StringUtil.isName(value)) {
                    return 'please check your Name';
                  }
                  return null;
                },
              ),
              (screenHeight(40)).ph,
              CustomText(
                textAlign: TextAlign.start,
                textType: TextStyleType.SUBTITLE,
                text: tr('key_mobile_number'),
                textColor: AppColors.normalPurpleColor,
              ),
              (screenHeight(70)).ph,
              CustomTextFormField(
                hintText: tr('key_mobile_number'),
                fillColor: AppColors.lightCyanColorOpacity,
                prefixIcon: 'login-signup icons=phone',
                controller: controller.mobileController,
                validator: (value) {
                  if (value!.isEmpty || StringUtil.isMobile(value)) {
                    return 'please check your Number';
                  }
                  return null;
                },
              ),
              (screenHeight(40)).ph,
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: CustomText(
                  textType: TextStyleType.SUBTITLE,
                  text: tr('key_select_specialty'),
                  textColor: AppColors.normalPurpleColor,
                ),
              ),
              (screenHeight(45)).ph,
              Obx(
                () {
                  return CustomGridView(
                    length: 3,
                    children: List.generate(
                      controller.collegeList.length,
                      (index) => Flexible(
                        child: CustomRadio(
                          text: controller.collegeList[index].name ?? "",
                          value: controller.collegeList.indexOf(
                                controller.collegeList[index],
                              ) +
                              1,
                          selectedValue: controller.collegeId,
                        ),
                      ),
                    ),
                  );
                },
              ),
              // GridView.count(
              //   crossAxisCount: 3,
              //   children: List<Widget>.generate(
              //     length,
              //     (index) => CustomRadio(text: text, value: value, selectedValue: selectedValue),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     buildRadioButton(1, 'key_medicine'),
              //     buildRadioButton(2, 'key_dentistry'),
              //     buildRadioButton(3, 'key_faculty_of_pharmacy'),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     buildRadioButton(4, 'key_it'),
              //     buildRadioButton(5, 'key_architecture'),
              //     buildRadioButton(6, 'key_nursing'),
              //   ],
              // ),
              (screenHeight(30)).ph,
              // controller.isLoding.value
              //     ? SpinKitThreeBounce(
              //         color: AppColors.darkPurpleColor,
              //       )
              //     :
              CustomButton(
                buttonTypeEnum: ButtonTypeEnum.NORMAL,
                onPressed: () {
                  // Get.to(() => const SignupView());
                  controller.register();
                },
                backgroundColor: AppColors.darkPurpleColor,
                text: tr('key_create_account'),
              ),
              (screenHeight(50)).ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    textType: TextStyleType.SMALL,
                    text: "${tr('key_have_account')} ",
                    textColor: AppColors.darkGreyColor,
                  ),
                  CustomTextButton(
                    title: tr('key_login'),
                    onTap: () {
                      Get.off(() => const LoginView());
                    },
                    textColor: AppColors.darkPurpleColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildRadioButton(int value, String key) {
  //   return Expanded(
  //     child: RadioListTile(
  //       contentPadding: EdgeInsetsDirectional.all(0),
  //       value: value,
  //       groupValue: selectedValue,
  //       onChanged: (newValue) {
  //         setState(() {
  //           selectedValue = newValue!;
  //         });
  //       },
  //       activeColor: AppColors.darkPurpleColor,
  //       title: CustomText(
  //         textType: TextStyleType.CUSTOM,
  //         text: tr(key),
  //         fontSize: screenWidth(30),
  //         textColor: AppColors.darkGreyColor,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   );
  // }
  Widget buildRadioButton(int value, String key) {
    return Obx(
      () {
        return Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
              value: value,
              groupValue: controller.selectedValue.value,
              onChanged: (newValue) {
                controller.selectedValue.value = newValue!;
              },
              activeColor: AppColors.darkPurpleColor,
            ),
            CustomText(
              textType: TextStyleType.CUSTOM,
              text: tr(key),
              fontSize: screenWidth(34),
              textColor: AppColors.darkGreyColor,
              fontWeight: FontWeight.bold,
            )
          ],
        );
      },
    );
  }
}
