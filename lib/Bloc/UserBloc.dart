import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Repository/UserRepo.dart';
import 'BlocState.dart';
import '../DataModel/User.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Initial());
  User? _user;

  void autanticated(String mobile, String pass) async {
    if (state is Loading) return;
    try {
      emit(Loading());
      _user = await UserRepo.authenticate(mobile, pass);
      emit(Autanticated(_user!));
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }

  User? get user => _user;
  void SignOut() => emit(Initial());
}
