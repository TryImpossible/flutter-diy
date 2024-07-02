// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) {
  return _ProductEntity.fromJson(json);
}

/// @nodoc
mixin _$ProductEntity {
  @JsonKey(name: 'cat_id')
  int? get catId => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_total')
  String? get commentsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_multi_price')
  bool? get isMultiPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_stock')
  bool? get isStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'log_code')
  String? get logCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'market_price')
  String? get marketPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_desc')
  String? get productDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_desc_origin')
  String? get productDescOrigin => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'puzzle_url')
  String? get puzzleUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'satisfy_per')
  String? get satisfyPer => throw _privateConstructorUsedError;
  @JsonKey(name: 'spm_stat')
  Spm_statBean? get spmStat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductEntityCopyWith<ProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEntityCopyWith<$Res> {
  factory $ProductEntityCopyWith(
          ProductEntity value, $Res Function(ProductEntity) then) =
      _$ProductEntityCopyWithImpl<$Res, ProductEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cat_id') int? catId,
      @JsonKey(name: 'comments_total') String? commentsTotal,
      @JsonKey(name: 'is_multi_price') bool? isMultiPrice,
      @JsonKey(name: 'is_stock') bool? isStock,
      @JsonKey(name: 'log_code') String? logCode,
      @JsonKey(name: 'market_price') String? marketPrice,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'price') String? price,
      @JsonKey(name: 'product_desc') String? productDesc,
      @JsonKey(name: 'product_desc_origin') String? productDescOrigin,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'puzzle_url') String? puzzleUrl,
      @JsonKey(name: 'satisfy_per') String? satisfyPer,
      @JsonKey(name: 'spm_stat') Spm_statBean? spmStat});

  $Spm_statBeanCopyWith<$Res>? get spmStat;
}

