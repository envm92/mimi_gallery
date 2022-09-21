'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "6c6528d242522cf22802661c00a4f9b8",
"index.html": "3a8c6cba85baadee693fdcda55dbfaf9",
"/": "3a8c6cba85baadee693fdcda55dbfaf9",
"main.dart.js": "ca2ab889c06e895669d4bf6e907eb861",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "74fec5af5453b12ef788859b737b03dd",
"assets/images/2294.webp": "0f79ce7d91c95aa6fdfce456ee5cd37c",
"assets/images/2017.webp": "524e20aec1a5d497af3a89ceaf648081",
"assets/images/0636.webp": "09fe7149b02814c07ea0141779c55493",
"assets/images/1820.webp": "e174d26f3800649024a265ec0d82ecdc",
"assets/images/2298.webp": "603cb51c663eaaa10bb0a9ffea8ed294",
"assets/images/1289.webp": "baa4585931088b08fb1495897f1c38e6",
"assets/images/0973.webp": "f650a13648401398c2b278623715a18b",
"assets/images/0066.webp": "eb1360d9e5bf8d84e79b323b74530a90",
"assets/images/0820.webp": "d8c32cbd56e6a9cd1bc4c69de1bcf283",
"assets/images/1437.webp": "6025d7d9bc5776c95c9129268c3b18bd",
"assets/images/2173.webp": "5c77546851854ad4ea840e46ab61fd89",
"assets/images/2061.webp": "498c3868f752a5e0d5f072a57a6de2bc",
"assets/images/1381.webp": "ad8acd3210fc4c855f94eb0022e7548c",
"assets/images/1102.webp": "af72d37448a5056c9ee21a3959e66625",
"assets/images/0744.webp": "1a1c9317bf3e6072cfb018105b6c84aa",
"assets/images/1207.webp": "a4c6371ec31b01619ad128bed30d81cd",
"assets/images/0695.webp": "7d797c2214efd954b1bf9cbbe5b1a8bb",
"assets/images/1211.webp": "f82944bd0522f83c526c6b6abf2090d9",
"assets/images/1641.webp": "75e18aea70fc7eb55d3757698cdeb367",
"assets/images/1092.webp": "571cecc2a63e5061497781cd1f8dea94",
"assets/images/0919.webp": "71d7617fd201d0b5a78f33ab09bdcbb0",
"assets/images/1826.webp": "e7ac0ff1c5c085a3522a05d335f06f35",
"assets/images/1277.webp": "351737183361649dc636598bbada7cb6",
"assets/images/2230.webp": "6012840282b35f4d40dc712e9bebc0e2",
"assets/images/1774.webp": "10b1640a3f04b09fceb470609be76b97",
"assets/images/1979.webp": "8dcf789f3f655a9fb8494118f5823c38",
"assets/images/0112.webp": "82dc5650370668c29e2b4494ce6d139f",
"assets/images/0811.webp": "80ee4c90128121e572988be0e0ba13b0",
"assets/images/1187.webp": "aa290963b3f3bb2a4aeb5fd34739f7ae",
"assets/images/2251.webp": "b414af7e2f0e7117a6937733c03c6143",
"assets/images/0145.webp": "14412a612a80fa6e7a23ecfd7a381dd2",
"assets/images/2181.webp": "d56a8e875d2d6fbff100de5a3110a62a",
"assets/images/1200.webp": "60d52b358eda15358d5b65a3f9fe9550",
"assets/images/0978.webp": "4336c59b729f1d1073606732a4caf75d",
"assets/images/1542.webp": "91e3ecd4a876e4e0c7e7f4d8ed7b08f8",
"assets/images/1368.webp": "b7fdeba42b452af3a755efbf88183a9a",
"assets/images/1104.webp": "da02618f76a8f0f07ee37b5444b535cd",
"assets/images/2006.webp": "f6121d8630165685d8e3c29b6c7dd845",
"assets/images/0943.webp": "7d1c428853ce89bb20a5f5ab6e73c823",
"assets/images/1688.webp": "7c38c61a3471cd4ba0d5bb16fa1f90b2",
"assets/images/1523.webp": "754731cfddb1fe238e7e24a20b566d39",
"assets/images/1036.webp": "dbf8d5c2fde9c9c70ed32ce8d41624be",
"assets/images/1562.webp": "a757c7b672a6980c5489cd517968345b",
"assets/images/1408.webp": "59a5edef04a0624c407b60a20c6368c5",
"assets/images/1449.webp": "872ae08e6932d62306855b3f147a2ca5",
"assets/images/1465.webp": "fac72f6f571eb03f61335231f70810ac",
"assets/images/0761.webp": "473f4abe1abe9ec7269c2cdd543abc93",
"assets/images/1259.webp": "9ac174ced1299162ce64d51057e476c2",
"assets/images/0777.webp": "8e8bff44cacc4b8a3f50dfc06f06488f",
"assets/images/0665.webp": "0ef9b51eee480f2113ddfa1cc284a4a8",
"assets/images/1424.webp": "f9a0646c36ed5c8d504bbd220432f45e",
"assets/images/1998.webp": "64d0f56706a752b9e1fe95b980ee0799",
"assets/images/2064.webp": "3f4af82ada25e93a8466080b4cfdabca",
"assets/images/2290.webp": "651f8319f102bb0a5c5782253ebdeb2a",
"assets/images/1629.webp": "9a4addb6297f426cc0e29c83256a20ea",
"assets/images/2005.webp": "131f37bc2edf223f64e205348556aa03",
"assets/images/0852.webp": "ecd701f179675c843307ce1599c67f86",
"assets/images/1184.webp": "1692cb50f51b7fed4f27b90a84d406bc",
"assets/images/2317.webp": "15c47f6848697137e8e84ff3960d6d75",
"assets/images/0941.webp": "f345c60efc3f08c804202d8e3dfabf32",
"assets/images/1297.webp": "d46fe09eb93f0120d84b84fd58627057",
"assets/images/1782.webp": "a9a585b71ee3f4cb54a88c331db9c96a",
"assets/images/0849.webp": "17fd452690789c68843b008c3e5b9abe",
"assets/images/1825.webp": "942acfcfe34e5faa2855aa9e19f5ba95",
"assets/images/1576.webp": "39a61f859a0862bfa0b51a87dd6070bf",
"assets/images/0998.webp": "93e32bb0c174a137ed0953b98a10cf93",
"assets/images/1235.webp": "689d3d05515d8e8608f6b51b102b0ba0",
"assets/images/2015.webp": "f914388726d8d9dd8453b92f59cc7e4f",
"assets/images/0839.webp": "a85479cab990df9a72b1cff0c560dbc8",
"assets/images/1814.webp": "27e1a4c8e9d9d86497b181dd5f1bfa46",
"assets/images/1117.webp": "7642b743e66252fec1a19aa1aca294ac",
"assets/images/0086.webp": "53f18f0a8cbbff58a5bb7d3f697bf61d",
"assets/images/1506.webp": "4ea76e1b830e87becd21ccbbff6ddd21",
"assets/images/1984.webp": "5f24f438226ee26c53c24749fd6a97b5",
"assets/images/1087.webp": "e9f23105d69354ccdcfc980a45e5938e",
"assets/images/2185.webp": "0de83d89ba9c79ed586d5fd3f42bc1c0",
"assets/images/0157.webp": "25dc919efdeb9ad7f778de3c63da8cc4",
"assets/images/1316.webp": "31956582f629972217c9fc1857c3141c",
"assets/images/1992.webp": "ab8ada71dbba1c986f9bb3465214d60f",
"assets/images/2019.webp": "ddd29e7cdf493eeb2b584b6bdd6e082b",
"assets/images/0927.webp": "23a21240fa5882b3f6c55f255c3c1df7",
"assets/images/1463.webp": "386b0b02c9e7130e18b96572fcfb0893",
"assets/images/2023.webp": "783f009a0b0bf57e32bf9dddde4796a0",
"assets/images/1566.webp": "47bd4f6392e39deb275dbd53d1c399e2",
"assets/images/1248.webp": "633980084667299e6a9ba63d61ecbd53",
"assets/images/2167.webp": "8eabc2ef354cd7b8c890a45b59831ddf",
"assets/images/0064.webp": "aa2e038f4cf794f78fc7bc65a13e1b07",
"assets/images/1090.webp": "f83538c618cb0df7dfdc5fe5e61187a3",
"assets/images/0843.webp": "16d7dd35589270018b0de252019c8a9b",
"assets/images/0156.webp": "2b27e6ba24d687b06146e0223b78c114",
"assets/images/0678.webp": "12a8a792fe584349080fa0b8ebfbc491",
"assets/images/1985.webp": "1493310e001b056ed7d83b21a7600a17",
"assets/images/2079.webp": "1d5ddc1c345815b8e8862d10e934633f",
"assets/images/2281.webp": "371638116b4f04d72eeeb098f3b8d176",
"assets/images/0615.webp": "fea0a15bf6c34665a2d59ba8114a3411",
"assets/images/0880.webp": "a0ce61a55b1c2d3315f1b50546c139d5",
"assets/AssetManifest.json": "8f0e75856e82e02ce79ba78b1ebb75d8",
"assets/NOTICES": "3f975a7de093de56c5506515d9165cf1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
