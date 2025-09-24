// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductEntity {

@JsonKey(name: 'cat_id') int? get catId;@JsonKey(name: 'comments_total') String? get commentsTotal;@JsonKey(name: 'is_multi_price') bool? get isMultiPrice;@JsonKey(name: 'is_stock') bool? get isStock;@JsonKey(name: 'log_code') String? get logCode;@JsonKey(name: 'market_price') String? get marketPrice;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'price') String? get price;@JsonKey(name: 'product_desc') String? get productDesc;@JsonKey(name: 'product_desc_origin') String? get productDescOrigin;@JsonKey(name: 'product_id') int? get productId;@JsonKey(name: 'puzzle_url') String? get puzzleUrl;@JsonKey(name: 'satisfy_per') String? get satisfyPer;@JsonKey(name: 'spm_stat') Spm_statBean? get spmStat;
/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductEntityCopyWith<ProductEntity> get copyWith => _$ProductEntityCopyWithImpl<ProductEntity>(this as ProductEntity, _$identity);

  /// Serializes this ProductEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEntity&&(identical(other.catId, catId) || other.catId == catId)&&(identical(other.commentsTotal, commentsTotal) || other.commentsTotal == commentsTotal)&&(identical(other.isMultiPrice, isMultiPrice) || other.isMultiPrice == isMultiPrice)&&(identical(other.isStock, isStock) || other.isStock == isStock)&&(identical(other.logCode, logCode) || other.logCode == logCode)&&(identical(other.marketPrice, marketPrice) || other.marketPrice == marketPrice)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.productDesc, productDesc) || other.productDesc == productDesc)&&(identical(other.productDescOrigin, productDescOrigin) || other.productDescOrigin == productDescOrigin)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.puzzleUrl, puzzleUrl) || other.puzzleUrl == puzzleUrl)&&(identical(other.satisfyPer, satisfyPer) || other.satisfyPer == satisfyPer)&&(identical(other.spmStat, spmStat) || other.spmStat == spmStat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,catId,commentsTotal,isMultiPrice,isStock,logCode,marketPrice,name,price,productDesc,productDescOrigin,productId,puzzleUrl,satisfyPer,spmStat);

@override
String toString() {
  return 'ProductEntity(catId: $catId, commentsTotal: $commentsTotal, isMultiPrice: $isMultiPrice, isStock: $isStock, logCode: $logCode, marketPrice: $marketPrice, name: $name, price: $price, productDesc: $productDesc, productDescOrigin: $productDescOrigin, productId: $productId, puzzleUrl: $puzzleUrl, satisfyPer: $satisfyPer, spmStat: $spmStat)';
}


}

/// @nodoc
abstract mixin class $ProductEntityCopyWith<$Res>  {
  factory $ProductEntityCopyWith(ProductEntity value, $Res Function(ProductEntity) _then) = _$ProductEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cat_id') int? catId,@JsonKey(name: 'comments_total') String? commentsTotal,@JsonKey(name: 'is_multi_price') bool? isMultiPrice,@JsonKey(name: 'is_stock') bool? isStock,@JsonKey(name: 'log_code') String? logCode,@JsonKey(name: 'market_price') String? marketPrice,@JsonKey(name: 'name') String? name,@JsonKey(name: 'price') String? price,@JsonKey(name: 'product_desc') String? productDesc,@JsonKey(name: 'product_desc_origin') String? productDescOrigin,@JsonKey(name: 'product_id') int? productId,@JsonKey(name: 'puzzle_url') String? puzzleUrl,@JsonKey(name: 'satisfy_per') String? satisfyPer,@JsonKey(name: 'spm_stat') Spm_statBean? spmStat
});


$Spm_statBeanCopyWith<$Res>? get spmStat;

}
/// @nodoc
class _$ProductEntityCopyWithImpl<$Res>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._self, this._then);

  final ProductEntity _self;
  final $Res Function(ProductEntity) _then;

