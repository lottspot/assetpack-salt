{% from '${project_name}/init.sls' import ${project_name} %}

${project_name}_install:
  pkg.installed:
    - name: systemd
