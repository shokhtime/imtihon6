import 'package:bloc/bloc.dart';

part 'daromad_event.dart';
part 'daromad_state.dart';

class DaromadBloc extends Bloc<DaromadEvent, DaromadState> {
  DaromadBloc() : super(DaromadInitial()) {
    on<DaromadEvent>((event, emit) {});
  }
}
