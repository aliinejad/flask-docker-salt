
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
