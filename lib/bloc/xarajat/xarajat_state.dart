part of "xarajat_bloc.dart";

abstract class XarajatState {}

class InitialStateXarajat extends XarajatState {}

class LoadingStateXarajat extends XarajatState {}

class LoadedStateXarajat extends XarajatState {
  List<Xarajat> xarajat;

  LoadedStateXarajat(this.xarajat);
}

class ErrorStateXarajat extends XarajatState {
  final String message;
  ErrorStateXarajat(this.message);
}
