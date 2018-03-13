{% import_yaml '${project_name}/defaults.yml' as defaults %}
{% set ${project_name} = salt['pillar.get']('${project_name}', default=defaults, merge=True) %}

include:
  - ${project_name}.install
  - ${project_name}.configure
  - ${project_name}.service
