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
### Commands used for the solution-
- Updated the `docker-compose.yaml` file with Prometheus container `prom/prometheus:v2.45.2`
- Deployed the container using- `docker-compose up`
- Application is accessible on http://localhost:9393/ and Prometheus is accessible on http://localhost:9090/
- Output
    ```
    [+] Running 2/0
    ✔ Container csvserver
    Created                                                                                                                                                                     0.0s
    ✔ Container prometheus  Recreated                                                                                                                                                                   0.1s
    Attaching to csvserver, prometheus
    csvserver   | 2025/07/02 12:03:24 listening on ****
    prometheus  | ts=2025-07-02T12:03:24.872Z caller=web.go:562 level=info component=web msg="Start listening for connections" address=0.0.0.0:9090
    prometheus  | ts=2025-07-02T12:03:24.874Z caller=main.go:1019 level=info msg="Starting TSDB ..."
    prometheus  | ts=2025-07-02T12:03:24.896Z caller=tls_config.go:274 level=info component=web msg="Listening on" address=[::]:9090
    prometheus  | ts=2025-07-02T12:03:24.896Z caller=tls_config.go:277 level=info component=web msg="TLS is disabled." http2=false address=[::]:9090

    ```
