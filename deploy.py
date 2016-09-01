import yaml
import os
import subprocess

requires_path = './requires.yaml'


def deploy():
    assert os.path.exists(requires_path), "Ensure {} exists. Exiting.".format(requires_path)
    requires_list = yaml.load(open(requires_path).read())

    for module, url in requires_list.iteritems():
        subprocess.call(['git', 'clone', url, '/etc/puppet/modules/{}'.format(module)])

    site_file = """
node default {
    include env
}
"""
    site_path = '/etc/puppet/manifests/site.pp'
    with open(site_path, 'w') as f:
        f.write(site_file)

    subprocess.call(['puppet', 'apply', site_path])

if __name__ == '__main__':
    deploy()
