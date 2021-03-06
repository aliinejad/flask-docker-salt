
Drop_port_5000:
  iptables.insert:
    - position: 1
    - table: filter
    - chain: INPUT
    - jump: DROP
    - dport: 5000
    - protocol: tcp
    - save: True


ACCEPT_localhost_for_5000:
  iptables.insert:
    - position: 1
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - source: '127.0.0.1'
    - dport: 5000
    - protocol: tcp
    - save: True
 
