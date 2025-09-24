// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) =>
    _ProductEntity(
      catId: (json['cat_id'] as num?)?.toInt(),
      commentsTotal: json['comments_total'] as String?,
      isMultiPrice: json['is_multi_price'] as bool?,
      isStock: json['is_stock'] as bool?,
      logCode: json['log_code'] as String?,
      marketPrice: json['market_price'] as String?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      productDesc: json['product_desc'] as String?,
      productDescOrigin: json['product_desc_origin'] as String?,
      productId: (json['product_id'] as num?)?.toInt(),
      puzzleUrl: json['puzzle_url'] as String?,
      satisfyPer: json['satisfy_per'] as String?,
      spmStat: json['spm_stat'] == null
          ? null
          : Spm_statBean.fromJson(json['spm_stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductEntityToJson(_ProductEntity instance) =>
    <String, dynamic>{
      'cat_id': instance.catId,
      'comments_total': instance.commentsTotal,
      'is_multi_price': instance.isMultiPrice,
      'is_stock': instance.isStock,
      'log_code': instance.logCode,
      'market_price': instance.marketPrice,
      'name': instance.name,
      'price': instance.price,
      'product_desc': instance.productDesc,
      'product_desc_origin': instance.productDescOrigin,
      'product_id': instance.productId,
      'puzzle_url': instance.puzzleUrl,
      'satisfy_per': instance.satisfyPer,
      'spm_stat': instance.spmStat,
    };

_Spm_statBean _$Spm_statBeanFromJson(Map<String, dynamic> json) =>
    _Spm_statBean(
      scm: json['scm'] as String?,
      spmCode: json['spm_code'] as String?,
      spmParams: json['spm_params'] as String?,
    );

Map<String, dynamic> _$Spm_statBeanToJson(_Spm_statBean instance) =>
    <String, dynamic>{
      'scm': instance.scm,
      'spm_code': instance.spmCode,
      'spm_params': instance.spmParams,
    };
