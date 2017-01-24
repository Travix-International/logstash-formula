# vim: ft=sls
# Init logstash
{%- from "logstash/map.jinja" import logstash with context %}
{# Below is an example of having a toggle for the state #}

{% if logstash.enabled %}
include:
  - logstash.install
  - logstash.config
  - logstash.service
  - logstash.repository
{% else %}
'logstash-formula disabled':
  test.succeed_without_changes
{% endif %}

