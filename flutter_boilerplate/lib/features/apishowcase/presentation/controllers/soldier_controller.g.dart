// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soldier_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SoldierController)
const soldierControllerProvider = SoldierControllerProvider._();

final class SoldierControllerProvider
    extends $NotifierProvider<SoldierController, DataState<SoldierUIState>> {
  const SoldierControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'soldierControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$soldierControllerHash();

  @$internal
  @override
  SoldierController create() => SoldierController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DataState<SoldierUIState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DataState<SoldierUIState>>(value),
    );
  }
}

String _$soldierControllerHash() => r'd6b31a452c31581156e1e1c9fac9e93fc18cbc35';

abstract class _$SoldierController
    extends $Notifier<DataState<SoldierUIState>> {
  DataState<SoldierUIState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<DataState<SoldierUIState>, DataState<SoldierUIState>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DataState<SoldierUIState>, DataState<SoldierUIState>>,
              DataState<SoldierUIState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
