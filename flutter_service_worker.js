'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "4470660ae2fbf8266572535529166442",
"/": "4470660ae2fbf8266572535529166442",
"main.dart.js": "ba37e4eca58e4899bc22d03b001accb2",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e903f8c2dac822a4d3fc332ae9c3b575",
"assets/LICENSE": "147db57d76786e64b875558ab57a9ee0",
"assets/AssetManifest.json": "0141cacc56c0bdaca37b50df30f1b902",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/fearful.png": "fc9ad34af3c04c82c85ca3aed2707b63",
"assets/assets/happy.png": "128a56553330d0137f882a46c41597a0",
"assets/assets/neutral.png": "0ec38c1e27499c46c1a5d86a1bbd4e7e",
"assets/assets/login.png": "82c35a2c4bf5b3e27c12e12d73011cc1",
"assets/assets/sad.png": "ae0f85c6926536ba4e3d2482a040bcb2",
"assets/assets/surprised.png": "8c9919bcb609c32bcb08d8b650425955",
"assets/assets/angry.png": "07d2ad54228ee47b114ac80a88eb1dc2",
"assets/assets/coronavirus.png": "e9f8011a4a05fc8b75a6da98db6edf90",
"assets/assets/linechart.png": "5ac7396873b73cd69bd44a7ce895dc9a",
"assets/assets/patient.jpg": "99aca2982af79f87dbdd22b92af077d0",
"assets/assets/doctorbackground.png": "399dd4a4faf398141d7ec2353c5ee2a3",
"assets/assets/disgusted.png": "9fdc49de3028d29a8d16015828e68dea"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
