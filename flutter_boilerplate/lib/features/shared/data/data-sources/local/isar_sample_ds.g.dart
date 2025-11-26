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
          EmailLocalDataSource,
          EmailLocalDataSource,
          EmailLocalDataSource
        >
    with $Provider<EmailLocalDataSource> {
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
  $ProviderElement<EmailLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EmailLocalDataSource create(Ref ref) {
    return emailLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmailLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmailLocalDataSource>(value),
    );
  }
}

String _$emailLocalDataSourceHash() =>
    r'670c7c551c03a85155ff91768ee0af400896432d';