/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? catId = freezed,Object? commentsTotal = freezed,Object? isMultiPrice = freezed,Object? isStock = freezed,Object? logCode = freezed,Object? marketPrice = freezed,Object? name = freezed,Object? price = freezed,Object? productDesc = freezed,Object? productDescOrigin = freezed,Object? productId = freezed,Object? puzzleUrl = freezed,Object? satisfyPer = freezed,Object? spmStat = freezed,}) {
  return _then(_self.copyWith(
catId: freezed == catId ? _self.catId : catId // ignore: cast_nullable_to_non_nullable
as int?,commentsTotal: freezed == commentsTotal ? _self.commentsTotal : commentsTotal // ignore: cast_nullable_to_non_nullable
as String?,isMultiPrice: freezed == isMultiPrice ? _self.isMultiPrice : isMultiPrice // ignore: cast_nullable_to_non_nullable
as bool?,isStock: freezed == isStock ? _self.isStock : isStock // ignore: cast_nullable_to_non_nullable
as bool?,logCode: freezed == logCode ? _self.logCode : logCode // ignore: cast_nullable_to_non_nullable
as String?,marketPrice: freezed == marketPrice ? _self.marketPrice : marketPrice // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,productDesc: freezed == productDesc ? _self.productDesc : productDesc // ignore: cast_nullable_to_non_nullable
as String?,productDescOrigin: freezed == productDescOrigin ? _self.productDescOrigin : productDescOrigin // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,puzzleUrl: freezed == puzzleUrl ? _self.puzzleUrl : puzzleUrl // ignore: cast_nullable_to_non_nullable
as String?,satisfyPer: freezed == satisfyPer ? _self.satisfyPer : satisfyPer // ignore: cast_nullable_to_non_nullable
as String?,spmStat: freezed == spmStat ? _self.spmStat : spmStat // ignore: cast_nullable_to_non_nullable
as Spm_statBean?,
  ));
}
/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Spm_statBeanCopyWith<$Res>? get spmStat {
    if (_self.spmStat == null) {
    return null;
  }

  return $Spm_statBeanCopyWith<$Res>(_self.spmStat!, (value) {
    return _then(_self.copyWith(spmStat: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductEntity].
extension ProductEntityPatterns on ProductEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProductEntity():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'cat_id')  int? catId, @JsonKey(name: 'comments_total')  String? commentsTotal, @JsonKey(name: 'is_multi_price')  bool? isMultiPrice, @JsonKey(name: 'is_stock')  bool? isStock, @JsonKey(name: 'log_code')  String? logCode, @JsonKey(name: 'market_price')  String? marketPrice, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'price')  String? price, @JsonKey(name: 'product_desc')  String? productDesc, @JsonKey(name: 'product_desc_origin')  String? productDescOrigin, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'puzzle_url')  String? puzzleUrl, @JsonKey(name: 'satisfy_per')  String? satisfyPer, @JsonKey(name: 'spm_stat')  Spm_statBean? spmStat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
return $default(_that.catId,_that.commentsTotal,_that.isMultiPrice,_that.isStock,_that.logCode,_that.marketPrice,_that.name,_that.price,_that.productDesc,_that.productDescOrigin,_that.productId,_that.puzzleUrl,_that.satisfyPer,_that.spmStat);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'cat_id')  int? catId, @JsonKey(name: 'comments_total')  String? commentsTotal, @JsonKey(name: 'is_multi_price')  bool? isMultiPrice, @JsonKey(name: 'is_stock')  bool? isStock, @JsonKey(name: 'log_code')  String? logCode, @JsonKey(name: 'market_price')  String? marketPrice, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'price')  String? price, @JsonKey(name: 'product_desc')  String? productDesc, @JsonKey(name: 'product_desc_origin')  String? productDescOrigin, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'puzzle_url')  String? puzzleUrl, @JsonKey(name: 'satisfy_per')  String? satisfyPer, @JsonKey(name: 'spm_stat')  Spm_statBean? spmStat)  $default,) {final _that = this;
switch (_that) {
case _ProductEntity():
return $default(_that.catId,_that.commentsTotal,_that.isMultiPrice,_that.isStock,_that.logCode,_that.marketPrice,_that.name,_that.price,_that.productDesc,_that.productDescOrigin,_that.productId,_that.puzzleUrl,_that.satisfyPer,_that.spmStat);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'cat_id')  int? catId, @JsonKey(name: 'comments_total')  String? commentsTotal, @JsonKey(name: 'is_multi_price')  bool? isMultiPrice, @JsonKey(name: 'is_stock')  bool? isStock, @JsonKey(name: 'log_code')  String? logCode, @JsonKey(name: 'market_price')  String? marketPrice, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'price')  String? price, @JsonKey(name: 'product_desc')  String? productDesc, @JsonKey(name: 'product_desc_origin')  String? productDescOrigin, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'puzzle_url')  String? puzzleUrl, @JsonKey(name: 'satisfy_per')  String? satisfyPer, @JsonKey(name: 'spm_stat')  Spm_statBean? spmStat)?  $default,) {final _that = this;
switch (_that) {
case _ProductEntity() when $default != null:
return $default(_that.catId,_that.commentsTotal,_that.isMultiPrice,_that.isStock,_that.logCode,_that.marketPrice,_that.name,_that.price,_that.productDesc,_that.productDescOrigin,_that.productId,_that.puzzleUrl,_that.satisfyPer,_that.spmStat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductEntity implements ProductEntity {
  const _ProductEntity({@JsonKey(name: 'cat_id') this.catId, @JsonKey(name: 'comments_total') this.commentsTotal, @JsonKey(name: 'is_multi_price') this.isMultiPrice, @JsonKey(name: 'is_stock') this.isStock, @JsonKey(name: 'log_code') this.logCode, @JsonKey(name: 'market_price') this.marketPrice, @JsonKey(name: 'name') this.name, @JsonKey(name: 'price') this.price, @JsonKey(name: 'product_desc') this.productDesc, @JsonKey(name: 'product_desc_origin') this.productDescOrigin, @JsonKey(name: 'product_id') this.productId, @JsonKey(name: 'puzzle_url') this.puzzleUrl, @JsonKey(name: 'satisfy_per') this.satisfyPer, @JsonKey(name: 'spm_stat') this.spmStat});
  factory _ProductEntity.fromJson(Map<String, dynamic> json) => _$ProductEntityFromJson(json);

@override@JsonKey(name: 'cat_id') final  int? catId;
@override@JsonKey(name: 'comments_total') final  String? commentsTotal;
@override@JsonKey(name: 'is_multi_price') final  bool? isMultiPrice;
@override@JsonKey(name: 'is_stock') final  bool? isStock;
@override@JsonKey(name: 'log_code') final  String? logCode;
@override@JsonKey(name: 'market_price') final  String? marketPrice;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'price') final  String? price;
@override@JsonKey(name: 'product_desc') final  String? productDesc;
@override@JsonKey(name: 'product_desc_origin') final  String? productDescOrigin;
@override@JsonKey(name: 'product_id') final  int? productId;
@override@JsonKey(name: 'puzzle_url') final  String? puzzleUrl;
@override@JsonKey(name: 'satisfy_per') final  String? satisfyPer;
@override@JsonKey(name: 'spm_stat') final  Spm_statBean? spmStat;

/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductEntityCopyWith<_ProductEntity> get copyWith => __$ProductEntityCopyWithImpl<_ProductEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductEntity&&(identical(other.catId, catId) || other.catId == catId)&&(identical(other.commentsTotal, commentsTotal) || other.commentsTotal == commentsTotal)&&(identical(other.isMultiPrice, isMultiPrice) || other.isMultiPrice == isMultiPrice)&&(identical(other.isStock, isStock) || other.isStock == isStock)&&(identical(other.logCode, logCode) || other.logCode == logCode)&&(identical(other.marketPrice, marketPrice) || other.marketPrice == marketPrice)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.productDesc, productDesc) || other.productDesc == productDesc)&&(identical(other.productDescOrigin, productDescOrigin) || other.productDescOrigin == productDescOrigin)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.puzzleUrl, puzzleUrl) || other.puzzleUrl == puzzleUrl)&&(identical(other.satisfyPer, satisfyPer) || other.satisfyPer == satisfyPer)&&(identical(other.spmStat, spmStat) || other.spmStat == spmStat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,catId,commentsTotal,isMultiPrice,isStock,logCode,marketPrice,name,price,productDesc,productDescOrigin,productId,puzzleUrl,satisfyPer,spmStat);

