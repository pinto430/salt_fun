{% from "cassandra/map.jinja" import cassandra with context %}

cassandra:
  pkg.installed:
    - name: {{ cassandra.pkg }}

  service.running:
    - name: cassandra
    - enable: True
    - require:
      - pkg: cassandra

  pkgrepo.managed:
    - humanname: Cassandra
    - name: deb http://www.apache.org/dist/cassandra/debian {{ cassandra.series }} main
    - file: /etc/apt/sources.list.d/cassandra.list
    - keyid: 0353B12C
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: cassandra
