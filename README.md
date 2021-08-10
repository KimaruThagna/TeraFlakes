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

# Terraform Modules
I have implemented two modules `webserver/` and `snowflake_spinup/` that handles an AWS webserver infrastructure and a SNOWFLAKE db/warehouse setup for different usecases.

# Policy Governance using Sentinel
Sentinel provides a way to encode policies that are imposed on the terraform code written.
To run the policies against your terraform code, run the `terraform plan` command with the `-out=file` flag so that you can access the file.