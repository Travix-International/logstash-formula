{# TODO: Add logic to install the most current JCE policy JARs #}
logstash_jdk_repo:
  pkgrepo.managed:
    - ppa: webupd8team/java

logstash_jdk_pkg:
  pkg.installed:
    - name: {{ logstash.oraclejdk_pkg }}
    - require:
      - pkgrepo: logstash_jdk_repo
  debconf.set:
    - data:
        'shared/accepted-oracle-license-v1-1': {'type': 'boolean', 'value': True}
    - require_in:
      - pkg: logstash_jdk_pkg
