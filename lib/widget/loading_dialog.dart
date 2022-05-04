import 'package:flutter/material.dart';

import 'package:mrkt_app/main.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';

const loadingSize = 30.0;

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: spacing_16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: loadingSize,
              width: loadingSize,
              child: CircularProgressIndicator(),
            ),
            const SizedBox(
              height: spacing_10,
            ),
            Text(
              "Please Wait...",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: AppColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

showLoadingDialog() {
  showDialog(
      barrierDismissible: false,
      context:  appNavigator.currentContext!,
      builder: (context) {
        return const LoadingDialog();
      });
}
