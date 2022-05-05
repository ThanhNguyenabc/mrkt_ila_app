import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

const icon_height = 20.0;

class NavigationControls extends StatelessWidget {
  const NavigationControls(
      {Key? key,
      required this.webViewControllerFuture,
      this.isVisibleBackBtn = false,
      this.isVisibleForwardBtn = false})
      : super(key: key);

  final Future<WebViewController> webViewControllerFuture;
  final bool isVisibleBackBtn;
  final bool isVisibleForwardBtn;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                CupertinoIcons.chevron_left,
                size: icon_height,
                color: isVisibleBackBtn ? Colors.black : AppColors.gray,
              ),
              onPressed: !webViewReady && isVisibleBackBtn
                  ? null
                  : () {
                      if (isVisibleBackBtn)
                        controller?.goBack();
                      else
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: const Text("No back history item")),
                        );
                    },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.chevron_right,
                size: icon_height,
                color: isVisibleForwardBtn ? Colors.black : AppColors.gray,
              ),
              onPressed: !webViewReady && isVisibleForwardBtn
                  ? null
                  : () {
                      if (isVisibleForwardBtn)
                        controller?.goForward();
                      else
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: const Text("No forward history item")),
                        );
                    },
            ),
            IconButton(
              icon: SvgPicture.asset(
                "asset/icons/ic_refresh.svg",
                height: icon_height,
              ),
              onPressed: !webViewReady
                  ? null
                  : () {
                      controller!.reload();
                    },
            ),
            IconButton(
              onPressed: () async {
                final urlStr = await controller?.currentUrl();
                Clipboard.setData(ClipboardData(text: urlStr))
                    .then((_) => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: const Text("Copied")),
                        ));
              },
              icon: SvgPicture.asset(
                "asset/icons/ic_copy_link.svg",
                height: icon_height,
                color: AppColors.primaryColor,
              ),
            ),
            // IconButton(
            //   onPressed: () async {
            //     final url = await controller?.currentUrl();
            //     if (url != null && url.isNotEmpty) launch(url);
            //   },
            //   icon: SvgPicture.asset(
            //     "assets/icons/icon_open_browser.svg",
            //     height: icon_height,
            //     color: blue_09,
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
