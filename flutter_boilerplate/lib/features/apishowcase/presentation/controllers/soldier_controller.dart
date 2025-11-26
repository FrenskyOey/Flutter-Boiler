import 'dart:async';

import 'package:flutter_boilerplate/core/handlers/log/log_helper.dart';
import 'package:flutter_boilerplate/core/states/data_state.dart';
import 'package:flutter_boilerplate/features/apishowcase/domain/models/soldier.dart';
import 'package:flutter_boilerplate/features/apishowcase/domain/repositories/soldier_repository.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/state/soldier_event_state.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/state/soldier_ui_state.dart';
import 'package:flutter_boilerplate/features/apishowcase/provider/soldier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soldier_controller.g.dart';

@riverpod
class SoldierController extends _$SoldierController {
  final List<Soldier> _soldiers = [];
  int _currentPage = 0;
  bool _isFetching = false;
  bool _hasMoreData = true;
  late SoldierRepository _repo;

  final _eventController = StreamController<SoldierEventState>.broadcast();

  @override
  DataState<SoldierUIState> build() {
    _repo = ref.read(soldierRepositoryProvider);

    ref.onDispose(() {
      _eventController.close();
    });

    return Initial();
  }

  Stream<SoldierEventState> getEventStream() {
    return _eventController.stream;
  }

  Future<void> loadNextPage() async {
    if (_isFetching || !_hasMoreData) {
      LogHelper.debug(
        'Pagination stopped: isFetching=$_isFetching, hasMoreData=$_hasMoreData',
      );
      return;
    }

    _isFetching = true;

    if (_soldiers.isEmpty) {
      state = Loading();
    } else if (state is Success) {
      final currentData = state as Success;
      final newData = currentData.data.copyWith(hideLoading: false);
      state = Success(newData);
    }
    _loadPage();
  }

  Future<void> _loadPage() async {
    final nextPage = _currentPage + 1;
    final result = await _repo.getSoldier(nextPage, _soldiers.length);

    result.fold(
      (error) {
        _isFetching = false;
        LogHelper.error(error);

        if (state is Success) {
          _eventController.add(SoldierEventState.toastError(error));
          final currentData = state as Success;
          final newData = currentData.data.copyWith(hideLoading: true);
          state = Success(newData);
        } else {
          state = Error(error);
        }
        return;
      },
      (data) {
        _isFetching = false;
        if (data.isEmpty) {
          _hasMoreData = false;
          LogHelper.debug(
            'No more data to load. Total soldiers: ${_soldiers.length}',
          );

          if (state is Success) {
            final currentData = state as Success;
            final newData = currentData.data.copyWith(hideLoading: true);
            state = Success(newData);
          }
          return;
        }

        _currentPage = nextPage;
        _soldiers.addAll(data);

        state = Success(SoldierUIState(data: _soldiers, hideLoading: true));

        _eventController.add(
          SoldierEventState.toastSuccess("Data loaded : ${data.length}"),
        );
        return;
      },
    );
  }

  void openDetailPage(Soldier soldiers) {
    _eventController.add(SoldierEventState.openUser(soldiers));
  }
}
