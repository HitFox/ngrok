namespace :ngrok do
  desc "Start the ngrok service, use attributes: token, subdomain, port"
  task :start do
    token = ENV['token'] && !ENV['token'].empty? ? "-authtoken #{ENV['token']}" : ENV['NGROK_TOKEN']
    subdomain = ENV['subdomain'] && !ENV['subdomain'].empty? ? "-subdomain=#{ENV['subdomain']}" : nil
    port = ENV['port'] || '3000'
    system ['ngrok', token, subdomain, port].join(' ')
  end
end