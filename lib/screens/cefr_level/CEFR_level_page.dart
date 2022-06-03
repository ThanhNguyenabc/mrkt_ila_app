import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/button.dart';
import 'package:mrkt_app/widget/index.dart';
import 'dart:math' as math;

import 'package:mrkt_app/widget/keep_alive_widget.dart';

const double viewportFraction = 0.65;

class CEFRLevelPage extends StatefulWidget {
  const CEFRLevelPage({Key? key, this.onSelected, this.selectIndex = 0})
      : super(key: key);
  static const route = "/cefrlevel";
  final Function(int)? onSelected;
  final int selectIndex;

  @override
  State<CEFRLevelPage> createState() => _CEFRLevelPageState();
}

class _CEFRLevelPageState extends State<CEFRLevelPage> {
  int currentIndex = 0;
  late PageController pageController;
  final selectBtnHeight = 80.0;

  @override
  void initState() {
    currentIndex = widget.selectIndex;

    pageController = PageController(
        viewportFraction: viewportFraction, initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final imageW = math.min(size.width, size.height) * viewportFraction;
    final currentMode = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        title: const Text("CEFR Level"),
      ),
      body: ColoredBox(
        color: currentMode == Brightness.dark
            ? AppColors.rhino
            : CEFRLevels[currentIndex]["color"],
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: selectBtnHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: imageW + spacing_30,
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (index) => setState(() {
                        currentIndex = index;
                      }),
                      itemCount: CEFRLevels.length,
                      itemBuilder: (context, index) {
                        final item = CEFRLevels[index];
                        return KeepAliveWidget(
                          child: AnimatedScale(
                              duration: const Duration(milliseconds: 400),
                              scale: currentIndex == index ? 1.05 : 0.85,
                              child: ImageItem(
                                path: item["image"],
                              )),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_16),
                    child: Text(
                      CEFRLevels[currentIndex]["title"],
                      style: textTheme.headline5
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: spacing_4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: spacing_16),
                    child: Text(
                      CEFRLevels[currentIndex]["des"],
                      textAlign: TextAlign.justify,
                      style: textTheme.headline5
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Image.asset("asset/images/cefr_chart.png"),
                ],
              ),
            ),
            Positioned(
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                  child: Container(
                    height: selectBtnHeight,
                    padding: const EdgeInsets.only(
                        bottom: spacing_20,
                        left: spacing_16,
                        right: spacing_16,
                        top: spacing_10),
                    child: Button(
                      title: "Select",
                      onPress: () => Navigator.pop(
                          context, {"selectedIndex": currentIndex}),
                    ),
                  ),
                ),
              ),
              bottom: 0,
              left: 0,
              right: 0,
            )
          ],
        ),
      ),
    );
  }
}

class ImageItem extends StatefulWidget {
  const ImageItem({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageW = math.min(size.width, size.height) * viewportFraction;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing_10),
      child: Image.asset(
        widget.path,
        width: imageW,
        height: imageW,
      ),
    );
  }
}
