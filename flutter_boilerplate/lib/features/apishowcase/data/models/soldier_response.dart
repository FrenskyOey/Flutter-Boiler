import 'package:flutter_boilerplate/features/apishowcase/domain/models/soldier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soldier_response.freezed.dart';
part 'soldier_response.g.dart';

@freezed
abstract class SoldierResponse with _$SoldierResponse {
  const SoldierResponse._();

  // put DTO Function in here
  const factory SoldierResponse({@Default('') String name}) = _SoldierResponse;

  // converting UserDTO object to User entity
  Soldier toDomain() {
    return Soldier(name: name, avatar: "");
  }

  factory SoldierResponse.fromDomain(Soldier soldier) {
    return SoldierResponse(name: soldier.name);
  }

  factory SoldierResponse.fromJson(Map<String, dynamic> json) =>
      _$SoldierResponseFromJson(json);
}
