# For external links use url before reverse proxe...
external_url 'https://gitlab.dubovsky.devops.klikuj.cz/'

gitlab_rails['trusted_proxies'] = [ '64.227.123.223', '161.35.79.109', '64.227.123.209' ]

# ...but accept http connection from traefik
nginx['listen_port'] = 80
nginx['listen_https'] = false
nginx['proxy_set_headers'] = {
    "X-Forwarded-Proto" => "http"
}

gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password')
