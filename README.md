# TeraFlakes
Using Terraform to spin up resources in snowflake and wrapping everything in Docker.

# Using Docker Environment
# Commands
To run and initialize the project, 
```
docker-compose run --rm tf init
```

to format the `main.tf` file
```
docker-compose run --rm tf fmt
```

To validate our `main.tf`

```
docker-compose run --rm tf validate
```

To plan(explain the expected changes before performing action)

```
docker-compose run --rm tf plan
```

To run and apply actual plans

```
docker-compose run --rm tf apply
```
To destroy resources made by the TF
```
docker-compose run --rm tf destroy
```
