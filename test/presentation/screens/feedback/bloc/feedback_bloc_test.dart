import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locket_clone/features/presentation/screens/feedback/bloc/feedback_bloc.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([])
void main() {
  late FeedbackBloc feedbackBloc;
  setUp(() {
    feedbackBloc = FeedbackBloc();
  });

  tearDown(
    () async {
      await feedbackBloc.close();
    },
  );

  String email = 'example@gmail.com';
  String firstName = 'Bonzo';
  String message = 'Test message';
  blocTest(
    'Set email',
    build: () {
      return feedbackBloc;
    },
    act: (FeedbackBloc bloc) {
      bloc.add(
        FeedbackEvent.setEmal(email),
      );
    },
    expect: () => [
      FeedbackState.initial().copyWith(
        email: email,
      ),
    ],
  );

  blocTest(
    'Set first name',
    build: () {
      return feedbackBloc;
    },
    act: (FeedbackBloc bloc) {
      bloc.add(
        FeedbackEvent.setFirstName(firstName),
      );
    },
    expect: () => [
      FeedbackState.initial().copyWith(
        firsName: firstName,
      ),
    ],
  );

  blocTest(
    'Set wrote message',
    build: () {
      return feedbackBloc;
    },
    act: (FeedbackBloc bloc) {
      bloc.add(
        FeedbackEvent.setMessage(message),
      );
    },
    expect: () => [
      FeedbackState.initial().copyWith(
        message: message,
      ),
    ],
  );

  blocTest(
    'Should return isValid as true',
    build: () {
      return feedbackBloc;
    },
    act: (FeedbackBloc bloc) {
      bloc.add(
        const FeedbackEvent.isValid(true),
      );
    },
    expect: () => [
      FeedbackState.initial().copyWith(
        isValid: true,
      ),
    ],
  );

  blocTest(
    'Should return isValid as false',
    build: () {
      return feedbackBloc;
    },
    act: (FeedbackBloc bloc) {
      bloc.add(
        const FeedbackEvent.isValid(false),
      );
    },
    expect: () => [
      FeedbackState.initial().copyWith(
        isValid: false,
      ),
    ],
  );
}
