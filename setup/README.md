## Install Gradle 5.4
- Requires JDK 8 or higher
 - [https://jdk.java.net/11](https://jdk.java.net/11)
 - [https://www.oracle.com/technetwork/java/javase/downloads/index.html](https://www.oracle.com/technetwork/java/javase/downloads/index.html)
 - [https://adoptopenjdk.net](https://adoptopenjdk.net)
- Install Gradle using several options
 - [https://gradle.org/install](https://gradle.org/install)
  - `brew install gradle`  # or other installer
  - manually
    - `curl https://services.gradle.org/distributions/gradle-5.4-all.zip`
    - if needed, extract zip or tar.gz appropriately
    - add Gradle bin directory to global PATH
 - verify gradle 
  - gradle -version
  - gradle tasks

## Setup a Simulated CI Environment

NOTE:  This is not secured, please read how to secure your CI pipeline based on the tools you are installing and their best practices.

#### Configure local environment
- This uses docker swarm mode (least resources needed for laptops).  
  To configure just run `docker swarm init`
- Edit /etc/hosts and add the following  
<code>127.0.0.1 nexus  
127.0.0.1 jenkins  
127.0.0.1 gitea  
</code>
- Add to Docker daemon.json file the following (add comma appropriately):
 <code>
  "insecure-registries" : ["nexus:4187","nexus:4188","nexus:4189"]
 </code>

#### URLs to Services
- Jenkins: [http://jenkins:4080](http://jenkins:4080)
- Nexus: [http://nexus:4181](http://nexus:4181) 
- Gitea: [http://gitea:4280](http://gitea:4280)  
         ssh -p 4222 developer@gitea 


#### Gitea Setup
- update the following during installation (or after install manually at /data/gitea/conf/app.ini then killall -1 gitea):
 - SSH_DOMAIN       = gitea
 - ROOT_URL         = http://gitea:4280/
 - DOMAIN           = gitea
- SSH port is not correct via clipboard option, so just use the http url for repository

#### Nexus Setup
- Docker has to be configured, I like to have a proxy, host, and group to access both
- Add Docker Proxy (docker-proxy) [useful for proxied environment and you want to control access to repositories]
 - point to remote storage [https://registry.hub.docker.com](https://registry.hub.docker.com)
 - select Online checked
 - use Repository Connectors of HTTP and port 4187
 - use Force Basic authentication checked
 - use Enable Docker V1 API
 - use default blob store
 - Negative Cache Not Found TTL (minutes): 5
- Add Docker Host (docker-hosted) [for internal images only]
 - select Online checked
 - use Repository Connectors of HTTP and port 4188
 - use Force Basic authentication checked
 - use Enable Docker V1 API
 - use default blob store
 - use Deployment Policy:  allow redeploy
- Add Docker Group (docker-group) [useful for general clients to get both internal and external images]
 - select Online checked
 - use Repository Connectors of HTTP and port 4189
 - use Force Basic authentication checked
 - use Enable Docker V1 API
 - use default blob store
 - add Group members:  docker-hosted, docker-proxy
- Create Local User
 - Username: nexus
 - Status: active
 - Roles:  nx-admin, nx-anonymous
- From OS Shell, run the following using the nexus username and password above  
<code>
    docker login nexus:4187
    docker login nexus:4188
    docker login nexus:4189
</code>

#### Jenkins Setup
- When installing, setup plugins to include the pipeline, git, and anything else you want
- [http://jenkins:4080/configure](http://jenkins:4080/configure)
 - Jenkins URL:  [http://jenkins:4080/](http://jenkins:4080/)
- 

