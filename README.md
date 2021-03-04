# flask-docker-salt

Create a HTTP api which sums two numbers and returns them (in any desired language.
personal recommendation: Python + Flask)
It should have one endpoint (/sum) which json data is POSTed to.

POST /sum
{“number1”: 10, “number2”:20}

Return -> {“result”:30}

-----------------------------------------------------------

Dockerize the application (listen on port 8000 on start)

------------------------------------------------

Create a Salt state file to do the following:
1. Install a nginx and configure it to be a reverse proxy for the application. (install via apt)
2. Run our application from docker image, assume docker is installed and image is present
on the machine (do these steps manually)

---------------------------------

NOTES:

● DO NOT use cmd.run or any other run command unless absolutely necessary.

● MAKE SURE nginx is installed before running the container application.

● Use iptables to BLOCK direct access to the application, access should only be available
via nginx.
