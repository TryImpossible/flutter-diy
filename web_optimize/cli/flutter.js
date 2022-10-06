// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/**
 * This script installs service_worker.js to provide PWA functionality to
 *     application. For more information, see:
 *     https://developers.google.com/web/fundamentals/primers/service-workers
 */

 if (!_flutter) {
  var _flutter = {};
}
_flutter.loader = null;

(function() {
  "use strict";
  class FlutterLoader {
    /**
     * Creates a FlutterLoader, and initializes its instance methods.
     */
    constructor() {
      // TODO: Move the below methods to "#private" once supported by all the browsers
      // we support. In the meantime, we use the "revealing module" pattern.

      // Watchdog to prevent injecting the main entrypoint multiple times.
      this._scriptLoaded = null;

      // Resolver for the pending promise returned by loadEntrypoint.
      this._didCreateEngineInitializerResolve = null;

      // Called by Flutter web.
      // Bound to `this` now, so "this" is preserved across JS <-> Flutter jumps.
      this.didCreateEngineInitializer = this._didCreateEngineInitializer.bind(this);
    }

    /**
     * Initializes the main.dart.js with/without serviceWorker.
     * @param {*} options
     * @returns a Promise that will eventually resolve with an EngineInitializer,
     * or will be rejected with the error caused by the loader.
     */
    loadEntrypoint(options) {
      const {
        entrypointUrl = "main.dart.js",
        serviceWorker,
      } = (options || {});
      return this._loadWithServiceWorker(entrypointUrl, serviceWorker);
    }

    /**
     * Resolves the promise created by loadEntrypoint.
     * Called by Flutter through the public `didCreateEngineInitializer` method,
     * which is bound to the correct instance of the FlutterLoader on the page.
     * @param {*} engineInitializer
     */
    _didCreateEngineInitializer(engineInitializer) {
      if (typeof this._didCreateEngineInitializerResolve != "function") {
        console.warn("Do not call didCreateEngineInitializer by hand. Start with loadEntrypoint instead.");
      }
      this._didCreateEngineInitializerResolve(engineInitializer);
      // Remove the public method after it's done, so Flutter Web can hot restart.
      delete this.didCreateEngineInitializer;
    }

    _downloadSplitJs(url){
      return new Promise((resolve, reject)=>{
        const xhr = new XMLHttpRequest();
        xhr.open("get", url, true);
        xhr.onreadystatechange = () => {
            if (xhr.readyState == 4) {
                if (xhr.status >= 200 && xhr.status < 300 || xhr.status == 304){
                  resolve(xhr.responseText);
                }
            }
        };
        xhr.onerror = reject;
        xhr.ontimeout = reject;
        xhr.send();
      })
    }

    _retryCount = 0;
    _loadEntrypoint(entrypointUrl) {
      if (!this._scriptLoaded) {
        this._scriptLoaded = new Promise((resolve, reject) => {
          const promises = Object.keys(jsManifest).filter(key => /main.dart_\d.js/g.test(key)).sort().map(key => `${assetBase}${jsManifest[key]}`).map(this._downloadSplitJs);
          Promise.all(promises).then((values)=>{
            const contents = values.join("");
            const script = document.createElement("script");
            script.text = contents;
            script.type = "text/javascript";

            this._didCreateEngineInitializerResolve = resolve;
            script.addEventListener("error", reject);
            document.body.appendChild(script);
          }).catch(()=>{
            // console.error("main.dart.js download fail，refresh and try again");

            // retry again
            if (++this._retryCount > 3) {
              const element = document.createElement("a");
              element.href = "javascript:location.reload()";
              element.style.textAlign = "center";
              element.style.margin = "50px auto";
              element.style.display = "block";
              element.style.color = "#f89800";
              element.innerText = "加载失败，点击重新请求页面";
              document.body.appendChild(a);
            } else {
              this._loadEntrypoint(entrypointUrl);
            }
          });

//          let scriptTag = document.createElement("script");
//          scriptTag.src = entrypointUrl;
//          scriptTag.type = "application/javascript";
//          // Cache the resolve, so it can be called from Flutter.
//          // Note: Flutter hot restart doesn't re-create this promise, so this
//          // can only be called once. Instead, we need to model this as a stream
//          // of `engineCreated` events coming from Flutter that are handled by JS.
//          this._didCreateEngineInitializerResolve = resolve;
//          scriptTag.addEventListener("error", reject);
//          document.body.append(scriptTag);
        });
      }

      return this._scriptLoaded;
    }

    _waitForServiceWorkerActivation(serviceWorker, entrypointUrl) {
      if (!serviceWorker || serviceWorker.state == "activated") {
        if (!serviceWorker) {
          console.warn("Cannot activate a null service worker. Falling back to plain <script> tag.");
        } else {
          console.debug("Service worker already active.");
        }
        return this._loadEntrypoint(entrypointUrl);
      }
      return new Promise((resolve, _) => {
        serviceWorker.addEventListener("statechange", () => {
          if (serviceWorker.state == "activated") {
            console.debug("Installed new service worker.");
            resolve(this._loadEntrypoint(entrypointUrl));
          }
        });
      });
    }

    _loadWithServiceWorker(entrypointUrl, serviceWorkerOptions) {
      if (!("serviceWorker" in navigator) || serviceWorkerOptions == null) {
        console.warn("Service worker not supported (or configured). Falling back to plain <script> tag.", serviceWorkerOptions);
        return this._loadEntrypoint(entrypointUrl);
      }

      const {
        serviceWorkerVersion,
        timeoutMillis = 4000,
      } = serviceWorkerOptions;

      let serviceWorkerUrl = "flutter_service_worker.js?v=" + serviceWorkerVersion;
      let loader = navigator.serviceWorker.register(serviceWorkerUrl)
          .then((reg) => {
            if (!reg.active && (reg.installing || reg.waiting)) {
              // No active web worker and we have installed or are installing
              // one for the first time. Simply wait for it to activate.
              let sw = reg.installing || reg.waiting;
              return this._waitForServiceWorkerActivation(sw, entrypointUrl);
            } else if (!reg.active.scriptURL.endsWith(serviceWorkerVersion)) {
              // When the app updates the serviceWorkerVersion changes, so we
              // need to ask the service worker to update.
              console.debug("New service worker available.");
              return reg.update().then((reg) => {
                console.debug("Service worker updated.");
                let sw = reg.installing || reg.waiting || reg.active;
                return this._waitForServiceWorkerActivation(sw, entrypointUrl);
              });
            } else {
              // Existing service worker is still good.
              console.debug("Loading app from service worker.");
              return this._loadEntrypoint(entrypointUrl);
            }
          });

      // Timeout race promise
      let timeout;
      if (timeoutMillis > 0) {
        timeout = new Promise((resolve, _) => {
          setTimeout(() => {
            if (!this._scriptLoaded) {
              console.warn("Failed to load app from service worker. Falling back to plain <script> tag.");
              resolve(this._loadEntrypoint(entrypointUrl));
            }
          }, timeoutMillis);
        });
      }

      return Promise.race([loader, timeout]);
    }
  }

  _flutter.loader = new FlutterLoader();
}());
