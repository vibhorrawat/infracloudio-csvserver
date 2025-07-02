# The csvserver assignment

## Part I

### Commands used for the solution-
- Initial container kick-off using `docker run infracloudio/csvserver:latest`
- Ran into an issue with error- `error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory`
- Created a bash script `./gencsv.sh` to generate the required `inputFile`
- Bind mounted the volume for sharing inputFile to the container using `docker run --name csvserver -d -v /$(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest`
- Verified the container is listening on port `9300` using - `docker exec -it csvserver netstat -tulnp`
- Stopped and removed the container using - `docker stop [container_id]` and `docker rm [container_id]` respectively
- Port assignment and setting environment variable using -  `docker run --name csvserver -d -e CSVSERVER_BORDER=Orange -v /$(pwd)/inputFile:/csvserver/inputdata -p 9393:9300 infracloudio/csvserver:latest`


## Part II


## Part III
