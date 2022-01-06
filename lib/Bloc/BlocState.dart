import 'package:flutter/material.dart';

import '../DataModel/User.dart';

@immutable
abstract class BlocState {}

class Initial extends BlocState {}

class Loading extends BlocState {}

class Failed extends BlocState {
  late final Exception exception;
  Failed(this.exception);
}

class Autanticated extends BlocState {
  final User user;
  Autanticated(this.user);
}
