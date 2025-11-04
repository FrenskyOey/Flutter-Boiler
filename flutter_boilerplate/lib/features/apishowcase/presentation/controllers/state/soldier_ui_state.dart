import 'package:flutter_boilerplate/features/apishowcase/domain/models/soldier.dart';

class SoldierUIState {
  final List<Soldier> data;
  final bool? hideLoading;

  SoldierUIState({required this.data, required this.hideLoading});

  SoldierUIState copyWith({bool? hideLoading, List<Soldier>? data}) {
    return SoldierUIState(
      data: data ?? this.data,
      hideLoading: hideLoading ?? this.hideLoading,
    );
  }
}
