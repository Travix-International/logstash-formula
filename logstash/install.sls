# vim: ft=sls
# How to install logstash
{%- from "logstash/map.jinja" import logstash with context %}

logstash_pkg:
  pkg.installed:
    - name: {{ logstash.pkg }}
    - require:
      - pkgrepo: logstash_repo

logstash_java_pkg:
  pkg.installed:
    - name: {{ logstash.java_pkg }}
