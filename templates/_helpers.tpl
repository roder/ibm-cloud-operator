{{/* vim: set filetype=mustache: */}}

{{/*
  Optional parameters for Databases for Redis
  This template is used when  
*/}}
{{- define "ibm-cloud-operator.databases-for-redis" }}
  parameters:
  - name: service-endpoints
{{/*
     this is an example where the value is not allowed to be altered 
*/}}
    value: private 
  - name: key_protect_key
    value: {{ required "a valid Key Protect key CRN is required!" .Values.redis.parameters.key_protect_key }}
  - name: members_memory_allocation_mb
    value: {{ .Values.redis.parameters.members_memory_allocation_mb }}  
  - name: members_disk_allocation_mb
    value: {{ .Values.redis.parameters.members_disk_allocation_mb }}  
  - name: members_cpu_allocation_count
    value: {{ .Values.redis.parameters.members_memory_allocation_mb }}      
{{- end }}

{{- define "ibm-cloud-operator.cloudantnosqldb" }}
  parameters:
  - name: legacyCredentials
    value: {{ .Values.cloudant.parameters.legacyCredentials }}
  {{- if .Values.cloudant.parameters.environment_crn }}
  - name: environment_crn
    value: {{ .Values.cloudant.parameters.environment_crn}}
  {{- end }}
{{- end }}



