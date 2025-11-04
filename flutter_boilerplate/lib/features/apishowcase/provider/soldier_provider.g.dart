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
          AsyncValue<SoldierRemoteDataSource>,
          SoldierRemoteDataSource,
          FutureOr<SoldierRemoteDataSource>
        >
    with
        $FutureModifier<SoldierRemoteDataSource>,
        $FutureProvider<SoldierRemoteDataSource> {
  const SoldierRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'soldierRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$soldierRemoteDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<SoldierRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SoldierRemoteDataSource> create(Ref ref) {
    return soldierRemoteDataSource(ref);
  }
}

String _$soldierRemoteDataSourceHash() =>
    r'd7926df6dd8434b2da7cfaa8e2f9969fd8b96724';

@ProviderFor(soldierRepository)
const soldierRepositoryProvider = SoldierRepositoryProvider._();

final class SoldierRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<SoldierRepository>,
          SoldierRepository,
          FutureOr<SoldierRepository>
        >
    with
        $FutureModifier<SoldierRepository>,
        $FutureProvider<SoldierRepository> {
  const SoldierRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'soldierRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$soldierRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<SoldierRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SoldierRepository> create(Ref ref) {
    return soldierRepository(ref);
  }
}

String _$soldierRepositoryHash() => r'e10ca614d6b84e1e1af6b32db9613872ef809533';
