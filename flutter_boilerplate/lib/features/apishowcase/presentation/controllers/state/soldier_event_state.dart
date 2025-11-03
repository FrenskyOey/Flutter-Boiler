import 'package:flutter_boilerplate/features/apishowcase/domain/models/soldier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'soldier_event_state.freezed.dart';

@freezed
class SoldierEventState with _$SoldierEventState {
  // handling toast Event
  const factory SoldierEventState.toastError(String messgae) = _ToastError;
  const factory SoldierEventState.toastSuccess(String messgae) = _ToastSuccess;

  // handling open detail page
  const factory SoldierEventState.openUser(Soldier selectedSoldier) = _OpenUser;
}
