// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soldier_event.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SoldierEvent)
const soldierEventProvider = SoldierEventProvider._();

final class SoldierEventProvider
    extends $NotifierProvider<SoldierEvent, SoldierEventState?> {
  const SoldierEventProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'soldierEventProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$soldierEventHash();

  @$internal
  @override
  SoldierEvent create() => SoldierEvent();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SoldierEventState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SoldierEventState?>(value),
    );
  }
}

String _$soldierEventHash() => r'c4cb5883548b1238531b9b2ad9015c04566db7df';

abstract class _$SoldierEvent extends $Notifier<SoldierEventState?> {
  SoldierEventState? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SoldierEventState?, SoldierEventState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SoldierEventState?, SoldierEventState?>,
              SoldierEventState?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
