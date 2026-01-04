{{flutter_js}}
{{flutter_build_config}}

const loading = document.createElement('div');
document.body.appendChild(loading);
loading.textContent = "Loading Entrypoint...";
_flutter.loader.load({
  config: {'canvasKitBaseUrl': 'canvaskit/'},
  serviceWorkerSettings: {
      serviceWorkerVersion: {{flutter_service_worker_version}},
  },
  onEntrypointLoaded: async function(engineInitializer) {
      loading.textContent = "Initializing engine...";
      const appRunner = await engineInitializer.initializeEngine({'fontFallbackBaseUrl': 'https://fonts.gstatic.cn/s/'});
      loading.textContent = "Running app...";
      await appRunner.runApp();
   }
});
