import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mrkt_app/widget/navigation_controls.dart';
import 'package:webview_flutter/webview_flutter.dart';

const finishStatus = 101;

class WebInApp extends StatefulWidget {
  const WebInApp(
      {Key? key,
      this.url,
      this.isShowAppBar = true,
      this.title,
      this.isShowBackButton = true,
      this.isShowNavigation = true,
      this.isDetectHardwareBackbtn = true,
      this.onWebViewCreated,
      this.onPageFinished})
      : super(key: key);
  final String? url;
  final String? title;
  final bool isShowAppBar;
  final bool isShowBackButton;
  final bool isShowNavigation;
  final bool isDetectHardwareBackbtn;

  final Function(WebViewController)? onWebViewCreated;
  final Function(String)? onPageFinished;
  @override
  State<WebInApp> createState() => _WebInAppState();
}

class _WebInAppState extends State<WebInApp> {
  late String? url;
  late String title;
  List<Widget>? rightIcons = [];
  bool isShowBackButton = false;
  bool isShowNexbutton = false;
  late final ValueNotifier<Map> backAndForwardBtnNotifier;
  final ValueNotifier<int> progress = ValueNotifier(0);

  late Completer<WebViewController> webViewController =
      Completer<WebViewController>();

  @override
  void initState() {
    backAndForwardBtnNotifier = ValueNotifier({});
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    url = widget.url;
    title = widget.title ?? url ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final webview = buildWebview();
    return webview;
  }

  Widget buildWebview() {
    return WillPopScope(
      onWillPop: widget.isDetectHardwareBackbtn ? onPressHardwareBack : null,
      child: Column(
        children: [
          if (Platform.isAndroid && widget.isShowNavigation) buidNavigation(),
          Expanded(
            child: Stack(
              children: [
                WebView(
                  key: const Key("web_view"),
                  onPageStarted: (url) async {
                    print('page start');
                    print(url);
                    final controller = await webViewController.future;
                    final backOrForward = await Future.wait(
                        [controller.canGoBack(), controller.canGoForward()]);
                    backAndForwardBtnNotifier.value = {
                      "isShowBackBtn": backOrForward[0],
                      "isShowNextBtn": backOrForward[1]
                    };
                  },
                  onWebViewCreated: (controller) {
                    webViewController.complete(controller);
                    widget.onWebViewCreated?.call(controller);
                  },
                  gestureRecognizers: Set()
                    ..add(Factory<VerticalDragGestureRecognizer>(
                        () => VerticalDragGestureRecognizer())),
                  onProgress: (value) {
                    progress.value = value;
                  },
                  onPageFinished: (url) {
                    progress.value = finishStatus;
                    widget.onPageFinished?.call(url);
                  },
                  initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
                ValueListenableBuilder(
                    valueListenable: progress,
                    builder: (context, int value, child) {
                      return AnimatedOpacity(
                        opacity: value == finishStatus ? 0 : 1,
                        duration: const Duration(milliseconds: 250),
                        child: LinearProgressIndicator(
                          minHeight: 3.0,
                          value: value / 100,
                        ),
                      );
                    }),
              ],
            ),
          ),
          if (Platform.isIOS && widget.isShowNavigation) buidNavigation()
        ],
      ),
    );
  }

  // Future<void> _onDoPostRequest(
  //     WebViewController controller, BuildContext context) async {
  //   final WebViewRequest request = WebViewRequest(
  //     uri: Uri.parse('https://httpbin.org/post'),
  //     method: WebViewRequestMethod.post,
  //     headers: <String, String>{'foo': 'bar', 'Content-Type': 'text/plain'},
  //   );
  //   await controller.loadRequest(request);
  // }

  Future<bool> onPressHardwareBack() async {
    final controller = await webViewController.future;
    final canGoback = await controller.canGoBack();
    if (canGoback) {
      controller.goBack();
      return Future.value(false);
    }
    return Future.value(true);
  }

  Widget buidNavigation() => ValueListenableBuilder(
      valueListenable: backAndForwardBtnNotifier,
      builder: (context, Map value, child) {
        return NavigationControls(
            isVisibleBackBtn: value["isShowBackBtn"] ?? false,
            isVisibleForwardBtn: value["isShowNextBtn"] ?? false,
            webViewControllerFuture: webViewController.future);
      });
}
