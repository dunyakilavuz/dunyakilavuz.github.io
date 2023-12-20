'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"app-ads.txt": "1ecf32785792fb9f5d02342ceec2eada",
"assets/AssetManifest.bin": "237fffb9d5a6139f60a0e6586f2fad75",
"assets/AssetManifest.bin.json": "fb99e00502698ccf7d69fb05ef364262",
"assets/AssetManifest.json": "1ff563f48c61ef01e6bc1a122a59a7a6",
"assets/assets/android-logo.svg": "67feb4e4a68f7c2d60c9c2ede7ad4bb1",
"assets/assets/apple-logo.svg": "0fc5c1431bfb7f3442754566f7730ac6",
"assets/assets/appStore.svg": "b55d8d45148c4c7a8bd5ff4064b449c3",
"assets/assets/ar-logo.svg": "3e55edc7a8106093fa9e6d07fd089452",
"assets/assets/c-sharp-logo.svg": "287911e68191463b609411b229715e20",
"assets/assets/cv.html": "c8184d4324dd1077a6c0fcd390ff20a8",
"assets/assets/cv.pdf": "fc050ff5b773393e4be86cb154bea976",
"assets/assets/daragac_01.png": "c8e160b0db7fbd3449a93f4b37ccd088",
"assets/assets/daragac_02.png": "9b26839c6f31e9e62e943c6607998615",
"assets/assets/daragac_03.png": "8dad6409324b2d7ff0d28eb557d98f31",
"assets/assets/daragac_04.png": "7b2a43eae89b4c058045ef0027c84774",
"assets/assets/daragac_05.png": "d97b9874c547ddf91a19809336ae28f8",
"assets/assets/daragac_06.png": "73d095b82de8c26580dba60efecc6d05",
"assets/assets/daragac_07.png": "5cb1c17104b527eba73da25f16969bb8",
"assets/assets/digitaldaragac.png": "74e00a20e6e29bb268752c701ea818e1",
"assets/assets/django-logo.svg": "20c8e0ac9a15bb7d542ea1c8e8cb447c",
"assets/assets/flutter-logo.svg": "549a1b7dd82615e8e9c95c1ade8cee42",
"assets/assets/godot-logo.svg": "0e387f9317c561f1c4ec44f22e6b372c",
"assets/assets/googlePlay.svg": "07a1f9cbfb107bf7b2d3e4aac5136818",
"assets/assets/instagram-logo.svg": "46a406fd1666ad74459386b5109d9b1d",
"assets/assets/profilepic.jpg": "2afa30dacf7f2496d0bccef527c1ec8c",
"assets/assets/react-native-logo.svg": "82dcad1753c87b17672ea3a9a79ec9ac",
"assets/assets/snapchat-logo.svg": "7aac87002edd1455fb95c06aa371dd1f",
"assets/assets/solarx-logo.png": "815e5a72aa52f15f83f54acf7fa1e107",
"assets/assets/solarxar-logo.jpg": "2d1ec1ace85d897fe630586b87b3dd02",
"assets/assets/solarxar_01.png": "1130feb043fb1e9c80162ad913a8807e",
"assets/assets/solarxar_02.png": "a66ef35288d9554498f6fb65ff4c4340",
"assets/assets/solarxar_03.png": "bee6053d8bf6bb62486437cc8f767804",
"assets/assets/solarxar_04.png": "82d32a58fa8aa385961fb296ea71d6da",
"assets/assets/solarxar_05.png": "52751e05377114949b7bd21e2f3e2f85",
"assets/assets/solarx_01.png": "7833f391a06e6cde837c9cbaf78e71ac",
"assets/assets/solarx_02.png": "697ca43e4733facd095b5fb3f1d70006",
"assets/assets/solarx_03.png": "ffab092c25d9e848a846526d2b0dca5f",
"assets/assets/solarx_04.png": "172c7c0792eff4499096b0dac88d251b",
"assets/assets/solarx_05.png": "b6fe3b9e6b799ece093aa054226aa912",
"assets/assets/tiktok-logo.svg": "c78ba100d7c6487f018090ce13a78ec2",
"assets/assets/webURL.svg": "ce308d3265e003c6226e874033d43faf",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/fonts/LICENSE.txt": "d273d63619c9aeaf15cdaf76422c4f87",
"assets/fonts/MaterialIcons-Regular.otf": "f7bf2cee433ed1978559fb1a8cc6889d",
"assets/fonts/Roboto-Black.ttf": "d6a6f8878adb0d8e69f9fa2e0b622924",
"assets/fonts/Roboto-BlackItalic.ttf": "c3332e3b8feff748ecb0c6cb75d65eae",
"assets/fonts/Roboto-Bold.ttf": "b8e42971dec8d49207a8c8e2b919a6ac",
"assets/fonts/Roboto-BoldItalic.ttf": "fd6e9700781c4aaae877999d09db9e09",
"assets/fonts/Roboto-Italic.ttf": "cebd892d1acfcc455f5e52d4104f2719",
"assets/fonts/Roboto-Light.ttf": "881e150ab929e26d1f812c4342c15a7c",
"assets/fonts/Roboto-LightItalic.ttf": "5788d5ce921d7a9b4fa0eaa9bf7fec8d",
"assets/fonts/Roboto-Medium.ttf": "68ea4734cf86bd544650aee05137d7bb",
"assets/fonts/Roboto-MediumItalic.ttf": "c16d19c2c0fd1278390a82fc245f4923",
"assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/fonts/Roboto-Thin.ttf": "66209ae01f484e46679622dd607fcbc5",
"assets/fonts/Roboto-ThinItalic.ttf": "7bcadd0675fe47d69c2d8aaef683416f",
"assets/NOTICES": "bb9af3066ad10d020aafc6257f0fa690",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "22a762f3b6332b1e6653bd94c6610a69",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "60dc031753d04c314ea88a0d2283133b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"CNAME": "84831ab750e34a6ca2a9a8971da8d657",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/logo.png": "ba1fc0d07360e8ee5234dd355e3bf8bc",
"index.html": "149790b734e8d282f585fb2a9566d3a6",
"/": "149790b734e8d282f585fb2a9566d3a6",
"main.dart.js": "a693db31c8720017ce9887bfceab69bc",
"manifest.json": "bf284905fcfd2549f725125dae0e2643",
"solarx-privacy.html": "51bc25897f547ee1c5d0aaa425f14934",
"styles.css": "254ab817055652dddc3bfe86ae64169b",
"version.json": "d0c859b52c9fa042c8627b6938ce9ef1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
