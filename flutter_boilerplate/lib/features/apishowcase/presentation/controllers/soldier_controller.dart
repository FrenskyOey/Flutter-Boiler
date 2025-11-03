import 'dart:async';

import 'package:flutter_boilerplate/core/handlers/log/log_helper.dart';
import 'package:flutter_boilerplate/features/apishowcase/domain/models/soldier.dart';
import 'package:flutter_boilerplate/features/apishowcase/domain/repositories/soldier_repository.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/soldier_event.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/state/soldier_ui_state.dart';
import 'package:flutter_boilerplate/features/apishowcase/provider/soldier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soldier_controller.g.dart';

@riverpod
class SoldierController extends _$SoldierController {
  late SoldierRepository _repository;
  final List<Soldier> _soldiers = [];
  int _currentPage = 0;
  bool _isFetching = false;
  bool _hasMoreData = true;

  @override
  Future<SoldierUIState> build() async {
    _repository = await ref.watch(soldierRepositoryProvider.future);

    // 3. Return the initial data state.
    return SoldierUIState(data: _soldiers, hideLoading: true);
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
      state = AsyncValue.loading();
    } else {
      final currentData = state.asData!.value;
      state = AsyncValue.data(currentData.copyWith(hideLoading: false));
    }
    _loadPage();
  }

  Future<void> reloadPage() async {
    if (_isFetching || !_hasMoreData) {
      LogHelper.debug(
        'Pagination stopped: isFetching=$_isFetching, hasMoreData=$_hasMoreData',
      );
      return;
    }

    _isFetching = true;

    final nextPage = 1;
    final result = await _repository.getSoldier(nextPage, 0);

    // 4. Handle the result (Either)
    result.fold(
      (error) {
        _isFetching = false;
        LogHelper.error(error);

        if (_soldiers.isEmpty) {
          state = AsyncValue.error(error, StackTrace.current);
        } else {
          ref.read(soldierEventProvider.notifier).toastError(error);
          final currentData = state.asData!.value;
          state = AsyncValue.data(currentData.copyWith(hideLoading: true));
        }
        return;
      },
      (data) {
        _isFetching = false;
        _soldiers.clear();

        if (data.isEmpty) {
          _hasMoreData = false;
          LogHelper.debug(
            'No more data to load. Total soldiers: ${_soldiers.length}',
          );
          state = AsyncValue.data(
            SoldierUIState(data: _soldiers, hideLoading: true),
          );
          return;
        }

        _currentPage = nextPage;
        _soldiers.addAll(data);

        state = AsyncValue.data(
          SoldierUIState(data: _soldiers, hideLoading: true),
        );
        ref
            .read(soldierEventProvider.notifier)
            .toastSuccess("Data Reloaded : ${data.length}");
        return;
      },
    );
  }

  Future<void> _loadPage() async {
    final nextPage = _currentPage + 1;
    final result = await _repository.getSoldier(nextPage, _soldiers.length);

    // 4. Handle the result (Either)
    result.fold(
      (error) {
        _isFetching = false;
        LogHelper.error(error);

        if (_soldiers.isEmpty) {
          state = AsyncValue.error(error, StackTrace.current);
        } else {
          ref.read(soldierEventProvider.notifier).toastError(error);
          final currentData = state.asData!.value;
          state = AsyncValue.data(currentData.copyWith(hideLoading: true));
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
          state = AsyncValue.data(
            SoldierUIState(data: _soldiers, hideLoading: true),
          );
          return;
        }
        _currentPage = nextPage;
        _soldiers.addAll(data);

        state = AsyncValue.data(
          SoldierUIState(data: _soldiers, hideLoading: true),
        );
        ref
            .read(soldierEventProvider.notifier)
            .toastSuccess("Data loaded : ${data.length}");
        return;
      },
    );
  }

  void openDetailPage(Soldier soldiers) {
    ref.read(soldierEventProvider.notifier).opeDetailPage(soldiers);
  }
}
