import 'package:flutter_boilerplate/features/apishowcase/domain/models/soldier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soldier_response.freezed.dart';
part 'soldier_response.g.dart';

@freezed
abstract class SoldierResponse with _$SoldierResponse {
  const SoldierResponse._();

  const factory SoldierResponse({
    @Default('') String name,
    @Default('') String img,
  }) = _SoldierResponse;

  // converting UserDTO object to User entity
  Soldier toDomain() {
    return Soldier(name: name, avatar: img);
  }

  factory SoldierResponse.fromDomain(Soldier soldier) {
    return SoldierResponse(name: soldier.name, img: soldier.avatar);
  }

  factory SoldierResponse.fromJson(Map<String, dynamic> json) =>
      _$SoldierResponseFromJson(json);
}
