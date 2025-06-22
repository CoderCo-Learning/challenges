#!/usr/bin/env python3

import http.server, socketserver, os

PORT = int(os.getenv("PORT", 8080))
LOGFILE = os.getenv("LOG_PATH", "/var/log/coderco-app.log")

Handler = http.server.SimpleHTTPRequestHandler

with open(LOGFILE, "a") as log:
    log.write(f"Starting app on port {PORT}\n")

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Serving on port {PORT}")
    httpd.serve_forever()
