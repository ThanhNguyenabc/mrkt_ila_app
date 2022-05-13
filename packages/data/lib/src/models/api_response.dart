// ignore_for_file: constant_identifier_names

import 'package:data/data.dart';

class Result<T> extends BaseModel {
  Status status;
  T? data;
  String? message;

  Result.loading(this.message) : status = Status.LOADING;
  Result.completed(this.data) : status = Status.COMPLETED;
  Result.error(this.message) : status = Status.ERROR;

  @override
  List<Object?> get props => [status, data, message];
}

enum Status { LOADING, COMPLETED, ERROR }
