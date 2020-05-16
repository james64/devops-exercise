# For external links use url before reverse proxe...
external_url 'https://gitlab.dubovsky.devops.klikuj.cz/'

# ...but accept http connection from traefik
letsencrypt['enable'] = false
nginx['listen_port'] = 80

gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password')
