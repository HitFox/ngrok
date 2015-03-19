# ngrok

## Usage
Allows starting an ngrok tunnel with `rake ngrok:start subdomain=mydomain`.

Given that you hava a webserver running on `localhost:3000`, you can then access the webserver on the internet via `https://mydomain.ngrok.com`

## Preconditions
You must have an ngrok accout. It is free and you can sign up at https://ngrok.com/
You must log in to your account to get your ngrok auth token
You must provide this auth token in one of the following ways
* as a command line parameter: `rake ngrok:start subdomain=mydomain token=<your_token>`
* as an environment variable: NGROK_TOKEN=<your_token>
* via a `.token` file (in the root of the repo) which contains only your token and nothing else
