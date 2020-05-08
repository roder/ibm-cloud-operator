{{ define "ico.cloudantnosqldb.spec" }}
{{- if .parameters }}
parameters:
{{- range $key, $val := .parameters -}}
  {{- if and (eq $key "service_endpoints") (ne (toString $val) "private" )}}
  {{fail "service_endpoints must be set to 'private'."}}
  {{- else if eq $key "key_protect_key" }}
  - name: {{ $key }}
    value: {{ $val | quote }}
  {{- else }}
  - name: {{ $key }}
    value: {{ $val }}
  {{- end }}
  {{- end }}
{{- end }}
{{- if .tags }}
tags:
{{- range .tags }}
  - {{ . }}
{{- end }}
{{- end }}
{{- end }}
