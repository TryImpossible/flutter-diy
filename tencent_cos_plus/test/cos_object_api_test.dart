import 'dart:io';

import 'package:http/http.dart';
import 'package:tencent_cos_plus/tencent_cos_plus.dart';
import 'package:test/test.dart';

void main() {
  group('cos object api tests', () {
    setUp(() {
      COSApiFactory.initialize(
        config: COSConfig(
          appId: 'xxx',
          secretId: 'xxxxxxxxx',
          secretKey: 'xxxxxxxxx',
        ),
        bucketName: 'xxx',
        region: 'xxx-xxx',
      );
    });

    test('ListObjects Test', () async {
      try {
        final COSListBucketResult result =
            await COSApiFactory.objectApi.listObjects(
          bucketName: 'xxx',
          region: 'xxx-xxx',
          prefix: 'xxx',
        );
        result.contents?.forEach((element) {
          print('${element.key}\b');
        });
        expect(result, isNotNull);
      } on SocketException catch (_) {
        fail('Did not expect a socket exception.');
      }
    });

    test('ListObjectVersions Test', () async {
      try {
        final COSListVersionsResult result =
            await COSApiFactory.objectApi.listObjectVersions(
          bucketName: 'xxx',
          region: 'xxx-xxx',
          prefix: 'xxx',
        );
        result.versions?.forEach((element) {
          print('${element.key}\b');
        });
        expect(result, isNotNull);
      } on SocketException catch (_) {
        fail('Did not expect a socket exception.');
      }
    });

    test('PutObject Test', () async {
      try {
        final Response result = await COSApiFactory.objectApi.putObject(
          bucketName: 'xxx',
          region: 'xxx-xxx',
          objectKey: 'xxx',
          filePath: 'xxx',
        );
        expect(result, isNotNull);
      } on SocketException catch (_) {
        fail('Did not expect a socket exception.');
      }
    });

    test('PutObjectCopy Test', () async {
      try {
        final COSCopyObjectResult result =
            await COSApiFactory.objectApi.putObjectCopy(
          bucketName: 'xxx',
          region: 'xxx-xxx',
          objectKey: 'xxx',
          xCOSCopySource: 'xxx',
          contentType: 'xxx',
        );
        expect(result, isNotNull);
      } on SocketException catch (_) {
        fail('Did not expect a socket exception.');
      }
    });

    test('GetObject Test', () async {
      try {
        final Response result = await COSApiFactory.objectApi.getObject(
          bucketName: 'xxx',
          region: 'xxx-xxx',
          objectKey: 'xxx',
          getObject: COSGetObject()..responseCacheControl = 'xxx',
        );
        expect(result, isNotNull);
      } on SocketException catch (_) {
        fail('Did not expect a socket exception.');
      }
    });

    test('HeadObject Test', () async {
      try {
        final Response result = await COSApiFactory.objectApi.headObject(
          bucketName: 'xxx',
          region: 'xxx-xxx',
          objectKey: 'xxx',
        );
        expect(result, isNotNull);
      } on SocketException catch (_) {
        fail('Did not expect a socket exception.');
      }
    });

    test('DeleteObject Test', () async {
      try {
        final Response result = await COSApiFactory.objectApi.deleteObject(
          objectKey: 'xxx',
        );
        expect(result, isNotNull);
      } on SocketException catch (_) {
        fail('Did not expect a socket exception.');
      }
    });

    test('DeleteMultipleObjects Test', () async {
      try {
        var result;
        result = await COSApiFactory.objectApi.listObjects(
          bucketName: 'xxx',
          region: 'xxx-xxx',
          prefix: 'xxx',
        );
        final List<COSObject>? objects = (result as COSListBucketResult)
            .contents
            ?.map<COSObject>((COSContents element) {
          print('${element.key} \b');
          return COSObject(key: element.key ?? '');
        }).toList();
        final COSDelete delete =
            COSDelete(quiet: false, objects: objects ?? <COSObject>[]);
        result = await COSApiFactory.objectApi.deleteMultipleObjects(
          bucketName: 'xxx',
          region: 'xxx-xxx',
          delete: delete,
        );
        expect(result, isNotNull);
      } on SocketException catch (_) {
        fail('Did not expect a socket exception.');
      }
    });

    test('OptionsObject Test', () async {
      try {
        final Response result = await COSApiFactory.objectApi.optionsObject(
          bucketName: 'xxx',
          region: 'xxx-xxx',
          objectKey: 'xxx',
          origin: 'xxx',
          accessControlRequestMethod: 'xxx',
        );
        expect(result, isNotNull);
      } on SocketException catch (_) {
        fail('Did not expect a socket exception.');
      }
    });
  });

  test('PostObjectRestore Test', () async {
    try {
      final Response result = await COSApiFactory.objectApi.postObjectRestore(
        bucketName: 'xxx',
        region: 'xxx-xxx',
        objectKey: 'xxx',
        restoreRequest: COSRestoreRequest(
          days: 10,
          casJobParameters: COSCASJobParameters(tier: 'xxx'),
        ),
      );
      expect(result, isNotNull);
    } on SocketException catch (_) {
      fail('Did not expect a socket exception.');
    }
  });
}
