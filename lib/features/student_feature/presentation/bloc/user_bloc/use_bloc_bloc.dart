import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'use_bloc_event.dart';
part 'use_bloc_state.dart';

class UseBlocBloc extends Bloc<UseBlocEvent, UseBlocState> {
  UseBlocBloc() : super(UseBlocInitial()) {
    on<UseBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
