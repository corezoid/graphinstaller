{{/*
Expand the name of the chart.
*/}}
{{- define "graphinstaller.name" -}}
{{- default .Chart.Name .Values.global.graphinstaller.graphinstaller.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "graphinstaller.fullname" -}}
{{- if .Values.global.graphinstaller.graphinstaller.fullnameOverride }}
{{- .Values.global.graphinstaller.graphinstaller.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.global.graphinstaller.graphinstaller.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "graphinstaller.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "graphinstaller.labels" -}}
helm.sh/chart: {{ include "graphinstaller.chart" . }}
{{ include "graphinstaller.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "graphinstaller.selectorLabels" -}}
app.kubernetes.io/name: {{ include "graphinstaller.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "graphinstaller.serviceAccountName" -}}
{{- if .Values.global.graphinstaller.graphinstaller.serviceAccount.create }}
{{- default (include "graphinstaller.fullname" .) .Values.global.graphinstaller.graphinstaller.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.global.graphinstaller.graphinstaller.serviceAccount.name }}
{{- end }}
{{- end }}
