import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';

class CircularImage extends StatelessWidget {
  const CircularImage(
      {Key? key,
      required this.avatarUrl,
      this.radius = 30.0,
      this.isShowBorder = false,
      this.isShowEditView = false,
      this.onPressEdit})
      : super(key: key);
  final double radius;
  final String avatarUrl;
  final bool isShowBorder;
  final bool isShowEditView;
  final Function()? onPressEdit;

  @override
  Widget build(BuildContext context) {
    final w = radius * 2;
    return GestureDetector(
      onTap: isShowEditView ? onPressEdit : null,
      child: Stack(
        children: [
          Container(
            width: w,
            height: w,
            padding: isShowBorder ? const EdgeInsets.all(spacing_2) : null,
            decoration: isShowBorder
                ? BoxDecoration(
                    border: Border.all(color: AppColors.gray),
                    shape: BoxShape.circle,
                  )
                : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: avatarUrl.isEmpty
                  ? SvgPicture.asset('asset/icons/ic_user.svg')
                  : FadeInImage.assetNetwork(
                      fit: BoxFit.fill,
                      height: w,
                      width: w,
                      placeholder: '',
                      imageErrorBuilder: (context, object, stackTrace) {
                        return SvgPicture.asset('asset/icons/ic_user.svg');
                      },
                      image: avatarUrl),
            ),
          ),
          if (isShowEditView)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 17,
                height: 17,
                padding: const EdgeInsets.all(spacing_2),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: SvgPicture.asset(
                  "asset/icons/ic_camera.svg",
                  color: AppColors.gray,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
