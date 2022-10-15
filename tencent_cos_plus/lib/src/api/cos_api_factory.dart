import '../model/model.dart' show COSConfig;
import 'cos_abstract_api.dart';
import 'cos_bucket_api.dart';
import 'cos_object_api.dart';

class COSApiFactory {
  COSApiFactory._internal();

  /// 默认的COSBucketApi
  static final Symbol _keyCOSBucketApi = #keyCOSBucketApi;

  /// 默认的COSBucketApi
  static final Symbol _keyCOSObjectApi = #keyCOSObjectApi;

  /// 读取默认的COSBucketApi
  static COSBucketApi get bucketApi => get<COSBucketApi>(_keyCOSBucketApi);

  /// 读取默认的COSObjectApi
  static COSObjectApi get objectApi => get<COSObjectApi>(_keyCOSObjectApi);

  /// api集合
  static final Map<Symbol, COSAbstractApi> _cosApis =
      <Symbol, COSAbstractApi>{};

  static COSConfig get config {
    if (_config != null) {
      return _config!;
    }
    throw Exception('initConfig method executed first');
  }

  /// cos配置
  static COSConfig? _config;

  /// 初始化默认api
  static void initialize({
    required COSConfig config,
    required String bucketName,
    required String region,
  }) {
    _config = config;
    createBucketApi(_keyCOSBucketApi, bucketName, region);
    createObjectApi(_keyCOSObjectApi, bucketName, region);
  }

  static void createApi(Symbol key, COSAbstractApi api) {
    _cosApis[key] = api;
  }

  static void createBucketApi(Symbol key, String bucketName, String region) {
    createApi(
      key,
      COSBucketApi(config, bucketName: bucketName, region: region),
    );
  }

  static void createObjectApi(Symbol key, String bucketName, String region) {
    createApi(
      key,
      COSObjectApi(config, bucketName: bucketName, region: region),
    );
  }

  /// 获取Api
  static T get<T extends COSAbstractApi>(Symbol key) {
    if (_cosApis.containsKey(key)) {
      return _cosApis[key]! as T;
    }
    throw Exception('$key is not exist, check it please');
  }
}
