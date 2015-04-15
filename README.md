# Simple intercepting squid proxy 

This is a docker image containing a squid instance configured to
intrcept SSL using squid's ssl_bump feature. 

## Set up certs

there is a self-signed cert in squidconfig/cacert.pem with a key 
squidconfig/cacert.key 

This is the cert that will be used to re-sign SSL roots published to
the browser (this will become the CA of all SSL sites intercepted by
the proxy). 

You can use the certs here or generate new ones: 

    openssl req -new -newkey rsa:2048 -sha256 -days 3000 -nodes -x509
-keyout cakey.pem  -out cacert.pem


Add the squidconfig/cacert.pem to your browser as a trusted cert. 


## Build the container: 

    docker build   -t squid .  

## Start the container: 

    docker run  -t --rm   -p 3128:3128 squid
   
## Configure your browser 

Set your browser proxy to localhost:3128


# Rebuilding squid 

The package includes a recompiled squid with --enable-ssl and
--enable-ssl-crt compiled in - these are excluded from debian/ubuntu
builds. 


To rebuild squid (on an ubuntu machine)

   apt-get source squid3
  
modify debian/rules and add --enable-ssl and --enable-ssl-crtd

rebuild the deb. 