@override
String toString() {
  return 'ProductEntity(catId: $catId, commentsTotal: $commentsTotal, isMultiPrice: $isMultiPrice, isStock: $isStock, logCode: $logCode, marketPrice: $marketPrice, name: $name, price: $price, productDesc: $productDesc, productDescOrigin: $productDescOrigin, productId: $productId, puzzleUrl: $puzzleUrl, satisfyPer: $satisfyPer, spmStat: $spmStat)';
}


}

/// @nodoc
abstract mixin class _$ProductEntityCopyWith<$Res> implements $ProductEntityCopyWith<$Res> {
  factory _$ProductEntityCopyWith(_ProductEntity value, $Res Function(_ProductEntity) _then) = __$ProductEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cat_id') int? catId,@JsonKey(name: 'comments_total') String? commentsTotal,@JsonKey(name: 'is_multi_price') bool? isMultiPrice,@JsonKey(name: 'is_stock') bool? isStock,@JsonKey(name: 'log_code') String? logCode,@JsonKey(name: 'market_price') String? marketPrice,@JsonKey(name: 'name') String? name,@JsonKey(name: 'price') String? price,@JsonKey(name: 'product_desc') String? productDesc,@JsonKey(name: 'product_desc_origin') String? productDescOrigin,@JsonKey(name: 'product_id') int? productId,@JsonKey(name: 'puzzle_url') String? puzzleUrl,@JsonKey(name: 'satisfy_per') String? satisfyPer,@JsonKey(name: 'spm_stat') Spm_statBean? spmStat
});


