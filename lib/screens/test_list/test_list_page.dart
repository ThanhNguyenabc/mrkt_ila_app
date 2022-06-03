import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/model/base_list_item.dart';
import 'package:mrkt_app/screens/test_list/bloc/test_bloc.dart';
import 'package:mrkt_app/screens/test_list/bloc/test_state.dart';
import 'package:mrkt_app/screens/test_list/widget/test_item_skeleton.dart';
import 'package:mrkt_app/service_locator.dart';
import 'package:mrkt_app/utils/app_theme.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/web_in_app.dart';

import 'widget/test_item.dart';

class TestListPage extends StatefulWidget {
  const TestListPage({Key? key}) : super(key: key);
  static const route = "/test_list_page";

  @override
  State<TestListPage> createState() => _TestListPageState();
}

class _TestListPageState extends State<TestListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<TestListBloc>(),
        child: CustomScrollView(
          slivers: [
            BlocBuilder<TestListBloc, TestState>(
                buildWhen: (previous, current) =>
                    previous.availableTestList != current.availableTestList,
                builder: (context, state) {
                  return buildDataList(context, state.availableTestList);
                }),
            BlocBuilder<TestListBloc, TestState>(
                buildWhen: (previous, current) =>
                    previous.finishedTestList != current.finishedTestList,
                builder: (context, state) {
                  return buildDataList(context, state.finishedTestList);
                }),
          ],
        ));
  }

  Widget buildDataList(BuildContext context, List dataList) {
    return SliverPadding(
      padding: const EdgeInsets.all(spacing_16),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        final item = dataList[index];
        if (item.data is String) {
          return Padding(
            padding: const EdgeInsets.only(top: spacing_24, bottom: spacing_12),
            child: Text(
              item.data,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          );
        }
        if (item.data is TestItemSkeleton) {
          //generate 2 skeletons
          return Column(
              children: const [TestItemSkeleton(), TestItemSkeleton()]);
        }
        return GestureDetector(
          child: TestItem(data: item.data),
          onTap: () {
            Navigator.of(context).pushNamed(WebInApp.route,
                arguments: const WebInAppParams(
                    url:
                        'https://beta.learn.ila.edu.vn/?module=test&framework=null&test=content/lessons/SJ-01-001/test&autologin'));
          },
        );
      }, childCount: dataList.length)),
    );
  }
}
