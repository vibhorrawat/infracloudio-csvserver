# The csvserver assignment

## Part I

### Commands used for the solution-
- Initial container kick-off using `docker run infracloudio/csvserver:latest`
- Ran into an issue with error- `error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory`
- Created a bash script `./gencsv.sh` to generate the required `inputFile`
- Bind mounted the volume for sharing `inputFile` to the container using `docker run --name csvserver -d -v /$(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest`
- Verified the container is listening on port `9300` using - `docker exec -it csvserver netstat -tulnp`
- Stopped and removed the container using - `docker stop [container_id]` and `docker rm [container_id]` respectively
- Port assignment and setting environment variable using -  `docker run --name csvserver -d -e CSVSERVER_BORDER=Orange -v /$(pwd)/inputFile:/csvserver/inputdata -p 9393:9300 infracloudio/csvserver:latest`


## Part II
### Commands used for the solution-
- Added the `docker-compose.yaml` file to the solution
- Deployed the container using- `docker-compose up`
- Application is accessible on http://localhost:9393/
- Output
    ```
    [+] Running 1/0
 ✔ Container csvserver  Created                                                                                                                                                                      0.0s
Attaching to csvserver
csvserver  | 2025/07/02 11:29:43 listening on ****
csvserver  | 2025/07/02 11:29:47 wrote 553 bytes for /
csvserver  | 2025/07/02 11:29:47 wrote 553 bytes for /favicon.ico
csvserver  | 2025/07/02 11:29:50 wrote 553 bytes for /
csvserver  | 2025/07/02 11:29:50 wrote 553 bytes for /favicon.ico
csvserver  | 2025/07/02 11:29:50 wrote 553 bytes for /
csvserver  | 2025/07/02 11:29:50 wrote 553 bytes for /favicon.ico
^CGracefully stopping... (press Ctrl+C again to force)
    ```


## Part III
