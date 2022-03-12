import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_state.dart';
part 'feedback_event.dart';
part 'feedback_bloc.freezed.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackState.initial());

  @override
  Stream<FeedbackState> mapEventToState(FeedbackEvent event) async* {
    yield* event.map(
      setEmal: _mapSetEmailToState,
      setFirstName: _mapSetFirstNameToState,
      setMessage: _mapSetMessageToState,
      isValid: _mapIsValidToState,
    );
  }

  Stream<FeedbackState> _mapSetEmailToState(_SetEmail event) async* {
    yield state.copyWith(email: event.email);
  }

  Stream<FeedbackState> _mapSetFirstNameToState(_FirstName event) async* {
    yield state.copyWith(firsName: event.firstName);
  }

  Stream<FeedbackState> _mapSetMessageToState(_SetMessage event) async* {
    yield state.copyWith(message: event.message);
  }

  Stream<FeedbackState> _mapIsValidToState(_IsValid event) async* {
    yield state.copyWith(isValid: event.isValid);
  }
}
