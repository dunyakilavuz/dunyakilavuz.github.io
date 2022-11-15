'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "d0c859b52c9fa042c8627b6938ce9ef1",
"index.html": "f0e79d964664a2678278caccff1ffab0",
"/": "f0e79d964664a2678278caccff1ffab0",
"styles.css": "19e0812553bd8a3b5602a5a08cde981f",
"CNAME": "84831ab750e34a6ca2a9a8971da8d657",
"main.dart.js": "b731e207d3b704fd6e430a8991d1d311",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"app-ads.txt": "1ecf32785792fb9f5d02342ceec2eada",
"solarx-privacy.html": "84fef84d8812bc2a3ccce198922ab1b0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/logo.png": "ba1fc0d07360e8ee5234dd355e3bf8bc",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e7513ead22bf2f8ea36f0c433e7d4f43",
"assets/AssetManifest.json": "d7ae6910af9b5fefa33987748d0f5c9a",
"assets/NOTICES": "e83c8e377aa82d4d668910fa25836783",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/shaders/ink_sparkle.frag": "b578949ef84473e7e3afec548b165299",
"assets/fonts/Roboto-Medium.ttf": "68ea4734cf86bd544650aee05137d7bb",
"assets/fonts/Roboto-Light.ttf": "881e150ab929e26d1f812c4342c15a7c",
"assets/fonts/SF-Pro-Text-Heavy.otf": "e95e3ed798a69a8dde08976fc2a7ec72",
"assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/fonts/Roboto-MediumItalic.ttf": "c16d19c2c0fd1278390a82fc245f4923",
"assets/fonts/SF-Pro-Text-Light.otf": "7130ae5c8b4a4601ae385552a5495ccd",
"assets/fonts/SF-Pro-Text-Black.otf": "20d198c05f2252879bcf602ba9f0d35d",
"assets/fonts/SF-Pro-Text-Regular.otf": "8ad8bdc669747f93f259905b62f43c1b",
"assets/fonts/SF-Pro-Text-Ultralight.otf": "5bbbb2ff853c862ab3fdbdb05de7c347",
"assets/fonts/SF-Pro-Text-Bold.otf": "1828ca0d01918773ecf692a80c3a058c",
"assets/fonts/SF-Pro-Text-Thin.otf": "d280c89601363f80fe00e5e113d5d915",
"assets/fonts/Roboto-ThinItalic.ttf": "7bcadd0675fe47d69c2d8aaef683416f",
"assets/fonts/Roboto-BoldItalic.ttf": "fd6e9700781c4aaae877999d09db9e09",
"assets/fonts/Roboto-LightItalic.ttf": "5788d5ce921d7a9b4fa0eaa9bf7fec8d",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/fonts/Roboto-Italic.ttf": "cebd892d1acfcc455f5e52d4104f2719",
"assets/fonts/LICENSE.txt": "3b83ef96387f14655fc854ddc3c6bd57",
"assets/fonts/Roboto-BlackItalic.ttf": "c3332e3b8feff748ecb0c6cb75d65eae",
"assets/fonts/Roboto-Bold.ttf": "b8e42971dec8d49207a8c8e2b919a6ac",
"assets/fonts/SF-Pro-Text-Semibold.otf": "85da828bdfb6b2907092a4bae41389d1",
"assets/fonts/Roboto-Thin.ttf": "66209ae01f484e46679622dd607fcbc5",
"assets/fonts/Roboto-Black.ttf": "d6a6f8878adb0d8e69f9fa2e0b622924",
"assets/fonts/SF-Pro-Text-Medium.otf": "2f11ca31044ec0d53abe901722d4fb84",
"assets/assets/appStore.svg": "b55d8d45148c4c7a8bd5ff4064b449c3",
"assets/assets/linkedin_icon.svg": "0917c1fc4d92dba29242174977c7b613",
"assets/assets/ar-logo.svg": "0cf8d815e07d5a70eb49f12c71087f4b",
"assets/assets/android-logo.svg": "67feb4e4a68f7c2d60c9c2ede7ad4bb1",
"assets/assets/profilepic.jpg": "2afa30dacf7f2496d0bccef527c1ec8c",
"assets/assets/profilepic.jpeg": "800ac90e6c2e027e69fb03687746aa7f",
"assets/assets/digitaldaragac.png": "74e00a20e6e29bb268752c701ea818e1",
"assets/assets/googlePlay.svg": "07a1f9cbfb107bf7b2d3e4aac5136818",
"assets/assets/daragac_07.png": "5cb1c17104b527eba73da25f16969bb8",
"assets/assets/c-sharp-logo.svg": "287911e68191463b609411b229715e20",
"assets/assets/solarx_04.png": "172c7c0792eff4499096b0dac88d251b",
"assets/assets/solarx_05.png": "b6fe3b9e6b799ece093aa054226aa912",
"assets/assets/daragac_06.png": "73d095b82de8c26580dba60efecc6d05",
"assets/assets/github_icon.svg": "718891a8faf8dea0c5e504c2688b4aa8",
"assets/assets/react-native-logo.svg": "8e26f22094a11f6a689d8302dc30782c",
"assets/assets/daragac_04.png": "7b2a43eae89b4c058045ef0027c84774",
"assets/assets/daragac_05.png": "d97b9874c547ddf91a19809336ae28f8",
"assets/assets/daragac_01.png": "c8e160b0db7fbd3449a93f4b37ccd088",
"assets/assets/solarx_02.png": "697ca43e4733facd095b5fb3f1d70006",
"assets/assets/solarx_03.png": "ffab092c25d9e848a846526d2b0dca5f",
"assets/assets/daragac_02.png": "9b26839c6f31e9e62e943c6607998615",
"assets/assets/solarx_01.png": "7833f391a06e6cde837c9cbaf78e71ac",
"assets/assets/godot-logo.svg": "c46a6863bdfbba985f81c34f5a276c52",
"assets/assets/daragac_03.png": "8dad6409324b2d7ff0d28eb557d98f31",
"assets/assets/apple-logo.svg": "00587615733dd4954be85d8bf79f1d6f",
"assets/assets/solarx-logo.png": "815e5a72aa52f15f83f54acf7fa1e107",
"assets/assets/django-logo.svg": "20c8e0ac9a15bb7d542ea1c8e8cb447c",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
          if (response && Boolean(response.ok)) {
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
