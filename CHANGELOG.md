# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Chart 1.0.5 [GraphInstaller 1.1.1] - 2024-06-26
### Helm changes
- Applications versions:
    - graphinstaller - 1.1.1
- Add application port expose

## Chart 1.0.4 [GraphInstaller 1.1.0] - 2024-06-26
### Helm changes
- Applications versions:
    - graphinstaller - 1.1.0

## Chart 1.0.3 [GraphInstaller 1.0.0] - 2024-06-20
### Helm changes
- Changes for imagePullSecrets creation
```
      {{- if .Values.global.imagePullSecrets }}
      imagePullSecrets:
      {{- range $pullSecret := .Values.global.imagePullSecrets }}
        - name: {{ $pullSecret }}
      {{- end }}
      {{- end }}
```

## Chart 1.0.2 [GraphInstaller 1.0.0] - 2024-06-17
### Helm changes
- Switch to `docker-hub.middleware.biz/simulator/alpine:3.20` for `initContainers`

## Chart 1.0.1 [GraphInstaller 1.0.0] - 2024-06-14
### Helm changes
- Add initWaitContainer for resolve `database` host
- Add initWaitContainer for check access to `database` host and port

## Chart 1.0.0 [GraphInstaller 1.0.0] - 2024-06-10
### Helm changes
- New Chart version
