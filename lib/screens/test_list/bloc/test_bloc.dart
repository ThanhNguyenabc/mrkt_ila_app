import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrkt_app/model/base_list_item.dart';
import 'package:mrkt_app/screens/test_list/bloc/test_event.dart';
import 'package:mrkt_app/screens/test_list/bloc/test_state.dart';
import 'package:data/data.dart';

final availableMockData = [
  TestModel(
      completion: 0,
      id: "1",
      testName: "When I was young...",
      date: "15.05.2022"),
  TestModel(
      completion: 45,
      id: "2",
      testName: "Is there a bacony?",
      date: "22.05.2022")
];

final finishedMockData = [
  TestModel(
      completion: 0,
      id: "1",
      testName: "When I was young...",
      date: "15.05.2022"),
  TestModel(
      completion: 45,
      id: "2",
      testName: "Is there a bacony?",
      date: "22.05.2022"),
  TestModel(
      completion: 70,
      id: "3",
      testName: "Describing people",
      date: "15.05.2022"),
  TestModel(
      completion: 100,
      id: "4",
      testName: "What time does the bus...",
      date: "22.05.2022"),
  TestModel(
      completion: 20,
      id: "5",
      testName: "When I was young...",
      date: "15.05.2022"),
  TestModel(
      completion: 45,
      id: "6",
      testName: "Is there a bacony?",
      date: "22.05.2022"),
  TestModel(
      completion: 70,
      id: "7",
      testName: "Describing people",
      date: "15.05.2022"),
  TestModel(
      completion: 100,
      id: "8",
      testName: "What time does the bus...",
      date: "22.05.2022"),
  TestModel(
      completion: 67,
      id: "9",
      testName: "When I was young...",
      date: "15.05.2022"),
  TestModel(
      completion: 35,
      id: "10",
      testName: "Is there a bacony?",
      date: "22.05.2022"),
  TestModel(
      completion: 70,
      id: "11",
      testName: "Describing people",
      date: "15.05.2022"),
  TestModel(
      completion: 75,
      id: "22",
      testName: "What time does the bus...",
      date: "22.05.2022"),
];

class TestListBloc extends Bloc<TestEvent, TestState> {
  TestListBloc() : super(TestState.init()) {
    on<AvailableTestEvent>(fetchAvailableTest);
    on<FinishedTestEvent>(fetchFinishedTest);
    add(AvailableTestEvent());
    add(FinishedTestEvent());
  }

  fetchAvailableTest(AvailableTestEvent event, Emitter emit) async {
    await Future.delayed(const Duration(seconds: 1));
    final availableTests = List<ListItem>.from(state.availableTestList);
    final convertedData = availableMockData.map((item) => ListItem(data: item));
    availableTests
      ..removeLast()
      ..addAll(convertedData);

    emit(state.copyWith(availableTestList: availableTests));
  }

  fetchFinishedTest(FinishedTestEvent event, Emitter emit) async {
    await Future.delayed(const Duration(seconds: 2));
    final finishedTests = List<ListItem>.from(state.finishedTestList);
    final convertedData = finishedMockData.map((item) => ListItem(data: item));
    finishedTests
      ..removeLast()
      ..addAll(convertedData);

    emit(state.copyWith(finishedTestList: finishedTests));
  }
}
