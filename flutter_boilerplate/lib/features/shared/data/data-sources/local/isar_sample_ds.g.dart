// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_sample_ds.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(emailLocalDataSource)
const emailLocalDataSourceProvider = EmailLocalDataSourceProvider._();

final class EmailLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<EmailLocalDataSource>,
          EmailLocalDataSource,
          FutureOr<EmailLocalDataSource>
        >
    with
        $FutureModifier<EmailLocalDataSource>,
        $FutureProvider<EmailLocalDataSource> {
  const EmailLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emailLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emailLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<EmailLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EmailLocalDataSource> create(Ref ref) {
    return emailLocalDataSource(ref);
  }
}

String _$emailLocalDataSourceHash() =>
    r'155493fae03658b183a10218e0fd7635612c858a';
