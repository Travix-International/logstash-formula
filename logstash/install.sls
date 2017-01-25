# vim: ft=sls
# How to install logstash
{%- from "logstash/map.jinja" import logstash with context %}
include:
  - .{{ logstash.jdk_vendor }}

logstash_pkg:
  pkg.installed:
    - name: {{ logstash.pkg }}
    - require:
      - pkgrepo: logstash_repo
      - pkg: logstash_java_pkg
