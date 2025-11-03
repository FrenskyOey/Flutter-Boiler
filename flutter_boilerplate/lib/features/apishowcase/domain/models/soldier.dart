import 'package:freezed_annotation/freezed_annotation.dart';

part 'soldier.freezed.dart';

@freezed
abstract class Soldier with _$Soldier {
  const factory Soldier({
    @Default("") String name,
    @Default("") String avatar,
  }) = _Soldier;
}
