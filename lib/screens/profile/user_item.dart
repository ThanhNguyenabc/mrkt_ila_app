import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';

class UserItem extends StatelessWidget {
  const UserItem(
      {Key? key,
      required this.title,
      this.onPress,
      this.isCurrentLogin = false,
      this.iconPath = ''})
      : super(key: key);
  final bool isCurrentLogin;
  final String title;
  final String iconPath;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    print('user item');
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPress,
        child: Row(
          children: [
            Stack(
              children: [
                SizedBox(
                    height: 50, width: 50, child: SvgPicture.asset(iconPath)),
                if (isCurrentLogin)
                  const Positioned(
                    right: 0,
                    bottom: spacing_4,
                    child: SizedBox(
                      width: 10,
                      height: 10,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle)),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              width: spacing_12,
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: isCurrentLogin ? AppColors.toryBlue : Colors.black),
              ),
            )
          ],
        ));
  }
}
