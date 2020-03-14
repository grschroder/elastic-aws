# elastic-aws

### How to use

- Create a provider.tf with your account information:

```Powershell
provider "aws" {
  version = "~> 2.0"
  region  = "sa-east-1"
  access_key = "youracesskey"
  secret_key = "secretkey"
}
```

- Run terraform init.

- Run terraform apply.

- Use the output information to connect in instances and configure esxx public IPs on each docker-compose.yml.

```Powershell
      - "es01-test:ES01-PUBLIC-IP"
      - "es02-test:ES02-PUBLIC-IP"
      - "es03-test:ES03-PUBLIC-IP"
```

- Start docker-compose on each instance.

```Powershell
docker-compose up
```

- Check logs and now you can access kibana interface using es01-test public on port 5601. 