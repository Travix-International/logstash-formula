# vim: ft=sls
# How to install logstash
{%- from "logstash/map.jinja" import logstash with context %}
include:
  - .{{ logstash.jdk_vendor }}

logstash_pkg:
  pkg.installed:
    - name: {{ logstash.pkg }}
    - version: {{ logstash.version }}
    - require:
      - pkgrepo: logstash_repo