/// @nodoc
class _$ProductEntityCopyWithImpl<$Res, $Val extends ProductEntity>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catId = freezed,
    Object? commentsTotal = freezed,
    Object? isMultiPrice = freezed,
    Object? isStock = freezed,
    Object? logCode = freezed,
    Object? marketPrice = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? productDesc = freezed,
    Object? productDescOrigin = freezed,
    Object? productId = freezed,
    Object? puzzleUrl = freezed,
    Object? satisfyPer = freezed,
    Object? spmStat = freezed,
  }) {
    return _then(_value.copyWith(
      catId: freezed == catId
          ? _value.catId
          : catId // ignore: cast_nullable_to_non_nullable
              as int?,
      commentsTotal: freezed == commentsTotal
          ? _value.commentsTotal
          : commentsTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      isMultiPrice: freezed == isMultiPrice
          ? _value.isMultiPrice
          : isMultiPrice // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStock: freezed == isStock
          ? _value.isStock
          : isStock // ignore: cast_nullable_to_non_nullable
              as bool?,
      logCode: freezed == logCode
          ? _value.logCode
          : logCode // ignore: cast_nullable_to_non_nullable
              as String?,
      marketPrice: freezed == marketPrice
          ? _value.marketPrice
          : marketPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      productDesc: freezed == productDesc
          ? _value.productDesc
          : productDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescOrigin: freezed == productDescOrigin
          ? _value.productDescOrigin
          : productDescOrigin // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      puzzleUrl: freezed == puzzleUrl
          ? _value.puzzleUrl
          : puzzleUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      satisfyPer: freezed == satisfyPer
          ? _value.satisfyPer
          : satisfyPer // ignore: cast_nullable_to_non_nullable
              as String?,
      spmStat: freezed == spmStat
          ? _value.spmStat
          : spmStat // ignore: cast_nullable_to_non_nullable
              as Spm_statBean?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $Spm_statBeanCopyWith<$Res>? get spmStat {
    if (_value.spmStat == null) {
      return null;
    }

    return $Spm_statBeanCopyWith<$Res>(_value.spmStat!, (value) {
      return _then(_value.copyWith(spmStat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductEntityImplCopyWith<$Res>
    implements $ProductEntityCopyWith<$Res> {
  factory _$$ProductEntityImplCopyWith(
          _$ProductEntityImpl value, $Res Function(_$ProductEntityImpl) then) =
      __$$ProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cat_id') int? catId,
      @JsonKey(name: 'comments_total') String? commentsTotal,
      @JsonKey(name: 'is_multi_price') bool? isMultiPrice,
      @JsonKey(name: 'is_stock') bool? isStock,
      @JsonKey(name: 'log_code') String? logCode,
      @JsonKey(name: 'market_price') String? marketPrice,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'price') String? price,
      @JsonKey(name: 'product_desc') String? productDesc,
      @JsonKey(name: 'product_desc_origin') String? productDescOrigin,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'puzzle_url') String? puzzleUrl,
      @JsonKey(name: 'satisfy_per') String? satisfyPer,
      @JsonKey(name: 'spm_stat') Spm_statBean? spmStat});

  @override
  $Spm_statBeanCopyWith<$Res>? get spmStat;
}

/// @nodoc
class __$$ProductEntityImplCopyWithImpl<$Res>
    extends _$ProductEntityCopyWithImpl<$Res, _$ProductEntityImpl>
    implements _$$ProductEntityImplCopyWith<$Res> {
  __$$ProductEntityImplCopyWithImpl(
      _$ProductEntityImpl _value, $Res Function(_$ProductEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catId = freezed,
    Object? commentsTotal = freezed,
    Object? isMultiPrice = freezed,
    Object? isStock = freezed,
    Object? logCode = freezed,
    Object? marketPrice = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? productDesc = freezed,
    Object? productDescOrigin = freezed,
    Object? productId = freezed,
    Object? puzzleUrl = freezed,
    Object? satisfyPer = freezed,
    Object? spmStat = freezed,
  }) {
    return _then(_$ProductEntityImpl(
      catId: freezed == catId
          ? _value.catId
          : catId // ignore: cast_nullable_to_non_nullable
              as int?,
      commentsTotal: freezed == commentsTotal
          ? _value.commentsTotal
          : commentsTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      isMultiPrice: freezed == isMultiPrice
          ? _value.isMultiPrice
          : isMultiPrice // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStock: freezed == isStock
          ? _value.isStock
          : isStock // ignore: cast_nullable_to_non_nullable
              as bool?,
      logCode: freezed == logCode
          ? _value.logCode
          : logCode // ignore: cast_nullable_to_non_nullable
              as String?,
      marketPrice: freezed == marketPrice
          ? _value.marketPrice
          : marketPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      productDesc: freezed == productDesc
          ? _value.productDesc
          : productDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescOrigin: freezed == productDescOrigin
          ? _value.productDescOrigin
          : productDescOrigin // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      puzzleUrl: freezed == puzzleUrl
          ? _value.puzzleUrl
          : puzzleUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      satisfyPer: freezed == satisfyPer
          ? _value.satisfyPer
          : satisfyPer // ignore: cast_nullable_to_non_nullable
              as String?,
      spmStat: freezed == spmStat
          ? _value.spmStat
          : spmStat // ignore: cast_nullable_to_non_nullable
              as Spm_statBean?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductEntityImpl implements _ProductEntity {
  const _$ProductEntityImpl(
      {@JsonKey(name: 'cat_id') this.catId,
      @JsonKey(name: 'comments_total') this.commentsTotal,
      @JsonKey(name: 'is_multi_price') this.isMultiPrice,
      @JsonKey(name: 'is_stock') this.isStock,
      @JsonKey(name: 'log_code') this.logCode,
      @JsonKey(name: 'market_price') this.marketPrice,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'product_desc') this.productDesc,
      @JsonKey(name: 'product_desc_origin') this.productDescOrigin,
      @JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'puzzle_url') this.puzzleUrl,
      @JsonKey(name: 'satisfy_per') this.satisfyPer,
      @JsonKey(name: 'spm_stat') this.spmStat});

  factory _$ProductEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductEntityImplFromJson(json);

  @override
  @JsonKey(name: 'cat_id')
  final int? catId;
  @override
  @JsonKey(name: 'comments_total')
  final String? commentsTotal;
  @override
  @JsonKey(name: 'is_multi_price')
  final bool? isMultiPrice;
  @override
  @JsonKey(name: 'is_stock')
  final bool? isStock;
  @override
  @JsonKey(name: 'log_code')
  final String? logCode;
  @override
  @JsonKey(name: 'market_price')
  final String? marketPrice;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'price')
  final String? price;
  @override
  @JsonKey(name: 'product_desc')
  final String? productDesc;
  @override
  @JsonKey(name: 'product_desc_origin')
  final String? productDescOrigin;
  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @JsonKey(name: 'puzzle_url')
  final String? puzzleUrl;
  @override
  @JsonKey(name: 'satisfy_per')
  final String? satisfyPer;
  @override
  @JsonKey(name: 'spm_stat')
  final Spm_statBean? spmStat;

  @override
  String toString() {
    return 'ProductEntity(catId: $catId, commentsTotal: $commentsTotal, isMultiPrice: $isMultiPrice, isStock: $isStock, logCode: $logCode, marketPrice: $marketPrice, name: $name, price: $price, productDesc: $productDesc, productDescOrigin: $productDescOrigin, productId: $productId, puzzleUrl: $puzzleUrl, satisfyPer: $satisfyPer, spmStat: $spmStat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductEntityImpl &&
            (identical(other.catId, catId) || other.catId == catId) &&
            (identical(other.commentsTotal, commentsTotal) ||
                other.commentsTotal == commentsTotal) &&
            (identical(other.isMultiPrice, isMultiPrice) ||
                other.isMultiPrice == isMultiPrice) &&
            (identical(other.isStock, isStock) || other.isStock == isStock) &&
            (identical(other.logCode, logCode) || other.logCode == logCode) &&
            (identical(other.marketPrice, marketPrice) ||
                other.marketPrice == marketPrice) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.productDesc, productDesc) ||
                other.productDesc == productDesc) &&
            (identical(other.productDescOrigin, productDescOrigin) ||
                other.productDescOrigin == productDescOrigin) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.puzzleUrl, puzzleUrl) ||
                other.puzzleUrl == puzzleUrl) &&
            (identical(other.satisfyPer, satisfyPer) ||
                other.satisfyPer == satisfyPer) &&
            (identical(other.spmStat, spmStat) || other.spmStat == spmStat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      catId,
      commentsTotal,
      isMultiPrice,
      isStock,
      logCode,
      marketPrice,
      name,
      price,
      productDesc,
      productDescOrigin,
      productId,
      puzzleUrl,
      satisfyPer,
      spmStat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      __$$ProductEntityImplCopyWithImpl<_$ProductEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductEntityImplToJson(
      this,
    );
  }
}

abstract class _ProductEntity implements ProductEntity {
  const factory _ProductEntity(
          {@JsonKey(name: 'cat_id') final int? catId,
          @JsonKey(name: 'comments_total') final String? commentsTotal,
          @JsonKey(name: 'is_multi_price') final bool? isMultiPrice,
          @JsonKey(name: 'is_stock') final bool? isStock,
          @JsonKey(name: 'log_code') final String? logCode,
          @JsonKey(name: 'market_price') final String? marketPrice,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'price') final String? price,
          @JsonKey(name: 'product_desc') final String? productDesc,
          @JsonKey(name: 'product_desc_origin') final String? productDescOrigin,
          @JsonKey(name: 'product_id') final int? productId,
          @JsonKey(name: 'puzzle_url') final String? puzzleUrl,
          @JsonKey(name: 'satisfy_per') final String? satisfyPer,
          @JsonKey(name: 'spm_stat') final Spm_statBean? spmStat}) =
      _$ProductEntityImpl;

  factory _ProductEntity.fromJson(Map<String, dynamic> json) =
      _$ProductEntityImpl.fromJson;

  @override
  @JsonKey(name: 'cat_id')
  int? get catId;
  @override
  @JsonKey(name: 'comments_total')
  String? get commentsTotal;
  @override
  @JsonKey(name: 'is_multi_price')
  bool? get isMultiPrice;
  @override
  @JsonKey(name: 'is_stock')
  bool? get isStock;
  @override
  @JsonKey(name: 'log_code')
  String? get logCode;
  @override
  @JsonKey(name: 'market_price')
  String? get marketPrice;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'price')
  String? get price;
  @override
  @JsonKey(name: 'product_desc')
  String? get productDesc;
  @override
  @JsonKey(name: 'product_desc_origin')
  String? get productDescOrigin;
  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  @JsonKey(name: 'puzzle_url')
  String? get puzzleUrl;
  @override
  @JsonKey(name: 'satisfy_per')
  String? get satisfyPer;
  @override
  @JsonKey(name: 'spm_stat')
  Spm_statBean? get spmStat;
  @override
  @JsonKey(ignore: true)
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Spm_statBean _$Spm_statBeanFromJson(Map<String, dynamic> json) {
  return _Spm_statBean.fromJson(json);
}

/// @nodoc
mixin _$Spm_statBean {
  @JsonKey(name: 'scm')
  String? get scm => throw _privateConstructorUsedError;
  @JsonKey(name: 'spm_code')
  String? get spmCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'spm_params')
  String? get spmParams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Spm_statBeanCopyWith<Spm_statBean> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Spm_statBeanCopyWith<$Res> {
  factory $Spm_statBeanCopyWith(
          Spm_statBean value, $Res Function(Spm_statBean) then) =
      _$Spm_statBeanCopyWithImpl<$Res, Spm_statBean>;
  @useResult
  $Res call(
      {@JsonKey(name: 'scm') String? scm,
      @JsonKey(name: 'spm_code') String? spmCode,
      @JsonKey(name: 'spm_params') String? spmParams});
}

/// @nodoc
class _$Spm_statBeanCopyWithImpl<$Res, $Val extends Spm_statBean>
    implements $Spm_statBeanCopyWith<$Res> {
  _$Spm_statBeanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scm = freezed,
    Object? spmCode = freezed,
    Object? spmParams = freezed,
  }) {
    return _then(_value.copyWith(
      scm: freezed == scm
          ? _value.scm
          : scm // ignore: cast_nullable_to_non_nullable
              as String?,
      spmCode: freezed == spmCode
          ? _value.spmCode
          : spmCode // ignore: cast_nullable_to_non_nullable
              as String?,
      spmParams: freezed == spmParams
          ? _value.spmParams
          : spmParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Spm_statBeanImplCopyWith<$Res>
    implements $Spm_statBeanCopyWith<$Res> {
  factory _$$Spm_statBeanImplCopyWith(
          _$Spm_statBeanImpl value, $Res Function(_$Spm_statBeanImpl) then) =
      __$$Spm_statBeanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'scm') String? scm,
      @JsonKey(name: 'spm_code') String? spmCode,
      @JsonKey(name: 'spm_params') String? spmParams});
}

