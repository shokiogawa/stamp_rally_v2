// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stamp_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stampDetailNotifierHash() =>
    r'8e26ba5935c7756a586ce2c56138bfb73c769c81';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$StampDetailNotifier
    extends BuildlessAutoDisposeAsyncNotifier<StampDto?> {
  late final String historicSpotId;

  FutureOr<StampDto?> build(
    String historicSpotId,
  );
}

/// See also [StampDetailNotifier].
@ProviderFor(StampDetailNotifier)
const stampDetailNotifierProvider = StampDetailNotifierFamily();

/// See also [StampDetailNotifier].
class StampDetailNotifierFamily extends Family<AsyncValue<StampDto?>> {
  /// See also [StampDetailNotifier].
  const StampDetailNotifierFamily();

  /// See also [StampDetailNotifier].
  StampDetailNotifierProvider call(
    String historicSpotId,
  ) {
    return StampDetailNotifierProvider(
      historicSpotId,
    );
  }

  @override
  StampDetailNotifierProvider getProviderOverride(
    covariant StampDetailNotifierProvider provider,
  ) {
    return call(
      provider.historicSpotId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'stampDetailNotifierProvider';
}

/// See also [StampDetailNotifier].
class StampDetailNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    StampDetailNotifier, StampDto?> {
  /// See also [StampDetailNotifier].
  StampDetailNotifierProvider(
    String historicSpotId,
  ) : this._internal(
          () => StampDetailNotifier()..historicSpotId = historicSpotId,
          from: stampDetailNotifierProvider,
          name: r'stampDetailNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stampDetailNotifierHash,
          dependencies: StampDetailNotifierFamily._dependencies,
          allTransitiveDependencies:
              StampDetailNotifierFamily._allTransitiveDependencies,
          historicSpotId: historicSpotId,
        );

  StampDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.historicSpotId,
  }) : super.internal();

  final String historicSpotId;

  @override
  FutureOr<StampDto?> runNotifierBuild(
    covariant StampDetailNotifier notifier,
  ) {
    return notifier.build(
      historicSpotId,
    );
  }

  @override
  Override overrideWith(StampDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: StampDetailNotifierProvider._internal(
        () => create()..historicSpotId = historicSpotId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        historicSpotId: historicSpotId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<StampDetailNotifier, StampDto?>
      createElement() {
    return _StampDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StampDetailNotifierProvider &&
        other.historicSpotId == historicSpotId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, historicSpotId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StampDetailNotifierRef on AutoDisposeAsyncNotifierProviderRef<StampDto?> {
  /// The parameter `historicSpotId` of this provider.
  String get historicSpotId;
}

class _StampDetailNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StampDetailNotifier,
        StampDto?> with StampDetailNotifierRef {
  _StampDetailNotifierProviderElement(super.provider);

  @override
  String get historicSpotId =>
      (origin as StampDetailNotifierProvider).historicSpotId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
