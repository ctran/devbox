---
title: Caddy
---

Caddy can be configured automatically using Devbox's built in Caddy plugin. This plugin will activate automatically when you install Caddy using `devbox add caddy`

[**Example Repo**](https://github.com/jetpack-io/devbox-examples/tree/main/servers/caddy)

### Adding Caddy to your Shell

Run `devbox add caddy`, or add the following to your `devbox.json`

```json
  "packages": [
    "caddy"
  ]
```

## Caddy Plugin Details

The Caddy plugin will automatically create the following configuration when you install Caddy with `devbox add`

### Services
* caddy

Use `devbox services start|stop caddy` to start and stop httpd in the background

### Helper Files
The following helper files will be created in your project directory:

* {PROJECT_DIR}/devbox.d/caddy/Caddyfile
* {PROJECT_DIR}/devbox.d/web/index.html

Note that by default, Caddy is configured with `./devbox.d/web` as the root. To change this, you should modify the default `./devbox.d/caddy/Caddyfile` or change the `CADDY_ROOT_DIR` environment variable

### Environment Variables
```bash
* CADDY_CONFIG={PROJECT_DIR}/devbox.d/caddy/Caddyfile
* CADDY_LOG_DIR={PROJECT_DIR}/.devbox/virtenv/caddy/log
* CADDY_ROOT_DIR={PROJECT_DIR}/devbox.d/web
```

### Notes

You can customize the config used by the caddy service by modifying the Caddyfile in devbox.d/caddy, or by changing the CADDY_CONFIG environment variable to point to a custom config. The custom config must be either JSON or Caddyfile format.