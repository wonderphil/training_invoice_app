### Credential File Layout

```ymal
secret_key_base:

development:
  database:
    pass: rails
  amazon:
    client_id:
    client_secret:
  twitter:
    api_key: 
    api_secret:
  google:
    client_id:
    client_secret:
    recaptcha_site_key:
    recaptcha_secret_key:
  facebook:
    facebook_key:
    facebook_secret:
  smtp:
    username: someone@gmail.com
    password: anything
  redis:
    password: yourpassword


test:
  database:
    pass: rails
  amazon:
    client_id:
    client_secret:
  twitter:
    api_key:
    api_secret:
  google:
    client_id:
    client_secret:
    recaptcha_site_key:
    recaptcha_secret_key:
  facebook:
    facebook_key:
    facebook_secret:
  smtp:
    username: someone@gmail.com
    password: anything
  redis:
    password: yourpassword

production:
  database:
    pass: somethingbetterthenthis!!!
  amazon:
    client_id: 
    client_secret:
  twitter:
    api_key: 
    api_secret:
  google:
    client_id:
    client_secret:
    recaptcha_site_key:
    recaptcha_secret_key:
  facebook:
    facebook_key:
    facebook_secret:
  smtp:
    username: someone@gmail.com
    password: anything
  redis:
    password: yourpassword
```

---

## Helpful commands

### Docker Commands

---

#### SSH onto container

`docker exec -it base-app_web_1 /bin/bash`

#### How to Build web image

`docker build -t base_app_web .`

Docker build **won't** run the app startup script!

#### Start Dev Environment

`docker-compose -f docker-compose-dev.yml up`

#### Push image to local repo

```bash
docker login -u docker_reg https://registry.sonictexture.co.uk
docker tag base_app_web:latest registry.sonictexture.co.uk/base_app_web
docker push registry.sonictexture.co.uk/base_app_web
```


#### Push image to repo in AWS

1. `aws ecr get-login --no-include-email --region <region> --profile <environment>` - run output
2. `docker tag base-app:latest <repo>`
3. `docker push <repo>`

### Deploy to AWS ECS

`ecs-cli compose --project-name <name> --file docker-compose.yml service up --cluster <ecs cluster> --target-group-arn <target group ARN> --container-name <container name> --container-port <container port> --aws-profile <profile name> --region <region>`

### Create Volumes

`docker volume create --name base-app-postgres`

### Rails Commands

---

#### Edit credentials files

`rails credentials:edit`
