'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "flutter.10920ce5.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"index.html": "6b61bde16867738ccb5e247bf6b767cd",
"/": "6b61bde16867738ccb5e247bf6b767cd",
"flutter_web_optimizer.689c2117.js": "689c2117c5829ee33bc16142a30e43c4",
"main.dart_0.dbd03e81.js": "dbd03e81297f46cf8db1bf0a6bce2240",
"main.dart_1.30c927d5.js": "30c927d5178c8f90fca503801216c800",
"main.dart_2.716d1c25.js": "716d1c2503764e4a9f4bef729907fd62",
"main.dart_3.6101c855.js": "6101c855f655b2eb98fa69af13a2af7c",
"main.dart_4.cf66b148.js": "cf66b1484c30c1f56272d5bf422fa874",
"main.dart_5.273036da.js": "e9d86232e618a44208b4df57effe570f",
"manifest.f76404df.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"main.dart.js_1.part.28daaff2.js": "195b72b6f692e32da8802c917c3f7429",
"favicon.5dcef449.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-512.96e75261.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.301a7604.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.c457ef57.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.ac9a721a.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/FontManifest.012eb3a7.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "fc3fdc6c77c5945e2fa67a61a31104f0",
"assets/fonts/MaterialIcons-Regular.e7069dfd.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/lufei.e42dc430.jpeg": "e42dc430bc87566089eea8c1e2786ab1",
"assets/assets/svg/flutter_logo.2a3e180e.svg": "2a3e180ece9fece44331562d7c7f2382",
"assets/assets/svg/dart.b201ee39.svg": "b201ee39cdb3908309402cafbe7934f9",
"assets/packages/wakelock_web/assets/no_sleep.7748a45c.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/fluttertoast/assets/toastify.e7006a0a.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/fluttertoast/assets/toastify.a8567505.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/cupertino_icons/assets/CupertinoIcons.6d342eb6.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.6cde1e9b.json": "6ee2f35bb8ce5c5600f2d815ceeede0d",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"version.json": "ff966ab969ba381b900e61629bfb9789"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js_1.part.28daaff2.js",
"main.dart_0.dbd03e81.js",
"main.dart_1.30c927d5.js",
"main.dart_2.716d1c25.js",
"main.dart_3.6101c855.js",
"main.dart_4.cf66b148.js",
"main.dart_5.273036da.js",
"index.html",
"assets/AssetManifest.6cde1e9b.json",
"assets/FontManifest.012eb3a7.json"
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
