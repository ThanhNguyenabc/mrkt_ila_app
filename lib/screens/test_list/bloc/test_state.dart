import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mrkt_app/model/base_list_item.dart';
import 'package:mrkt_app/screens/test_list/widget/test_item_skeleton.dart';

class TestState extends Equatable {
  const TestState._({
    this.availableTestList = const [],
    this.finishedTestList = const [],
  });

  TestState.init()
      : this._(availableTestList: [
          ListItem<String>(data: "Available Test"),
          ListItem<Widget>(data: const TestItemSkeleton())
        ], finishedTestList: [
          ListItem<String>(data: "Finished Test"),
          ListItem<Widget>(data: const TestItemSkeleton())
        ]);

  final List<ListItem> availableTestList;
  final List<ListItem> finishedTestList;

  TestState copyWith(
      {Map? datam,
      List<ListItem>? availableTestList,
      List<ListItem>? finishedTestList}) {
    return TestState._(
        availableTestList: availableTestList ?? this.availableTestList,
        finishedTestList: finishedTestList ?? this.finishedTestList);
  }

  @override
  List<Object?> get props => [availableTestList, finishedTestList];
}
