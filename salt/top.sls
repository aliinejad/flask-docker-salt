---
install_nginx:
 pkg.installed:
  - name: nginx


start_service:
 service.running:
  - name: nginx
  - enable: True
  - require:
    - pkg: nginx 


nginx_reverseproxy_config:
  file.managed:
  - name: /etc/nginx/conf.d/reverse.conf
  - contents: |
       server {
       listen 80;
       server_name                 flask.com;


        location / {
        proxy_pass              http://127.0.0.1:5000;
        }
        }


change_html_file:
  file.managed:
  - name: /var/www/html/index.nginx-debian.html
  - contents: |
             hi,im mohammad


restart_service:
 service.running:
  - name: nginx
  - reload: True 


Drop_port_5000:
  iptables.insert:
    - position: 1
    - table: filter
    - chain: INPUT
    - jump: DROP
    - dport: 5000
    - protocol: tcp
    - save: True


ACCEOT_localhost_for_5000:
  iptables.insert:
    - position: 1
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - source: '127.0.0.1'
    - dport: 5000
    - protocol: tcp
    - save: True
 

run_flask_container:
  docker_container.run:
  - image: flask
  - name: flask
  - bg: True
  - replace: True
  - force: True
  - port_bindings:
    - 5000:5000
  - require:
    - pkg: nginx
