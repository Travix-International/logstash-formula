# vim: ft=sls
# How to configure logstash
{%- from "logstash/map.jinja" import logstash with context %}

logstash_pipeline_conf:
  file.managed:
    - name: {{ logstash.filename_pipeline_conf }}
    - source: salt://logstash/files/pipeline.conf.jinja
    - user: root
    - group: root
    - mode: 0644
    - template: jinja

logstash_defaults_conf:
  file.managed:
    - name: {{ logstash.filename_defaults }}
    - source: salt://logstash/files/defaults.jinja
    - user: root
    - group: root
    - mode: 0644
    - template: jinja

logstash_jvm_options:
  file.managed:
    - name: {{ logstash.filename_jvm_options }}
    - source: salt://logstash/files/jvm.options.jinja
    - user: root
    - group: root
    - mode: 0644
    - template: jinja

logstash_logstash_yml:
  file.managed:
    - name: {{ logstash.filename_logstash_yml }}
    - source: salt://logstash/files/logstash.yml.jinja
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
