'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.wasm": "78daff025a185d11c6a08349e295f9eb",
"canvaskit/canvaskit.js": "1338eccfe817956d34753284f2b1cdf6",
"favicon.5dcef449.png": "5dcef449791fa27946b3d35ad8803796",
"assets/NOTICES": "3008dd20e9f0189ce75ed6856b9ba518",
"assets/assets/images/lufei.e42dc430.jpeg": "e42dc430bc87566089eea8c1e2786ab1",
"assets/assets/google_fonts/Inter-Thin.ttf": "2dce622147cace7b467d9929b7708430",
"assets/assets/google_fonts/Inter-SemiBold.ttf": "07a48beb92b401297a76ff9f6aedd0ed",
"assets/assets/google_fonts/Inter-ExtraBold.ttf": "c9709fb8e32755490795ce5bd226c3a0",
"assets/assets/google_fonts/Inter-Light.ttf": "d55f45d07cfe01e8797bd1566561f718",
"assets/assets/google_fonts/Inter-Black.ttf": "980c7e8757e741bb49c7c96513924c61",
"assets/assets/google_fonts/Inter-Medium.ttf": "ed533866b5c83114c7dddbcbc2288b19",
"assets/assets/google_fonts/Inter-Bold.ttf": "275bfea5dc74c33f51916fee80feae67",
"assets/assets/google_fonts/Inter-Regular.ttf": "079af0e2936ccb99b391ddc0bbb73dcb",
"assets/assets/google_fonts/Inter-ExtraLight.ttf": "0f3ac0692901f70f1ac32cf079355051",
"assets/assets/svg/dart.b201ee39.svg": "b201ee39cdb3908309402cafbe7934f9",
"assets/assets/svg/flutter_logo.2a3e180e.svg": "2a3e180ece9fece44331562d7c7f2382",
"assets/AssetManifest.bin": "75d5c1e360838487bae9165dc84d77b6",
"assets/FontManifest.f589c084.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.41299a4e.otf": "41299a4e725d49bc2954f9c48719230f",
"assets/packages/fluttertoast/assets/toastify.e7006a0a.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/fluttertoast/assets/toastify.a8567505.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/cupertino_icons/assets/CupertinoIcons.60114762.ttf": "60114762957c6a50d2e0cd7d2c5b7b98",
"assets/packages/wakelock_web/assets/no_sleep.7748a45c.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "57f2f020e63be0dd85efafc7b7b25d80",
"assets/AssetManifest.671b9ac9.json": "6acec4df2b1f22653b0917f089b7e713",
"flutter_web_optimizer.b22ce7ee.js": "b22ce7ee257020ec6e98c13674251346",
"main.dart_0.5c8837f2.js": "5c8837f2d5650d7b8e4383488338b40e",
"main.dart_1.a22706a5.js": "a22706a57e1e2e921ac0644d2efc6b7f",
"main.dart_2.ca3729a3.js": "ca3729a3cc9998bde3c97b38d9258e70",
"main.dart_3.5f7278ab.js": "5f7278ab289441c0cb3c4514afbd6607",
"main.dart_4.03866b7d.js": "03866b7ddd01aa4d38adbd62e60cacb5",
"main.dart_5.d5c0a43d.js": "6e32be0722deafb7626b37ab1ea5a3a5",
"manifest.f76404df.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"flutter.10920ce5.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"main.dart.js_1.part.95dc3c4c.js": "cfdac25573567b670e4bd03b22afa270",
"index.html": "6feb90bcc2cd2c9b79b800e3980f923f",
"/": "6feb90bcc2cd2c9b79b800e3980f923f",
"icons/Icon-192.ac9a721a.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.c457ef57.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.301a7604.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.96e75261.png": "96e752610906ba2a93c65f8abe1645f1",
"version.json": "ff966ab969ba381b900e61629bfb9789"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js_1.part.95dc3c4c.js",
"main.dart_0.5c8837f2.js",
"main.dart_1.a22706a5.js",
"main.dart_2.ca3729a3.js",
"main.dart_3.5f7278ab.js",
"main.dart_4.03866b7d.js",
"main.dart_5.d5c0a43d.js",
"index.html",
"assets/AssetManifest.671b9ac9.json",
"assets/FontManifest.f589c084.json"
];

// window.assetBase
var assetBase = "https://tryimpossible.github.io/flutter-diy/flutter-web-optimizer-example-artifact/";

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => {
          return new Request(value === 'index.html' ? value : `${assetBase}${value}`, {'cache': 'reload'});
        }));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        key = findKey(key);
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  key = findKey(key);
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    key = findKey(key);
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

function findKey(key) {
  const resultKey = Object.keys(RESOURCES).filter(k => k !== '/').find(k => new RegExp(k).test(key));
  if (!resultKey) {
    return key;
  }
  return resultKey;
}
