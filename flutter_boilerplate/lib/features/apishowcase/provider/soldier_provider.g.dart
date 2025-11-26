// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soldier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(soldierRemoteDataSource)
const soldierRemoteDataSourceProvider = SoldierRemoteDataSourceProvider._();

final class SoldierRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          SoldierRemoteDataSource,
          SoldierRemoteDataSource,
          SoldierRemoteDataSource
        >
    with $Provider<SoldierRemoteDataSource> {
  const SoldierRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'soldierRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$soldierRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<SoldierRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SoldierRemoteDataSource create(Ref ref) {
    return soldierRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SoldierRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SoldierRemoteDataSource>(value),
    );
  }
}

String _$soldierRemoteDataSourceHash() =>
    r'9d5efd4c1cb6ae2d99bde85ce4bc0006b1a47e02';

@ProviderFor(soldierRepository)
const soldierRepositoryProvider = SoldierRepositoryProvider._();

final class SoldierRepositoryProvider
    extends
        $FunctionalProvider<
          SoldierRepository,
          SoldierRepository,
          SoldierRepository
        >
    with $Provider<SoldierRepository> {
  const SoldierRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'soldierRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$soldierRepositoryHash();

  @$internal
  @override
  $ProviderElement<SoldierRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SoldierRepository create(Ref ref) {
    return soldierRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SoldierRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SoldierRepository>(value),
    );
  }
}

String _$soldierRepositoryHash() => r'fe2d9b291103d722c5023efbbb8d78e5be1518b1';
