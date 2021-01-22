#!/usr/bin/env python3

import jinja2
import json
import os

template_file = "conf.template"
json_parameter_file = "conf.json"

# read the contents from the JSON files
print("Read JSON parameter file...")
apps = json.load(open(json_parameter_file))

# next we need to create the central Jinja2 environment and we will load
# the Jinja2 template file (the two parameters ensure a clean output in the
# configuration file)
print("Create Jinja2 environment...")
env = jinja2.Environment(loader=jinja2.FileSystemLoader(searchpath="."),
                         trim_blocks=True,
                         lstrip_blocks=True)
template = env.get_template(template_file)

# now create the templates
print("Create templates...")
for app in apps:
    path = app['app'] + ".conf"
    if "disabled" in app:
        if os.path.exists(path):
            os.remove(path)
            print("Remove configuration '%s'..." % path)
    else:
        result = template.render(app)
        f = open("%s.conf" % app["app"], "w")
        f.write(result)
        f.close()
        print("Configuration '%s' created..." % path)
print("DONE")
