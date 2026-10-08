// Service Worker - ShotQu Pra-Produksi Film PWA
// Cache name: bump this version whenever core files are modified
const C = 'shotqu-v2.7.0';

const ASSETS = [
  './',
  './index.html',
  './landing.html',
  './login.html',
  './manifest.json',
  './icon.svg',
  './logo.png'
];

self.addEventListener('install', (e) => {
  e.waitUntil(
    caches.open(C).then((cache) => {
      return cache.addAll(ASSETS);
    }).then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.map((key) => {
          if (key !== C) {
            return caches.delete(key);
          }
        })
      );
    }).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (e) => {
  // Biarkan request non-GET dan API langsung ke jaringan / server XAMPP
  if (e.request.method !== 'GET') return;
  if (e.request.url.indexOf('/api/') !== -1) return;

  e.respondWith(
    caches.match(e.request).then((cachedResponse) => {
      if (cachedResponse) {
        return cachedResponse;
      }
      return fetch(e.request).then((networkResponse) => {
        // Cache new successful GET requests on the fly if same-origin
        if (networkResponse && networkResponse.status === 200 && e.request.url.startsWith(self.location.origin)) {
          const clone = networkResponse.clone();
          caches.open(C).then((cache) => cache.put(e.request, clone));
        }
        return networkResponse;
      }).catch(() => {
        // Fallback for HTML navigation
        if (e.request.mode === 'navigate') {
          return caches.match('./index.html');
        }
      });
    })
  );
});
