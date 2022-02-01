import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String uid,
    required String? imageUrl,
    required String? email,
    required String? userame,
    required String? phoneNumber,
  }) = _User;
}
