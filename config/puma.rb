directory '/home/deployer/TakeHotter/current'

rackup '/home/deployer/TakeHotter/current/config.ru'

rails_env = ENV['RAILS_ENV'] || 'production'
environment rails_env


daemonize

pidfile '/home/deployer/TakeHotter/shared/tmp/pids/puma.pid'

state_path '/home/deployer/TakeHotter/shared/tmp/sockets/puma.state'

threads 0, 1

workers 0

bind 'unix:///home/deployer/TakeHotter/shared/tmp/sockets/puma.sock'

activate_control_app 'unix:///home/deployer/TakeHotter/shared/tmp/sockets/pumactl.sock', { auth_token: '5f68d7dc62333e4b39a81159478f3db3' }
