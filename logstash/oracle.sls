{# TODO: Add logic to install the most current JCE policy JARs #}
logstash_java_repo:
{% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - ppa: webupd8team/java
{% elif grains['os'] == 'Debian' %}
  pkgrepo.managed:
    - humanname: webup8team
    - name: deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main
    - dist: precise
    - file: /etc/apt/sources.list.d/java.list
    - keyid: EEA14886
    - keyserver: keyserver.ubuntu.com
{% endif %}

logstash_java_pkg:
  pkg.installed:
    - name: {{ logstash.oraclejdk_pkg }}
    - require:
      - pkgrepo: logstash_java_repo
  debconf.set:
    - data:
        'shared/accepted-oracle-license-v1-1': {'type': 'boolean', 'value': True}
    - require_in:
      - pkg: logstash_java_pkg
