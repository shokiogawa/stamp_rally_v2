// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_place_and_stamped_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPlaceAndStampedHash() =>
    r'9f42fe0ba6815fbaff2bd0722db1774754fead14';

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

/// See also [fetchPlaceAndStamped].
@ProviderFor(fetchPlaceAndStamped)
const fetchPlaceAndStampedProvider = FetchPlaceAndStampedFamily();

/// See also [fetchPlaceAndStamped].
class FetchPlaceAndStampedFamily extends Family<AsyncValue<List<PlaceModel>>> {
  /// See also [fetchPlaceAndStamped].
  const FetchPlaceAndStampedFamily();

  /// See also [fetchPlaceAndStamped].
  FetchPlaceAndStampedProvider call(
    String url,
  ) {
    return FetchPlaceAndStampedProvider(
      url,
    );
  }

  @override
  FetchPlaceAndStampedProvider getProviderOverride(
    covariant FetchPlaceAndStampedProvider provider,
  ) {
    return call(
      provider.url,
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
  String? get name => r'fetchPlaceAndStampedProvider';
}

/// See also [fetchPlaceAndStamped].
class FetchPlaceAndStampedProvider
    extends AutoDisposeFutureProvider<List<PlaceModel>> {
  /// See also [fetchPlaceAndStamped].
  FetchPlaceAndStampedProvider(
    String url,
  ) : this._internal(
          (ref) => fetchPlaceAndStamped(
            ref as FetchPlaceAndStampedRef,
            url,
          ),
          from: fetchPlaceAndStampedProvider,
          name: r'fetchPlaceAndStampedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPlaceAndStampedHash,
          dependencies: FetchPlaceAndStampedFamily._dependencies,
          allTransitiveDependencies:
              FetchPlaceAndStampedFamily._allTransitiveDependencies,
          url: url,
        );

  FetchPlaceAndStampedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  Override overrideWith(
    FutureOr<List<PlaceModel>> Function(FetchPlaceAndStampedRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPlaceAndStampedProvider._internal(
        (ref) => create(ref as FetchPlaceAndStampedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PlaceModel>> createElement() {
    return _FetchPlaceAndStampedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPlaceAndStampedProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchPlaceAndStampedRef
    on AutoDisposeFutureProviderRef<List<PlaceModel>> {
  /// The parameter `url` of this provider.
  String get url;
}

class _FetchPlaceAndStampedProviderElement
    extends AutoDisposeFutureProviderElement<List<PlaceModel>>
    with FetchPlaceAndStampedRef {
  _FetchPlaceAndStampedProviderElement(super.provider);

  @override
  String get url => (origin as FetchPlaceAndStampedProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
