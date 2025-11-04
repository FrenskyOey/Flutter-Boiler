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
    extends $AsyncNotifierProvider<SoldierController, SoldierUIState?> {
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
}

String _$soldierControllerHash() => r'f59ad2082ff640c404f6503eafcfe5ee2aae469f';

abstract class _$SoldierController extends $AsyncNotifier<SoldierUIState?> {
  FutureOr<SoldierUIState?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SoldierUIState?>, SoldierUIState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SoldierUIState?>, SoldierUIState?>,
              AsyncValue<SoldierUIState?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
