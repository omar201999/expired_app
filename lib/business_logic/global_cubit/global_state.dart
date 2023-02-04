part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class AppChangeModeDarkState extends GlobalState {}

class AppChangeModeLightState extends GlobalState {}