# vim: ft=sls
# How to install logstash
{%- from "logstash/map.jinja" import logstash with context %}
logstash_repo_key:
  cmd.run:
    - name: wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
    - unless: apt-key list | grep -q 'Elasticsearch (Elasticsearch Signing Key)'

logstash_repo:
  pkgrepo.managed:
    - humanname: Elastic Repository
    - name: deb https://artifacts.elastic.co/packages/5.x/apt stable main
    - file: {{ logstash.filename_repo }}
    - require:
      - cmd: logstash_repo_key
