# Simple intercepting squid proxy 

This is a docker image containing a squid instance configured to
intrcept SSL using squid's ssl_bump feature. 

* Add the squidconfig/cacert.pem to your browser. 
* build the container: 


    docker build   -t squid .  

* start the container: 

   docker run  -t --rm   -p 3128:3128 squid
   
Set your browser proxy to localhost:3128