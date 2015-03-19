namespace :ngrok do
  desc "Start the ngrok service, use attributes: token, subdomain, port"
  task :start do
    token = ENV['token'] && !ENV['token'].empty? ? ENV['token'] : 
            ENV['NGROK_TOKEN'] && !ENV['NGROK_TOKEN'].empty? ? ENV['NGROK_TOKEN'] : nil
    token = "-authtoken #{token}" if token
    subdomain = ENV['subdomain'] && !ENV['subdomain'].empty? ? "-subdomain=#{ENV['subdomain']}" : nil
    port = ENV['port'] || '3000'

    system ['ngrok', token, subdomain, port].join(' ')
  end
end