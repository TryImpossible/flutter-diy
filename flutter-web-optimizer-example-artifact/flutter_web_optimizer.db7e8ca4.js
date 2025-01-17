    // The code below is injected by flutter web optimizer, do not edit!!!!!!

    // window.assetBase
    var assetBase = "https://tryimpossible.github.io/flutter-diy/flutter-web-optimizer-example-artifact/";
    
    // window.mainjsManifest
    var mainjsManifest = {
  "main.dart.js": "main.dart.4d0cc01b.js",
  "main.dart.js_1.part.js": "main.dart.js_1.part.391ae524.js",
  "main.dart.js_2.part.js": "main.dart.js_2.part.85b54716.js",
  "main.dart_0.js": "main.dart_0.7c1aaf8f.js",
  "main.dart_1.js": "main.dart_1.1d4a3b75.js",
  "main.dart_2.js": "main.dart_2.0caaa23d.js",
  "main.dart_3.js": "main.dart_3.a8e56f6d.js",
  "main.dart_4.js": "main.dart_4.7d7863be.js",
  "main.dart_5.js": "main.dart_5.0e69ad8a.js"
};
    
    // window.hashFileManifest
    var hashFileManifest = {
  "assets/AssetManifest.bin": "assets/AssetManifest.40d91b54.bin",
  "assets/AssetManifest.bin.json": "assets/AssetManifest.bin.8d1dc191.json",
  "assets/AssetManifest.json": "assets/AssetManifest.691c0db7.json",
  "assets/FontManifest.json": "assets/FontManifest.88bca2cb.json",
  "assets/assets/images/lufei.jpeg": "assets/assets/images/lufei.e42dc430.jpeg",
  "assets/assets/svg/dart.svg": "assets/assets/svg/dart.b201ee39.svg",
  "assets/assets/svg/flutter_logo.svg": "assets/assets/svg/flutter_logo.2a3e180e.svg",
  "assets/fonts/MaterialIcons-Regular.otf": "assets/fonts/MaterialIcons-Regular.8a700484.otf",
  "assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "assets/packages/cupertino_icons/assets/CupertinoIcons.391ff5f9.ttf",
  "assets/packages/fluttertoast/assets/toastify.css": "assets/packages/fluttertoast/assets/toastify.a8567505.css",
  "assets/packages/fluttertoast/assets/toastify.js": "assets/packages/fluttertoast/assets/toastify.56e2c9ce.js",
  "assets/packages/wakelock_plus/assets/no_sleep.js": "assets/packages/wakelock_plus/assets/no_sleep.7748a45c.js",
  "canvaskit/canvaskit.js": "canvaskit/canvaskit.js",
  "canvaskit/canvaskit.js.symbols": "canvaskit/canvaskit.js.symbols",
  "canvaskit/canvaskit.wasm": "canvaskit/canvaskit.wasm",
  "canvaskit/chromium/canvaskit.js": "canvaskit/chromium/canvaskit.js",
  "canvaskit/chromium/canvaskit.js.symbols": "canvaskit/chromium/canvaskit.js.symbols",
  "canvaskit/chromium/canvaskit.wasm": "canvaskit/chromium/canvaskit.wasm",
  "canvaskit/skwasm.js": "canvaskit/skwasm.js",
  "canvaskit/skwasm.js.symbols": "canvaskit/skwasm.js.symbols",
  "canvaskit/skwasm.wasm": "canvaskit/skwasm.wasm",
  "canvaskit/skwasm.worker.js": "canvaskit/skwasm.worker.js",
  "favicon.png": "favicon.5dcef449.png",
  "flutter.js": "flutter.9e2caca1.js",
  "icons/Icon-192.png": "icons/Icon-192.ac9a721a.png",
  "icons/Icon-512.png": "icons/Icon-512.96e75261.png",
  "icons/Icon-maskable-192.png": "icons/Icon-maskable-192.c457ef57.png",
  "icons/Icon-maskable-512.png": "icons/Icon-maskable-512.301a7604.png",
  "main.dart.js": "main.dart.4d0cc01b.js",
  "main.dart.js.map": "main.dart.js.3e228042.map",
  "main.dart.js_1.part.js": "main.dart.js_1.part.391ae524.js",
  "main.dart.js_1.part.js.map": "main.dart.js_1.part.js.36bc922b.map",
  "main.dart.js_2.part.js": "main.dart.js_2.part.85b54716.js",
  "main.dart.js_2.part.js.map": "main.dart.js_2.part.js.14757053.map",
  "main.dart_0.js": "main.dart_0.7c1aaf8f.js",
  "main.dart_1.js": "main.dart_1.1d4a3b75.js",
  "main.dart_2.js": "main.dart_2.0caaa23d.js",
  "main.dart_3.js": "main.dart_3.a8e56f6d.js",
  "main.dart_4.js": "main.dart_4.7d7863be.js",
  "main.dart_5.js": "main.dart_5.0e69ad8a.js",
  "manifest.json": "manifest.f76404df.json"
};

    // window.deferredLibraryParts
    var deferredLibraryParts = {};

    // window.deferredPartUris
    var deferredPartUris = [];
    
    // hook dynamic create element `src` `href` property
    (function(){
      var _defineProperty = function (element, property) {
        var value;
        Object.defineProperty(element, property, {
          get: function () {
            return element.getAttribute(property);
          },
          set: function (v) {
            value = v;
            if (typeof v === 'string') {
              if (v.startsWith(assetBase)) {
                v = v.replace(assetBase, '');
              }
              if (v.startsWith('./')) {
                v = v.replace('./', '');
              }
              if (hashFileManifest[v]) {
                value = assetBase + hashFileManifest[v];
              }
            }
            element.setAttribute(property, value);
          }
        })
    
        var _setAttribute = element.setAttribute;
        element.setAttribute = function () {
          var args = Array.prototype.slice.call(arguments);
          // if (args[0] === 'src') {
          //   //do something here
          //   console.log('setAttribute', args[1])
          // }
          _setAttribute.apply(element, args);
        }
      }
    
      var _createElement = document.createElement;
      var _hookProperties = {'link': 'href', 'script': 'src', 'audio': 'src', 'video': 'src', 'map': 'src', 'img': 'src'};
      document.createElement = function (tagName) {
        var element = _createElement.call(document, tagName);
        var property = _hookProperties[tagName.toLowerCase()];
        if (property) {
          _defineProperty(element, property);
        }
        return element;
      }
    })();

    // preload main.dart.js_xxx.part js when page initialize
    (function(){
      var path;
      if (window.location.hash) {
        var hash = window.location.hash.substring(2);
        path = hash.split('?')[0];
      } else {
        var pathname = window.location.pathname;
        path = pathname.substring(pathname.lastIndexOf('/') + 1)
      }
      if (deferredLibraryParts[path]) {
        for (var index in deferredLibraryParts[path]) {
          // console.info('load main.dart.js_xxx.part: ' + deferredPartUris[index] + 'Date.now: ' + Date.now());
          dartDeferredLibraryLoader(deferredPartUris[index], null, null, path, null)
        }
      }
    })();
    
    // load main.dart.js_xxx.part js
    function dartDeferredLibraryLoader(uri, successCallback, errorCallback, loadId, loadPriority) {
      console.info('uri: ' + uri + ', loadId: '+ loadId + ', loadPriority: '+ loadPriority);
    
      var key = uri.toString().replace(/(.*)(main\.dart\.(.+)\.js)/g, '$2');
      var src = assetBase + mainjsManifest[key];
    
      var script = document.createElement("script");
      script.type = "text/javascript";
      script.src = src;
      script.addEventListener("load", successCallback, false);
      script.addEventListener("error", errorCallback, false);
      document.body.appendChild(script);
    }

    function dartDeferredLibraryMultiLoader(uris, successCallback, errorCallback, loadId, loadPriority) {
      // console.info('load main.dart.js_xxx.part: ' + uris + 'Date.now: ' + Date.now());
      console.info('uris: ' + uris + ', loadId: '+ loadId + ', loadPriority: '+ loadPriority);
      if (Object.prototype.toString.call(uris) === '[object Array]') {
        for (var index in uris) {
          dartDeferredLibraryLoader(uris[index], successCallback, errorCallback, loadId, loadPriority);
        }
      }
    }
    