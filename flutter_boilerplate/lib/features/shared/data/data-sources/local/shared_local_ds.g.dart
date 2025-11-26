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
          ShareLocalDataSource,
          ShareLocalDataSource,
          ShareLocalDataSource
        >
    with $Provider<ShareLocalDataSource> {
  const ShareLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shareLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shareLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ShareLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShareLocalDataSource create(Ref ref) {
    return shareLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShareLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShareLocalDataSource>(value),
    );
  }
}

String _$shareLocalDataSourceHash() =>
    r'5ebd2019cfffafc13224e172f9e2a854f5215e8e';
