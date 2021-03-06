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

