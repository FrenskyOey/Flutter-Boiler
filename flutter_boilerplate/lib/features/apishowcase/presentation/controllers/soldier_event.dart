import 'package:flutter_boilerplate/features/apishowcase/domain/models/soldier.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/state/soldier_event_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soldier_event.g.dart';

@riverpod
class SoldierEvent extends _$SoldierEvent {
  @override
  SoldierEventState? build() {
    return null;
  }

  void toastError(String message) {
    state = SoldierEventState.toastError(message);
  }

  void toastSuccess(String message) {
    state = SoldierEventState.toastSuccess(message);
  }

  void opeDetailPage(Soldier data) {
    state = SoldierEventState.openUser(data);
  }

  void resetState() {
    state = null;
  }
}
