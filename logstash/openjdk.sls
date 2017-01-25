logstash_openjdk_install:
  pkg.installed:
    - name: {{ logstash.openjdk_pkg }}
    - refresh: true
