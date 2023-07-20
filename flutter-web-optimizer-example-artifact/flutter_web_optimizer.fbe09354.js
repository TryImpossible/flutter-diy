    // The code below is injected by flutter web optimizer, do not edit!!!!!!
    
    // window.assetBase
    var assetBase = "https://tryimpossible.github.io/flutter-diy/flutter-web-optimizer-example-artifact/";
    
    // window.mainjsManifest
    var mainjsManifest = {
  "main.dart.js": "main.dart.5f351be8.js",
  "main.dart.js_1.part.js": "main.dart.js_1.part.163b4ab0.js",
  "main.dart_0.js": "main.dart_0.a5cbcede.js",
  "main.dart_1.js": "main.dart_1.cb841770.js",
  "main.dart_2.js": "main.dart_2.68e86439.js",
  "main.dart_3.js": "main.dart_3.7af6a2db.js",
  "main.dart_4.js": "main.dart_4.61793948.js",
  "main.dart_5.js": "main.dart_5.c8975e9e.js"
};
    
    // window.hashFileManifest
    var hashFileManifest = {
  "assets/AssetManifest.json": "assets/AssetManifest.f5af4092.json",
  "assets/FontManifest.json": "assets/FontManifest.75628501.json",
  "assets/assets/images/lufei.jpeg": "assets/assets/images/lufei.e42dc430.jpeg",
  "assets/assets/svg/dart.svg": "assets/assets/svg/dart.b201ee39.svg",
  "assets/assets/svg/flutter_logo.svg": "assets/assets/svg/flutter_logo.2a3e180e.svg",
  "assets/fonts/MaterialIcons-Regular.otf": "assets/fonts/MaterialIcons-Regular.86193de1.otf",
  "assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "assets/packages/cupertino_icons/assets/CupertinoIcons.f2163b9d.ttf",
  "assets/packages/fluttertoast/assets/toastify.css": "assets/packages/fluttertoast/assets/toastify.a8567505.css",
  "assets/packages/fluttertoast/assets/toastify.js": "assets/packages/fluttertoast/assets/toastify.56e2c9ce.js",
  "assets/packages/wakelock_plus/assets/no_sleep.js": "assets/packages/wakelock_plus/assets/no_sleep.7748a45c.js",
  "favicon.png": "favicon.5dcef449.png",
  "flutter.js": "flutter.822458aa.js",
  "icons/Icon-192.png": "icons/Icon-192.ac9a721a.png",
  "icons/Icon-512.png": "icons/Icon-512.96e75261.png",
  "icons/Icon-maskable-192.png": "icons/Icon-maskable-192.c457ef57.png",
  "icons/Icon-maskable-512.png": "icons/Icon-maskable-512.301a7604.png",
  "main.dart.js": "main.dart.5f351be8.js",
  "main.dart.js.map": "main.dart.js.ab0fdf89.map",
  "main.dart.js_1.part.js": "main.dart.js_1.part.163b4ab0.js",
  "main.dart.js_1.part.js.map": "main.dart.js_1.part.js.94eaa372.map",
  "main.dart_0.js": "main.dart_0.a5cbcede.js",
  "main.dart_1.js": "main.dart_1.cb841770.js",
  "main.dart_2.js": "main.dart_2.68e86439.js",
  "main.dart_3.js": "main.dart_3.7af6a2db.js",
  "main.dart_4.js": "main.dart_4.61793948.js",
  "main.dart_5.js": "main.dart_5.c8975e9e.js",
  "manifest.json": "manifest.f76404df.json"
};
    
    // hook dynamic create element `src` `href` property
    (function(){
      var _defineProperty = function (element, property) {
        var value;
        Object.defineProperty(element, property, {
          get: function () {
            return value;
          },
          set: function (v) {
            value = v;
            if (typeof v === 'string') {
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
      var src;
      try {
        var url = new URL(uri);
        var key = url.pathname.replaceAll(/(.*)(main\.dart\.(.+)\.js)/g, '$2');
        src = assetBase + mainjsManifest[key];
      } catch (e) {
        var key = uri.replaceAll(/(.*)(main\.dart\.(.+)\.js)/g, '$2');
        src = assetBase + mainjsManifest[key];
      }
    
      var script = document.createElement("script");
      script.type = "text/javascript";
      script.src = src;
      script.addEventListener("load", successCallback, false);
      script.addEventListener("error", errorCallback, false);
      document.body.appendChild(script);
    }
    