@override $Spm_statBeanCopyWith<$Res>? get spmStat;

}
/// @nodoc
class __$ProductEntityCopyWithImpl<$Res>
    implements _$ProductEntityCopyWith<$Res> {
  __$ProductEntityCopyWithImpl(this._self, this._then);

  final _ProductEntity _self;
  final $Res Function(_ProductEntity) _then;

/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? catId = freezed,Object? commentsTotal = freezed,Object? isMultiPrice = freezed,Object? isStock = freezed,Object? logCode = freezed,Object? marketPrice = freezed,Object? name = freezed,Object? price = freezed,Object? productDesc = freezed,Object? productDescOrigin = freezed,Object? productId = freezed,Object? puzzleUrl = freezed,Object? satisfyPer = freezed,Object? spmStat = freezed,}) {
  return _then(_ProductEntity(
catId: freezed == catId ? _self.catId : catId // ignore: cast_nullable_to_non_nullable
as int?,commentsTotal: freezed == commentsTotal ? _self.commentsTotal : commentsTotal // ignore: cast_nullable_to_non_nullable
as String?,isMultiPrice: freezed == isMultiPrice ? _self.isMultiPrice : isMultiPrice // ignore: cast_nullable_to_non_nullable
as bool?,isStock: freezed == isStock ? _self.isStock : isStock // ignore: cast_nullable_to_non_nullable
as bool?,logCode: freezed == logCode ? _self.logCode : logCode // ignore: cast_nullable_to_non_nullable
as String?,marketPrice: freezed == marketPrice ? _self.marketPrice : marketPrice // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,productDesc: freezed == productDesc ? _self.productDesc : productDesc // ignore: cast_nullable_to_non_nullable
as String?,productDescOrigin: freezed == productDescOrigin ? _self.productDescOrigin : productDescOrigin // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,puzzleUrl: freezed == puzzleUrl ? _self.puzzleUrl : puzzleUrl // ignore: cast_nullable_to_non_nullable
as String?,satisfyPer: freezed == satisfyPer ? _self.satisfyPer : satisfyPer // ignore: cast_nullable_to_non_nullable
as String?,spmStat: freezed == spmStat ? _self.spmStat : spmStat // ignore: cast_nullable_to_non_nullable
as Spm_statBean?,
  ));
}

/// Create a copy of ProductEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Spm_statBeanCopyWith<$Res>? get spmStat {
    if (_self.spmStat == null) {
    return null;
  }

  return $Spm_statBeanCopyWith<$Res>(_self.spmStat!, (value) {
    return _then(_self.copyWith(spmStat: value));
  });
}
}


/// @nodoc
mixin _$Spm_statBean {

@JsonKey(name: 'scm') String? get scm;@JsonKey(name: 'spm_code') String? get spmCode;@JsonKey(name: 'spm_params') String? get spmParams;
/// Create a copy of Spm_statBean
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Spm_statBeanCopyWith<Spm_statBean> get copyWith => _$Spm_statBeanCopyWithImpl<Spm_statBean>(this as Spm_statBean, _$identity);

  /// Serializes this Spm_statBean to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Spm_statBean&&(identical(other.scm, scm) || other.scm == scm)&&(identical(other.spmCode, spmCode) || other.spmCode == spmCode)&&(identical(other.spmParams, spmParams) || other.spmParams == spmParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scm,spmCode,spmParams);

@override
String toString() {
  return 'Spm_statBean(scm: $scm, spmCode: $spmCode, spmParams: $spmParams)';
}


}

