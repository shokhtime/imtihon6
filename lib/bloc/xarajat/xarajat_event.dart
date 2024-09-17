part of "xarajat_bloc.dart";

abstract class XarajatEvent {}

class XarajatLoadEvent extends XarajatEvent {}

class XarajatAddEvent extends XarajatEvent {
  final Xarajat xarajat;

  XarajatAddEvent(this.xarajat);
}

class XarajatEditEvent extends XarajatEvent {
  final Xarajat xarajat;

  XarajatEditEvent(this.xarajat);
}

class XarajatDeleteEvent extends XarajatEvent {
  final int id;
  XarajatDeleteEvent(this.id);
}
