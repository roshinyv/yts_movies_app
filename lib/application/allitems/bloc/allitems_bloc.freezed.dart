// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'allitems_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllitemsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? nextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextPage value) nextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NextPage value)? nextPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextPage value)? nextPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllitemsEventCopyWith<$Res> {
  factory $AllitemsEventCopyWith(
          AllitemsEvent value, $Res Function(AllitemsEvent) then) =
      _$AllitemsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AllitemsEventCopyWithImpl<$Res>
    implements $AllitemsEventCopyWith<$Res> {
  _$AllitemsEventCopyWithImpl(this._value, this._then);

  final AllitemsEvent _value;
  // ignore: unused_field
  final $Res Function(AllitemsEvent) _then;
}

/// @nodoc
abstract class _$$_NextPageCopyWith<$Res> {
  factory _$$_NextPageCopyWith(
          _$_NextPage value, $Res Function(_$_NextPage) then) =
      __$$_NextPageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NextPageCopyWithImpl<$Res> extends _$AllitemsEventCopyWithImpl<$Res>
    implements _$$_NextPageCopyWith<$Res> {
  __$$_NextPageCopyWithImpl(
      _$_NextPage _value, $Res Function(_$_NextPage) _then)
      : super(_value, (v) => _then(v as _$_NextPage));

  @override
  _$_NextPage get _value => super._value as _$_NextPage;
}

/// @nodoc

class _$_NextPage implements _NextPage {
  const _$_NextPage();

  @override
  String toString() {
    return 'AllitemsEvent.nextPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NextPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nextPage,
  }) {
    return nextPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? nextPage,
  }) {
    return nextPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nextPage,
    required TResult orElse(),
  }) {
    if (nextPage != null) {
      return nextPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NextPage value) nextPage,
  }) {
    return nextPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NextPage value)? nextPage,
  }) {
    return nextPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NextPage value)? nextPage,
    required TResult orElse(),
  }) {
    if (nextPage != null) {
      return nextPage(this);
    }
    return orElse();
  }
}

abstract class _NextPage implements AllitemsEvent {
  const factory _NextPage() = _$_NextPage;
}

/// @nodoc
mixin _$AllitemsState {
  List<SearchResultMovies> get movieList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllitemsStateCopyWith<AllitemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllitemsStateCopyWith<$Res> {
  factory $AllitemsStateCopyWith(
          AllitemsState value, $Res Function(AllitemsState) then) =
      _$AllitemsStateCopyWithImpl<$Res>;
  $Res call({List<SearchResultMovies> movieList, bool isLoading, bool isError});
}

/// @nodoc
class _$AllitemsStateCopyWithImpl<$Res>
    implements $AllitemsStateCopyWith<$Res> {
  _$AllitemsStateCopyWithImpl(this._value, this._then);

  final AllitemsState _value;
  // ignore: unused_field
  final $Res Function(AllitemsState) _then;

  @override
  $Res call({
    Object? movieList = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
  }) {
    return _then(_value.copyWith(
      movieList: movieList == freezed
          ? _value.movieList
          : movieList // ignore: cast_nullable_to_non_nullable
              as List<SearchResultMovies>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $AllitemsStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<SearchResultMovies> movieList, bool isLoading, bool isError});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$AllitemsStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? movieList = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
  }) {
    return _then(_$_Initial(
      movieList: movieList == freezed
          ? _value._movieList
          : movieList // ignore: cast_nullable_to_non_nullable
              as List<SearchResultMovies>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required final List<SearchResultMovies> movieList,
      required this.isLoading,
      required this.isError})
      : _movieList = movieList;

  final List<SearchResultMovies> _movieList;
  @override
  List<SearchResultMovies> get movieList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movieList);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'AllitemsState(movieList: $movieList, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._movieList, _movieList) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movieList),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements AllitemsState {
  const factory _Initial(
      {required final List<SearchResultMovies> movieList,
      required final bool isLoading,
      required final bool isError}) = _$_Initial;

  @override
  List<SearchResultMovies> get movieList => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
