# WP-Docker
This is the template for a new containerized wordpress project. It is intended for use in local development, but the beauty of containers is that we can dev in an environment that mirrors our production environment. That said, the instructions that follow are only for local dev:

## How to use this template

Create your local dev project folder wherever you usually do. This is probably going to mirror the name of the project or client you're dev'ing for, but it doesn't have to.

`mkdir my-new-wp-project`

Now cd into your new directory

`cd my-new-wp-project`

Now clone this projects's files into the directory you're sitting in:

`git clone https://github.com/sharkness/wp-docker.git .`

*Note: The '.' following the url will drop the files from this project into the directory you're sitting in. If you forget the '.' git clone will create a new directory named `/wp-docker` inside of the one you're in.*

Your project should now look like this:

```
my-new-project
├── .gitignore
├── Dockerfile
├── Dockerfile-alipine
├── README.md
├── docker-compose-local.yml
├── travis.yml
└── uploads.ini
```

### Fire up your docker container

From your project dir `my-new-project`

`docker-compose -f docker-compose-local.yml up -d`

This will build your project. You'll now have a new directory named `wordpress-data` in your project. Your container is now running. It will remain running in the background (because of the -d switch) until you bring it down: `docker-compose -f docker-compose-local.yml down`

### Complete your WordPress install
If you have dnsmasq configured locally or your tld is defined in your `hosts` file, you can use your project name dot your local develop tld of choice. ie. `my-new-project.shark`  Otherwise, go to (`localhost`) in your browser and you'll see the WordPress install screen.

## Useful docker commands:

**To get a shell on your wordpress container:**

`docker-compose -f docker-compose-local.yml exec wordpress bash`

*Note that in this command, "wordpress" comes from the name we gave the service in our docker compose file, and "bash" is the cmd we want to exec on it*

**To jump into your mysql container's command line interface:**

`docker-compose -f docker-compose-local.yml exec db mysql -uroot -p`

*Note that in this command, "db" comes from the name we gave the service in our docker compose file, and "mysql -uroot -p" is the cmd we want to exec on the container*

**Bring your project up:**

`docker-compose -f docker-compose-local.yml up -d`

**Bring your project down**

`docker-compose -f docker-compose-local.yml down`

### Manage the node container (for gulp, npm install, etc)

The usefulness of the additional node container comes from the fact that we want to make sure we can always access the necessary version of python. This is necessary when using the gulpfile attached to the _underscores framework, as well as our BS5 fork named _bootstrapped. 

You should run this container from within your theme's directory at `my-new-project/wordpress-data/wp-content/themes/_bootstrapped

**Get your bash shell**

`docker run --rm -ti -v $(pwd):/var/www/html shark/npm:02 bash`

*Note that in this command, we are opening an interactive shell, so she's not just running in the background. Once you're on that shell, you'll be able to run your usual npm <whatever> commands* 

**run npm init**

`root@8ca332e6b16b:/var/www/html# npm init`

**run gulp watch**
`root@8ca332e6b16b:/var/www/html# gulp watch`

**run gulp compile**
`root@8ca332e6b16b:/var/www/html# gulp compile`

**To jump into your mysql container's command line interface:**

`docker-compose -f docker-compose-local.yml exec db mysql -uroot -p`

*Note that in this command, "db" comes from the name we gave the service in our docker compose file, and "mysql -uroot -p" is the cmd we want to exec on the container*