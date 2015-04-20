docker-centos-apache-php
========================

Base Docker image to run PHP applications on Apache


Building the base image
-----------------------

To create the base image `bb/docker-centos-apache-php`, execute the following command on the docker-centos-apache-php`folder:

    docker build -t brainboxweb/docker-centos-apache-php .


Running your Apache+PHP docker image
------------------------------------

Start your image binding the external ports 80 in all interfaces to your container:

    docker run -d -p 80:80 brainboxweb/docker-centos-apache-php

Test your deployment...

... if you're running native:

    curl http://localhost/
    
    
... if you're using Boot2Docker:

    curl http://<Boot2Docker IP address>/
    

The result should be a ```Hello world!``` page.


Loading your custom PHP application
-----------------------------------

This image can be used as a base image for your PHP application. Create a new `Dockerfile` in your 
PHP application folder with the following contents:

    FROM brainboxweb/docker-centos-apache-php

After that, build the new `Dockerfile`:

    docker build -t username/my-php-app .

And test it:

    docker run -d -p 80:80 username/my-php-app

        

Test your deployment...

... if you're running native:

    curl http://localhost/
    
    
... you're running Boot2Docker:

    curl http://<Boot2Docker IP address>/
    