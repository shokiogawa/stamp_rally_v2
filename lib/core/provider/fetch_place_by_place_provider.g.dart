// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_place_by_place_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPlaceByPlaceHash() => r'0177db3ec768fb8f8c3a34930bae877d27ff3182';

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

/// See also [fetchPlaceByPlace].
@ProviderFor(fetchPlaceByPlace)
const fetchPlaceByPlaceProvider = FetchPlaceByPlaceFamily();

/// See also [fetchPlaceByPlace].
class FetchPlaceByPlaceFamily extends Family<AsyncValue<List<PlaceModel>>> {
  /// See also [fetchPlaceByPlace].
  const FetchPlaceByPlaceFamily();

  /// See also [fetchPlaceByPlace].
  FetchPlaceByPlaceProvider call(
    String url,
  ) {
    return FetchPlaceByPlaceProvider(
      url,
    );
  }

  @override
  FetchPlaceByPlaceProvider getProviderOverride(
    covariant FetchPlaceByPlaceProvider provider,
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
  String? get name => r'fetchPlaceByPlaceProvider';
}

/// See also [fetchPlaceByPlace].
class FetchPlaceByPlaceProvider extends FutureProvider<List<PlaceModel>> {
  /// See also [fetchPlaceByPlace].
  FetchPlaceByPlaceProvider(
    String url,
  ) : this._internal(
          (ref) => fetchPlaceByPlace(
            ref as FetchPlaceByPlaceRef,
            url,
          ),
          from: fetchPlaceByPlaceProvider,
          name: r'fetchPlaceByPlaceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPlaceByPlaceHash,
          dependencies: FetchPlaceByPlaceFamily._dependencies,
          allTransitiveDependencies:
              FetchPlaceByPlaceFamily._allTransitiveDependencies,
          url: url,
        );

  FetchPlaceByPlaceProvider._internal(
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
    FutureOr<List<PlaceModel>> Function(FetchPlaceByPlaceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPlaceByPlaceProvider._internal(
        (ref) => create(ref as FetchPlaceByPlaceRef),
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
  FutureProviderElement<List<PlaceModel>> createElement() {
    return _FetchPlaceByPlaceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPlaceByPlaceProvider && other.url == url;
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
mixin FetchPlaceByPlaceRef on FutureProviderRef<List<PlaceModel>> {
  /// The parameter `url` of this provider.
  String get url;
}

class _FetchPlaceByPlaceProviderElement
    extends FutureProviderElement<List<PlaceModel>> with FetchPlaceByPlaceRef {
  _FetchPlaceByPlaceProviderElement(super.provider);

  @override
  String get url => (origin as FetchPlaceByPlaceProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
