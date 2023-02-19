'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js_1.part.2a7c01e4.js": "b8b54e6fd424d0e76119b4bafcc75d27",
"favicon.5dcef449.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.f76404df.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"canvaskit/canvaskit.js": "1338eccfe817956d34753284f2b1cdf6",
"canvaskit/canvaskit.wasm": "78daff025a185d11c6a08349e295f9eb",
"flutter.10920ce5.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"assets/shaders/ink_sparkle.frag": "57f2f020e63be0dd85efafc7b7b25d80",
"assets/FontManifest.f589c084.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.60114762.ttf": "60114762957c6a50d2e0cd7d2c5b7b98",
"assets/packages/wakelock_web/assets/no_sleep.7748a45c.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/fluttertoast/assets/toastify.a8567505.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.e7006a0a.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/AssetManifest.bin": "75d5c1e360838487bae9165dc84d77b6",
"assets/assets/svg/dart.b201ee39.svg": "b201ee39cdb3908309402cafbe7934f9",
"assets/assets/svg/flutter_logo.2a3e180e.svg": "2a3e180ece9fece44331562d7c7f2382",
"assets/assets/google_fonts/Inter-ExtraBold.c9709fb8.ttf": "c9709fb8e32755490795ce5bd226c3a0",
"assets/assets/google_fonts/Inter-Light.d55f45d0.ttf": "d55f45d07cfe01e8797bd1566561f718",
"assets/assets/google_fonts/Inter-SemiBold.07a48beb.ttf": "07a48beb92b401297a76ff9f6aedd0ed",
"assets/assets/google_fonts/Inter-Regular.079af0e2.ttf": "079af0e2936ccb99b391ddc0bbb73dcb",
"assets/assets/google_fonts/Inter-Bold.275bfea5.ttf": "275bfea5dc74c33f51916fee80feae67",
"assets/assets/google_fonts/Inter-Thin.2dce6221.ttf": "2dce622147cace7b467d9929b7708430",
"assets/assets/google_fonts/Inter-Medium.ed533866.ttf": "ed533866b5c83114c7dddbcbc2288b19",
"assets/assets/google_fonts/Inter-Black.980c7e87.ttf": "980c7e8757e741bb49c7c96513924c61",
"assets/assets/google_fonts/Inter-ExtraLight.0f3ac069.ttf": "0f3ac0692901f70f1ac32cf079355051",
"assets/assets/images/lufei.e42dc430.jpeg": "e42dc430bc87566089eea8c1e2786ab1",
"assets/NOTICES": "2804529b89bb015cc5d8dad459cc712f",
"assets/fonts/MaterialIcons-Regular.41299a4e.otf": "41299a4e725d49bc2954f9c48719230f",
"assets/AssetManifest.40a34155.json": "6acec4df2b1f22653b0917f089b7e713",
"index.html": "cd61bef4cb3b04b08a9ca0d29e54e6ea",
"/": "cd61bef4cb3b04b08a9ca0d29e54e6ea",
"flutter_web_optimizer.a0fa19a4.js": "a0fa19a48e9542f9a8f06561ed52425d",
"main.dart_0.9b5c2f9d.js": "9b5c2f9de5d75c1eec3e3ee0e6f1e68f",
"main.dart_1.8ac7760a.js": "8ac7760ac0553000090a5a28a39c0e44",
"main.dart_2.d082204f.js": "d082204f396be3546bb4e0cc469fc2e0",
"main.dart_3.0b4449d6.js": "0b4449d6c96089862dd9003770606129",
"main.dart_4.3f085b63.js": "3f085b63cef35630dbcc60c2de1dc17f",
"main.dart_5.ad0ec818.js": "1f7d9326a49ac2d2a0361dca6ac3915b",
"icons/Icon-512.96e75261.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.c457ef57.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.301a7604.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.ac9a721a.png": "ac9a721a12bbc803b44f645561ecb1e1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js_1.part.2a7c01e4.js",
"main.dart_0.9b5c2f9d.js",
"main.dart_1.8ac7760a.js",
"main.dart_2.d082204f.js",
"main.dart_3.0b4449d6.js",
"main.dart_4.3f085b63.js",
"main.dart_5.ad0ec818.js",
"index.html",
"assets/AssetManifest.40a34155.json",
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
