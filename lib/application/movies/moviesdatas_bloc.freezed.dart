// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'moviesdatas_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoviesdataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeData value) getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesdataEventCopyWith<$Res> {
  factory $MoviesdataEventCopyWith(
          MoviesdataEvent value, $Res Function(MoviesdataEvent) then) =
      _$MoviesdataEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MoviesdataEventCopyWithImpl<$Res>
    implements $MoviesdataEventCopyWith<$Res> {
  _$MoviesdataEventCopyWithImpl(this._value, this._then);

  final MoviesdataEvent _value;
  // ignore: unused_field
  final $Res Function(MoviesdataEvent) _then;
}

/// @nodoc
abstract class _$$GetHomeDataCopyWith<$Res> {
  factory _$$GetHomeDataCopyWith(
          _$GetHomeData value, $Res Function(_$GetHomeData) then) =
      __$$GetHomeDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeDataCopyWithImpl<$Res>
    extends _$MoviesdataEventCopyWithImpl<$Res>
    implements _$$GetHomeDataCopyWith<$Res> {
  __$$GetHomeDataCopyWithImpl(
      _$GetHomeData _value, $Res Function(_$GetHomeData) _then)
      : super(_value, (v) => _then(v as _$GetHomeData));

  @override
  _$GetHomeData get _value => super._value as _$GetHomeData;
}

/// @nodoc

class _$GetHomeData implements GetHomeData {
  const _$GetHomeData();

  @override
  String toString() {
    return 'MoviesdataEvent.getHomeData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeData,
  }) {
    return getHomeData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getHomeData,
  }) {
    return getHomeData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeData,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeData value) getHomeData,
  }) {
    return getHomeData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
  }) {
    return getHomeData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData(this);
    }
    return orElse();
  }
}

abstract class GetHomeData implements MoviesdataEvent {
  const factory GetHomeData() = _$GetHomeData;
}

/// @nodoc
mixin _$MoviesdataState {
  List<Movie> get moviesList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoviesdataStateCopyWith<MoviesdataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesdataStateCopyWith<$Res> {
  factory $MoviesdataStateCopyWith(
          MoviesdataState value, $Res Function(MoviesdataState) then) =
      _$MoviesdataStateCopyWithImpl<$Res>;
  $Res call({List<Movie> moviesList, bool isLoading, bool hasError});
}

/// @nodoc
class _$MoviesdataStateCopyWithImpl<$Res>
    implements $MoviesdataStateCopyWith<$Res> {
  _$MoviesdataStateCopyWithImpl(this._value, this._then);

  final MoviesdataState _value;
  // ignore: unused_field
  final $Res Function(MoviesdataState) _then;

  @override
  $Res call({
    Object? moviesList = freezed,
    Object? isLoading = freezed,
    Object? hasError = freezed,
  }) {
    return _then(_value.copyWith(
      moviesList: moviesList == freezed
          ? _value.moviesList
          : moviesList // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $MoviesdataStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<Movie> moviesList, bool isLoading, bool hasError});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$MoviesdataStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? moviesList = freezed,
    Object? isLoading = freezed,
    Object? hasError = freezed,
  }) {
    return _then(_$_Initial(
      moviesList: moviesList == freezed
          ? _value._moviesList
          : moviesList // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required final List<Movie> moviesList,
      required this.isLoading,
      required this.hasError})
      : _moviesList = moviesList;

  final List<Movie> _moviesList;
  @override
  List<Movie> get moviesList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moviesList);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'MoviesdataState(moviesList: $moviesList, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._moviesList, _moviesList) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.hasError, hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_moviesList),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(hasError));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements MoviesdataState {
  const factory _Initial(
      {required final List<Movie> moviesList,
      required final bool isLoading,
      required final bool hasError}) = _$_Initial;

  @override
  List<Movie> get moviesList => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get hasError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
