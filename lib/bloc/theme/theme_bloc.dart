import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'theme_data.dart';

// Events
abstract class ThemeEvent {}
class ChangeThemeEvent extends ThemeEvent {
  final ThemeData theme;
  ChangeThemeEvent(this.theme);
}

// States
class ThemeState {
  final ThemeData themeData;
  ThemeState(this.themeData);
}

// BLoC
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(AppTheme.theme1)) {
    on<ChangeThemeEvent>((event, emit) {
      emit(ThemeState(event.theme));
    });
  }
}