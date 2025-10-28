// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_local_ds.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shareLocalDataSource)
const shareLocalDataSourceProvider = ShareLocalDataSourceProvider._();

final class ShareLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<ShareLocalDataSource>,
          ShareLocalDataSource,
          FutureOr<ShareLocalDataSource>
        >
    with
        $FutureModifier<ShareLocalDataSource>,
        $FutureProvider<ShareLocalDataSource> {
  const ShareLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shareLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shareLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<ShareLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ShareLocalDataSource> create(Ref ref) {
    return shareLocalDataSource(ref);
  }
}

String _$shareLocalDataSourceHash() =>
    r'd3ba3e5d1a510a9ffd6016597b50061720089412';
