# devops-exercise

# DNS zone configuration
* A domain IP1
* A domain IP2
* A domain IP3
* CNAME *.domain domain

## How to

1. Configure passwordless sudo on all nodes
 * Mainly to allow gitlab CI run cmds there
1. Run `init-servers.sh` to install docker etc on servers
1. Put DigitalOcean token into `/mnt/nfs-data/digitalocean` textfile
1. Upload these to chosen folder on swarm manager node
 * `docker-compose.yml`
 * `gitlab.rb`
 * `gitlab_root_password` - choose the content
 * `gitlab-runner/01_run_gitlab_runner.sh`
 * `gitlab-runner/02_register_gitlab_runner.sh`
1. In the folder run `sudo docker stack deploy -c docker-compose.yml kvp`
1. Setup Gitlab Runner
 1. Obtain registration token from Gitlab admin area
 1. Run `sudo ./01_run_gitlab_runner.sh`
 1. Run `sudo ./02_register_gitlab_runner.sh <token>`
1. Kong
 1. Manually create a repository and populate it by files from `kong` directory
  * Including `.gitlab-ci.yml`
 1. Passwordless ssh key pair
  * To allow gitlab pipeline non-interactive cmds execution
  * Create new pair
  * Add public part to authorized keys on chosen node
 1. In repo -> Settings -> CI/CD -> Variables add
  * SSH_NODE - ip of a node chosen above
  * SSH_PRIVATE_KEY - result of `cat <private_ssh_key_file> | base64` - set protected
 1. Manually run `deploy` pipeline in repo

## Todo
* basic auth
  * curl directly to kong works
  * but it is not coming through traefik for some reason
* nfs
  * I used it so that traefik has a place to store Let's Encrypt certificate and access it from different node next time
  * Try replacing by [Docker volumes](https://docs.docker.com/storage/volumes/) maybe
* Gitlab rootpassword from file was not effective
  * Let gitlab reinitialize itself if it helps
