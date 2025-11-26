// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dioClient)
const dioClientProvider = DioClientProvider._();

final class DioClientProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioClientHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dioClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioClientHash() => r'bcb7008e454756851f15f68c4a6d8b1a96df1a35';

@ProviderFor(sharedPreferencesClient)
const sharedPreferencesClientProvider = SharedPreferencesClientProvider._();

final class SharedPreferencesClientProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  const SharedPreferencesClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesClientHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferencesClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesClientHash() =>
    r'a0224f57d234da3f8a88af936b47443f21335c06';

@ProviderFor(isarClient)
const isarClientProvider = IsarClientProvider._();

final class IsarClientProvider extends $FunctionalProvider<Isar, Isar, Isar>
    with $Provider<Isar> {
  const IsarClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isarClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isarClientHash();

  @$internal
  @override
  $ProviderElement<Isar> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Isar create(Ref ref) {
    return isarClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Isar value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Isar>(value),
    );
  }
}

String _$isarClientHash() => r'7af43db50c2960405baa9eae5345599490216764';

@ProviderFor(devicConfigClient)
const devicConfigClientProvider = DevicConfigClientProvider._();

final class DevicConfigClientProvider
    extends $FunctionalProvider<DeviceConfig, DeviceConfig, DeviceConfig>
    with $Provider<DeviceConfig> {
  const DevicConfigClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'devicConfigClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$devicConfigClientHash();

  @$internal
  @override
  $ProviderElement<DeviceConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeviceConfig create(Ref ref) {
    return devicConfigClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceConfig>(value),
    );
  }
}

String _$devicConfigClientHash() => r'12f81365aedd922276d9c5bc8eacde93a062adee';
