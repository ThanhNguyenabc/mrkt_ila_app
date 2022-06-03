import 'package:equatable/equatable.dart';

abstract class TestEvent extends Equatable {}

class AvailableTestEvent extends TestEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FinishedTestEvent extends TestEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
