{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "serviceName" -}}
{{- if .Values.serviceName -}}
{{- .Values.serviceName -}}
{{- else -}}
{{- template "fullname" . -}}
{{- end -}}
{{- end -}}