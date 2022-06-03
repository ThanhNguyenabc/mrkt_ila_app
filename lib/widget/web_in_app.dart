import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mrkt_app/widget/navigation_controls.dart';
import 'package:webview_flutter/webview_flutter.dart';

const finishStatus = 101;

class WebInAppParams {
  final String? url;
  final String? title;
  final bool isShowAppBar;
  final bool isShowBackButton;
  final bool isShowNavigation;
  final bool isDetectHardwareBackbtn;

  const WebInAppParams(
      {this.url,
      this.title,
      this.isShowAppBar = true,
      this.isShowBackButton = true,
      this.isShowNavigation = true,
      this.isDetectHardwareBackbtn = true});
}

class WebInApp extends StatefulWidget {
  const WebInApp(
      {Key? key,
      this.params = const WebInAppParams(),
      this.onWebViewCreated,
      this.onPageFinished})
      : super(key: key);

  static const route = "/web_page";
  final WebInAppParams? params;
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
    url = widget.params?.url;
    title = widget.params?.title ?? url ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final webview = buildWebview();
    return webview;
  }

  Widget buildWebview() {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: widget.params?.isDetectHardwareBackbtn == true
              ? onPressHardwareBack
              : null,
          child: Column(
            children: [
              if (Platform.isAndroid && widget.params?.isShowNavigation == true)
                buidNavigation(),
              Expanded(
                child: Stack(
                  children: [
                    WebView(
                      key: const Key("web_view"),
                      onPageStarted: (url) async {
                        print('page start');
                        print(url);
                        final controller = await webViewController.future;
                        final backOrForward = await Future.wait([
                          controller.canGoBack(),
                          controller.canGoForward()
                        ]);
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
              if (Platform.isIOS && widget.params?.isShowNavigation == true)
                buidNavigation()
            ],
          ),
        ),
      ),
    );
  }

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
