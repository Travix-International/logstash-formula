{%- from "logstash/map.jinja" import logstash with context %}

logstash_jdk_install:
  pkg.installed:
    - name: {{ logstash.openjdk_pkg }}
    - version: {{ logstash.jdk_version }}
    - require_in:
      - pkg: {{ logstash.pkg }}
logstash_openjdk_java_alternatives:
  alternatives.set:
    - name: java
    - path: /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
logstash_openjdk_javac_alternatives:
  alternatives.set:
    - name: javac
    - path: /usr/lib/jvm/java-8-openjdk-amd64/bin/javac
