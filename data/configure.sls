{% from '${project_name}/init.sls' import ${project_name}  %}

${project_name}_configure:
  file.exists:
    - name: /etc/systemd/system.conf
