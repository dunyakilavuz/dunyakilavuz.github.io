'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "d7f44209375a354f78542cababe0dfe7",
"version.json": "d0c859b52c9fa042c8627b6938ce9ef1",
"index.html": "a8bc53d0184aa466bcbddfe95f8b2ce9",
"/": "a8bc53d0184aa466bcbddfe95f8b2ce9",
"styles.css": "642116c1b75cd02277fb2959a58cae7a",
"CNAME": "84831ab750e34a6ca2a9a8971da8d657",
"main.dart.js": "ec06f89919948103988df8fd27c86fe7",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"app-ads.txt": "1ecf32785792fb9f5d02342ceec2eada",
"solarx-privacy.html": "84fef84d8812bc2a3ccce198922ab1b0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"cv.html": "39e5689b85666a42758859e7cb20f398",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/logo.png": "ba1fc0d07360e8ee5234dd355e3bf8bc",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e7513ead22bf2f8ea36f0c433e7d4f43",
"assets/AssetManifest.json": "1ff563f48c61ef01e6bc1a122a59a7a6",
"assets/NOTICES": "071d8d1c96aa1c89ac312d808a953677",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/AssetManifest.bin.json": "fb99e00502698ccf7d69fb05ef364262",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "b70ccf6f1e4435bd08808199af3f7fa2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "58bceaa5961579e8580eba464e20807a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "237fffb9d5a6139f60a0e6586f2fad75",
"assets/fonts/Roboto-Medium.ttf": "68ea4734cf86bd544650aee05137d7bb",
"assets/fonts/Roboto-Light.ttf": "881e150ab929e26d1f812c4342c15a7c",
"assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/fonts/Roboto-MediumItalic.ttf": "c16d19c2c0fd1278390a82fc245f4923",
"assets/fonts/Roboto-ThinItalic.ttf": "7bcadd0675fe47d69c2d8aaef683416f",
"assets/fonts/Roboto-BoldItalic.ttf": "fd6e9700781c4aaae877999d09db9e09",
"assets/fonts/Roboto-LightItalic.ttf": "5788d5ce921d7a9b4fa0eaa9bf7fec8d",
"assets/fonts/MaterialIcons-Regular.otf": "611c85327312b12b5e61a6b40711b0a3",
"assets/fonts/Roboto-Italic.ttf": "cebd892d1acfcc455f5e52d4104f2719",
"assets/fonts/LICENSE.txt": "3b83ef96387f14655fc854ddc3c6bd57",
"assets/fonts/Roboto-BlackItalic.ttf": "c3332e3b8feff748ecb0c6cb75d65eae",
"assets/fonts/Roboto-Bold.ttf": "b8e42971dec8d49207a8c8e2b919a6ac",
"assets/fonts/Roboto-Thin.ttf": "66209ae01f484e46679622dd607fcbc5",
"assets/fonts/Roboto-Black.ttf": "d6a6f8878adb0d8e69f9fa2e0b622924",
"assets/assets/appStore.svg": "b55d8d45148c4c7a8bd5ff4064b449c3",
"assets/assets/instagram-logo.svg": "3c451c27d33cbbaf8401aa796bcd7ec5",
"assets/assets/ar-logo.svg": "0cf8d815e07d5a70eb49f12c71087f4b",
"assets/assets/android-logo.svg": "67feb4e4a68f7c2d60c9c2ede7ad4bb1",
"assets/assets/tiktok-logo.svg": "c78ba100d7c6487f018090ce13a78ec2",
"assets/assets/snapchat-logo.svg": "7aac87002edd1455fb95c06aa371dd1f",
"assets/assets/profilepic.jpg": "2afa30dacf7f2496d0bccef527c1ec8c",
"assets/assets/digitaldaragac.png": "74e00a20e6e29bb268752c701ea818e1",
"assets/assets/googlePlay.svg": "07a1f9cbfb107bf7b2d3e4aac5136818",
"assets/assets/daragac_07.png": "5cb1c17104b527eba73da25f16969bb8",
"assets/assets/c-sharp-logo.svg": "287911e68191463b609411b229715e20",
"assets/assets/solarx_04.png": "172c7c0792eff4499096b0dac88d251b",
"assets/assets/solarxar-logo.jpg": "2d1ec1ace85d897fe630586b87b3dd02",
"assets/assets/solarx_05.png": "b6fe3b9e6b799ece093aa054226aa912",
"assets/assets/daragac_06.png": "73d095b82de8c26580dba60efecc6d05",
"assets/assets/react-native-logo.svg": "8e26f22094a11f6a689d8302dc30782c",
"assets/assets/daragac_04.png": "7b2a43eae89b4c058045ef0027c84774",
"assets/assets/cv.html": "39e5689b85666a42758859e7cb20f398",
"assets/assets/daragac_05.png": "d97b9874c547ddf91a19809336ae28f8",
"assets/assets/webURL.svg": "ce308d3265e003c6226e874033d43faf",
"assets/assets/daragac_01.png": "c8e160b0db7fbd3449a93f4b37ccd088",
"assets/assets/solarx_02.png": "697ca43e4733facd095b5fb3f1d70006",
"assets/assets/solarx_03.png": "ffab092c25d9e848a846526d2b0dca5f",
"assets/assets/daragac_02.png": "9b26839c6f31e9e62e943c6607998615",
"assets/assets/solarx_01.png": "7833f391a06e6cde837c9cbaf78e71ac",
"assets/assets/godot-logo.svg": "c46a6863bdfbba985f81c34f5a276c52",
"assets/assets/daragac_03.png": "8dad6409324b2d7ff0d28eb557d98f31",
"assets/assets/apple-logo.svg": "00587615733dd4954be85d8bf79f1d6f",
"assets/assets/solarxar_02.png": "a66ef35288d9554498f6fb65ff4c4340",
"assets/assets/solarxar_03.png": "bee6053d8bf6bb62486437cc8f767804",
"assets/assets/solarx-logo.png": "815e5a72aa52f15f83f54acf7fa1e107",
"assets/assets/solarxar_01.png": "1130feb043fb1e9c80162ad913a8807e",
"assets/assets/django-logo.svg": "20c8e0ac9a15bb7d542ea1c8e8cb447c",
"assets/assets/flutter-logo.svg": "549a1b7dd82615e8e9c95c1ade8cee42",
"assets/assets/solarxar_04.png": "82d32a58fa8aa385961fb296ea71d6da",
"assets/assets/solarxar_05.png": "52751e05377114949b7bd21e2f3e2f85",
"assets/assets/cv.pdf": "cab775d1507ef68cb0e45f7db83c1ae8",
"cv.pdf": "cab775d1507ef68cb0e45f7db83c1ae8",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
