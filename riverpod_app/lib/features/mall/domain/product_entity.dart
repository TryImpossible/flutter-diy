import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    @JsonKey(name: 'cat_id') int? catId,
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
    @JsonKey(name: 'spm_stat') Spm_statBean? spmStat,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, Object?> json) => _$ProductEntityFromJson(json);
}

@freezed
class Spm_statBean with _$Spm_statBean {
  const factory Spm_statBean({
    @JsonKey(name: 'scm') String? scm,
    @JsonKey(name: 'spm_code') String? spmCode,
    @JsonKey(name: 'spm_params') String? spmParams,
  }) = _Spm_statBean;

  factory Spm_statBean.fromJson(Map<String, Object?> json) => _$Spm_statBeanFromJson(json);
}

