    // The code below is injected by flutter web optimizer, do not edit!!!!!!

    // window.assetBase
    var assetBase = "https://tryimpossible.github.io/flutter-diy/flutter-web-optimizer-example-artifact/";
    
    // window.mainjsManifest
    var mainjsManifest = {
  "main.dart.js": "main.ce2967b4.dart.js",
  "main.dart.js_1.part.js": "main.5ce808dd.dart.js_1.part.js",
  "main.dart.js_2.part.js": "main.40ccad1f.dart.js_2.part.js",
  "main.dart_0.js": "main.1dfb154f.dart_0.js",
  "main.dart_1.js": "main.493f6ca2.dart_1.js",
  "main.dart_2.js": "main.a6e2161e.dart_2.js",
  "main.dart_3.js": "main.159e15b7.dart_3.js",
  "main.dart_4.js": "main.60c62dd7.dart_4.js",
  "main.dart_5.js": "main.4273c103.dart_5.js"
};
    
    // window.hashFileManifest
    var hashFileManifest = {
  "assets/AssetManifest.bin": "assets/AssetManifest.40d91b54.bin",
  "assets/AssetManifest.bin.json": "assets/AssetManifest.8d1dc191.bin.json",
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
  "flutter.js": "flutter.589d73e4.js",
  "icons/Icon-192.png": "icons/Icon-192.ac9a721a.png",
  "icons/Icon-512.png": "icons/Icon-512.96e75261.png",
  "icons/Icon-maskable-192.png": "icons/Icon-maskable-192.c457ef57.png",
  "icons/Icon-maskable-512.png": "icons/Icon-maskable-512.301a7604.png",
  "main.dart.js": "main.ce2967b4.dart.js",
  "main.dart.js.map": "main.254220ba.dart.js.map",
  "main.dart.js_1.part.js": "main.5ce808dd.dart.js_1.part.js",
  "main.dart.js_1.part.js.map": "main.b424f9c6.dart.js_1.part.js.map",
  "main.dart.js_2.part.js": "main.40ccad1f.dart.js_2.part.js",
  "main.dart.js_2.part.js.map": "main.14757053.dart.js_2.part.js.map",
  "main.dart_0.js": "main.1dfb154f.dart_0.js",
  "main.dart_1.js": "main.493f6ca2.dart_1.js",
  "main.dart_2.js": "main.a6e2161e.dart_2.js",
  "main.dart_3.js": "main.159e15b7.dart_3.js",
  "main.dart_4.js": "main.60c62dd7.dart_4.js",
  "main.dart_5.js": "main.4273c103.dart_5.js",
  "manifest.json": "manifest.f76404df.json"
};
    
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
    
    // load main.dart.js_xxx.part js
    function dartDeferredLibraryLoader(uri, successCallback, errorCallback, loadId) {
      console.info('uri: ' + uri + ', loadId: '+ loadId);
    
      var key = uri.toString().replace(/(.*)(main\.dart\.(.+)\.js)/g, '$2');
      var src = assetBase + mainjsManifest[key];
    
      var script = document.createElement("script");
      script.type = "text/javascript";
      script.src = src;
      script.addEventListener("load", successCallback, false);
      script.addEventListener("error", errorCallback, false);
      document.body.appendChild(script);
    }
    