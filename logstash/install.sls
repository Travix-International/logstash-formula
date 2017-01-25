# vim: ft=sls
# How to install logstash
{%- from "logstash/map.jinja" import logstash with context %}
include:
  - {{ logstash.java_vendor }}

logstash_pkg:
  pkg.installed:
    - name: {{ logstash.pkg }}
    - require:
      - pkgrepo: logstash_repo
      - pkg: logstash_java_pkg

logstash_java_pkg:
  pkg.installed:
    - name: {{ logstash.java_pkg }}