/// @nodoc
abstract mixin class $Spm_statBeanCopyWith<$Res>  {
  factory $Spm_statBeanCopyWith(Spm_statBean value, $Res Function(Spm_statBean) _then) = _$Spm_statBeanCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'scm') String? scm,@JsonKey(name: 'spm_code') String? spmCode,@JsonKey(name: 'spm_params') String? spmParams
});




}
/// @nodoc
class _$Spm_statBeanCopyWithImpl<$Res>
    implements $Spm_statBeanCopyWith<$Res> {
  _$Spm_statBeanCopyWithImpl(this._self, this._then);

  final Spm_statBean _self;
  final $Res Function(Spm_statBean) _then;

/// Create a copy of Spm_statBean
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scm = freezed,Object? spmCode = freezed,Object? spmParams = freezed,}) {
  return _then(_self.copyWith(
scm: freezed == scm ? _self.scm : scm // ignore: cast_nullable_to_non_nullable
as String?,spmCode: freezed == spmCode ? _self.spmCode : spmCode // ignore: cast_nullable_to_non_nullable
as String?,spmParams: freezed == spmParams ? _self.spmParams : spmParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Spm_statBean].
extension Spm_statBeanPatterns on Spm_statBean {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Spm_statBean value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Spm_statBean() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Spm_statBean value)  $default,){
final _that = this;
switch (_that) {
case _Spm_statBean():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Spm_statBean value)?  $default,){
final _that = this;
switch (_that) {
case _Spm_statBean() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'scm')  String? scm, @JsonKey(name: 'spm_code')  String? spmCode, @JsonKey(name: 'spm_params')  String? spmParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Spm_statBean() when $default != null:
return $default(_that.scm,_that.spmCode,_that.spmParams);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'scm')  String? scm, @JsonKey(name: 'spm_code')  String? spmCode, @JsonKey(name: 'spm_params')  String? spmParams)  $default,) {final _that = this;
switch (_that) {
case _Spm_statBean():
return $default(_that.scm,_that.spmCode,_that.spmParams);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'scm')  String? scm, @JsonKey(name: 'spm_code')  String? spmCode, @JsonKey(name: 'spm_params')  String? spmParams)?  $default,) {final _that = this;
switch (_that) {
case _Spm_statBean() when $default != null:
return $default(_that.scm,_that.spmCode,_that.spmParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Spm_statBean implements Spm_statBean {
  const _Spm_statBean({@JsonKey(name: 'scm') this.scm, @JsonKey(name: 'spm_code') this.spmCode, @JsonKey(name: 'spm_params') this.spmParams});
  factory _Spm_statBean.fromJson(Map<String, dynamic> json) => _$Spm_statBeanFromJson(json);

@override@JsonKey(name: 'scm') final  String? scm;
@override@JsonKey(name: 'spm_code') final  String? spmCode;
@override@JsonKey(name: 'spm_params') final  String? spmParams;

/// Create a copy of Spm_statBean
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Spm_statBeanCopyWith<_Spm_statBean> get copyWith => __$Spm_statBeanCopyWithImpl<_Spm_statBean>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Spm_statBeanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Spm_statBean&&(identical(other.scm, scm) || other.scm == scm)&&(identical(other.spmCode, spmCode) || other.spmCode == spmCode)&&(identical(other.spmParams, spmParams) || other.spmParams == spmParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scm,spmCode,spmParams);

@override
String toString() {
  return 'Spm_statBean(scm: $scm, spmCode: $spmCode, spmParams: $spmParams)';
}


}

/// @nodoc
abstract mixin class _$Spm_statBeanCopyWith<$Res> implements $Spm_statBeanCopyWith<$Res> {
  factory _$Spm_statBeanCopyWith(_Spm_statBean value, $Res Function(_Spm_statBean) _then) = __$Spm_statBeanCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'scm') String? scm,@JsonKey(name: 'spm_code') String? spmCode,@JsonKey(name: 'spm_params') String? spmParams
});




}
/// @nodoc
class __$Spm_statBeanCopyWithImpl<$Res>
    implements _$Spm_statBeanCopyWith<$Res> {
  __$Spm_statBeanCopyWithImpl(this._self, this._then);

  final _Spm_statBean _self;
  final $Res Function(_Spm_statBean) _then;

/// Create a copy of Spm_statBean
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scm = freezed,Object? spmCode = freezed,Object? spmParams = freezed,}) {
  return _then(_Spm_statBean(
scm: freezed == scm ? _self.scm : scm // ignore: cast_nullable_to_non_nullable
as String?,spmCode: freezed == spmCode ? _self.spmCode : spmCode // ignore: cast_nullable_to_non_nullable
as String?,spmParams: freezed == spmParams ? _self.spmParams : spmParams // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
