## About the image
This image is based on alpine:3.8 then install `openssl`, `curl`, `zip`, `sshpass`, `git` and `rsync`.

## How to use
- Add before_script into your gitlab-ci.yml (your deploy job)
- Add private_key that can use to access to server into gitlab project variable calls SSH_PRIVATE_KEY

```
before_script:
    - eval $(ssh-agent -s)
    - echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
```

## Example

```
 before_script:
    - eval $(ssh-agent -s)
    - echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
  script:
    - ssh deploy@{{ SERVER_DOMAIN_NAME }} "cd {{ PROJECT_PATH }} && git checkout . && git pull && exit"
```

```
- sshpass -p $SSH_PASSWORD ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST "cd $SSH_FOLDER  && git checkout . && git pull && exit"
```
