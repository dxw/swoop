# Swoop
Ruby gem for dxw flavored rails logging extending lograge

## Configuratuin

### Colorise logs
You need to add the `colored` gem to your gemfile for the environments where you want your logs to be colored.
You also need to set `config.colorize_logging = true` in your rails configuration.

### Application name
To make your application distinguishable in shared log stream you can set `config.log_progname = "my awesome app"` in your rails configuration.

```
I 2015-02-17T16:05:04+00:00 my awesome app: method=GET path=/v1/users/1 format=json controller=v1/user action=show status=200 duration=407.32 view=38.43 db=0.99 params={"format":"json","id":"1"} ip=127.0.0.1
```

## Installation

```
gem "colored", "~> 0.0.4"
```