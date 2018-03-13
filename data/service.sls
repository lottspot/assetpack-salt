{% from '${project_name}/init.sls' import ${project_name}  %}

${project_name}_service:
  service.running:
    - name: systemd-journald
    - enable: true