/// @nodoc
class __$$Spm_statBeanImplCopyWithImpl<$Res>
    extends _$Spm_statBeanCopyWithImpl<$Res, _$Spm_statBeanImpl>
    implements _$$Spm_statBeanImplCopyWith<$Res> {
  __$$Spm_statBeanImplCopyWithImpl(
      _$Spm_statBeanImpl _value, $Res Function(_$Spm_statBeanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scm = freezed,
    Object? spmCode = freezed,
    Object? spmParams = freezed,
  }) {
    return _then(_$Spm_statBeanImpl(
      scm: freezed == scm
          ? _value.scm
          : scm // ignore: cast_nullable_to_non_nullable
              as String?,
      spmCode: freezed == spmCode
          ? _value.spmCode
          : spmCode // ignore: cast_nullable_to_non_nullable
              as String?,
      spmParams: freezed == spmParams
          ? _value.spmParams
          : spmParams // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Spm_statBeanImpl implements _Spm_statBean {
  const _$Spm_statBeanImpl(
      {@JsonKey(name: 'scm') this.scm,
      @JsonKey(name: 'spm_code') this.spmCode,
      @JsonKey(name: 'spm_params') this.spmParams});

  factory _$Spm_statBeanImpl.fromJson(Map<String, dynamic> json) =>
      _$$Spm_statBeanImplFromJson(json);

  @override
  @JsonKey(name: 'scm')
  final String? scm;
  @override
  @JsonKey(name: 'spm_code')
  final String? spmCode;
  @override
  @JsonKey(name: 'spm_params')
  final String? spmParams;

  @override
  String toString() {
    return 'Spm_statBean(scm: $scm, spmCode: $spmCode, spmParams: $spmParams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Spm_statBeanImpl &&
            (identical(other.scm, scm) || other.scm == scm) &&
            (identical(other.spmCode, spmCode) || other.spmCode == spmCode) &&
            (identical(other.spmParams, spmParams) ||
                other.spmParams == spmParams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, scm, spmCode, spmParams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Spm_statBeanImplCopyWith<_$Spm_statBeanImpl> get copyWith =>
      __$$Spm_statBeanImplCopyWithImpl<_$Spm_statBeanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Spm_statBeanImplToJson(
      this,
    );
  }
}

abstract class _Spm_statBean implements Spm_statBean {
  const factory _Spm_statBean(
          {@JsonKey(name: 'scm') final String? scm,
          @JsonKey(name: 'spm_code') final String? spmCode,
          @JsonKey(name: 'spm_params') final String? spmParams}) =
      _$Spm_statBeanImpl;

  factory _Spm_statBean.fromJson(Map<String, dynamic> json) =
      _$Spm_statBeanImpl.fromJson;

  @override
  @JsonKey(name: 'scm')
  String? get scm;
  @override
  @JsonKey(name: 'spm_code')
  String? get spmCode;
  @override
  @JsonKey(name: 'spm_params')
  String? get spmParams;
  @override
  @JsonKey(ignore: true)
  _$$Spm_statBeanImplCopyWith<_$Spm_statBeanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
