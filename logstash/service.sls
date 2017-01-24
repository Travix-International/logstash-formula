# vim: ft=sls
# Manage service for service logstash
{%- from "logstash/map.jinja" import logstash with context %}

logstash_service:
  service.running:
    - name: logstash
    - enable: True
    - watch:
        - file: logstash_pipeline_conf
        - file: logstash_jvm_options
        - file: logstash_logstash_yml
