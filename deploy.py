import yaml
import os
import subprocess

requires_path = './requires.yaml'
tmp_path = '/tmp/env'


def deploy():
    assert os.path.exists(requires_path), "Ensure {} exists. Exiting.".format(requires_path)
    assert os.path.exists(tmp_path), "Ensure {} exists. Exiting.".format(tmp_path)
    assert os.getuid() == 0, "You must be root user to perform deploy."

    subprocess.call(['sudo', 'apt-get', 'install', '-y', 'puppet'])
    requires_list = yaml.load(open(requires_path).read())

    for module, url in requires_list.iteritems():
        subprocess.call(['git', 'clone', url, '/etc/puppet/modules/{}'.format(module)])

    subprocess.call(['cp', '-R', '/tmp/env', '/etc/puppet/modules'])

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
