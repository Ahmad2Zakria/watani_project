import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomCategory02 extends StatelessWidget {
  const CustomCategory02({
    super.key,
    required this.imageUrl,
    required this.text,
    this.textColor,
  });
  final String imageUrl;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth(1.25),
            height: screenWidth(1.65),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => SizedBox(
                  width: screenWidth(10),
                  height: screenWidth(10),
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          (screenHeight(100)).ph,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(30),
            ),
            child: CustomText(
              textType: TextStyleType.BODY,
              text: text,
              // text: mealList[index].name ?? '',
              textColor: textColor ?? AppColors.mainGreyColor,
              fontSize: screenWidth(17),
              fontWeight: FontWeight.bold,
            ),
          ),
          (screenHeight(100)).ph,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(30),
            ),
            child: Row(
              children: [
                CustomText(
                  textType: TextStyleType.BODY,
                  text: 'Café',
                  textColor: AppColors.placeholderGreyColor,
                  // fontSize: ,
                ),
                CustomText(
                  textType: TextStyleType.BODY,
                  text: ' . ',
                  textColor: AppColors.mainOrangeColor,
                  // fontSize: ,
                ),
                CustomText(
                  textType: TextStyleType.BODY,
                  text: 'Western Food',
                  textColor: AppColors.placeholderGreyColor,
                  // fontSize: ,
                ),
                (screenWidth(6)).pw,
                SvgPicture.asset(
                  'assets/images/ic_star.svg',
                  color: AppColors.mainOrangeColor,
                  width: screenWidth(18),
                  height: screenWidth(18),
                ),
                CustomText(
                  textType: TextStyleType.BODY,
                  text: ' 4.9 ',
                  textColor: AppColors.mainOrangeColor,
                  // fontSize: ,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
