Azan Watch — Package
=====================

Contains:
- azan-watch.html       : single-file web app (Urdu) with prayer times, Hijri/Jalali dates, color controls, PWA generator.
- package.json, main.js, preload.js : Electron scaffold. Run `npm install` then `npm start` to run locally.
- manifest.json, service-worker.js, icon.svg : PWA helper files (place on your HTTPS site root).
- README.md             : instructions (this file).

How to use:
1) PWA:
   - Upload azan-watch.html, manifest.json, service-worker.js and icon files to your website (HTTPS).
   - Add a <link rel="manifest" href="/manifest.json"> in the HTML head if serving from webroot.
   - Register the service worker from the HTML or let the in-page generator download it.

2) Electron (Desktop app):
   - Install Node.js and npm.
   - In the package root, run:
     npm install
     npm start
   - To package into distributables, install electron-packager or electron-builder and run the packaging script.

3) Android (TWA/Capacitor):
   - This package does not include a compiled APK. Use the azan-watch.html as the web content and follow Capacitor or TWA guides:
     - Capacitor: create a Capacitor app, copy azan-watch.html into the 'www' folder, then build for Android.
     - TWA: host the site on HTTPS and use Bubblewrap/TWA to create an Android wrapper.

Notes:
- For automatic Azan audio, upload your azan mp3 via the UI or place azan.mp3 alongside the HTML and adapt the code.
- If you want, I can build the actual desktop installers (Windows EXE) or an APK for you — for that I will need either a build server or your permission to produce signed packages; tell me which and I will prepare the build artifacts next.


## Improvements added (automatically)
- Included `azan_alert.wav`: a short non-voice melodic alert (non-copyright) you can use as default Azan sound.
- Added `icon-192.png` and `icon-512.png` for PWA manifest icons.
- Added GitHub Actions workflow `.github/workflows/build-twa.yml` to help build a TWA/APK using Bubblewrap on GitHub Actions (requires repo hosting & secrets).

If you'd like, I can also convert `azan_alert.wav` to MP3 and embed it directly into `azan-watch.html` (or replace it with a voice azan if you provide the audio file).
# azan_watch_package_with_mp3_testbutton
