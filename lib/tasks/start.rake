namespace :ngrok do
  desc "Start the ngrok service, use attributes: token, subdomain, port"
  task :start do
    cli_token = ENV['token'] && !ENV['token'].empty? ? ENV['token'] : nil
    env_token = ENV['NGROK_TOKEN'] && !ENV['NGROK_TOKEN'].empty? ? ENV['NGROK_TOKEN'] : nil
    conf_token = File.exists?(".token") ? File.open(".token", "r").read.strip : nil
    token = cli_token || env_token || conf_token
    token = "-authtoken #{token}" if token
    subdomain = ENV['subdomain'] && !ENV['subdomain'].empty? ? "-subdomain=#{ENV['subdomain']}" : nil
    port = ENV['port'] || '3000'

    system ['./ngrok', token, subdomain, port].join(' ')
  end
end
