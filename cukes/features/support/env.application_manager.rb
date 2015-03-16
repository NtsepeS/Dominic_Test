require 'childprocess'

module ChildProcess
  module Unix
    class Process < AbstractProcess
      def interrupt
        send_signal "SIGINT"
      end
    end
  end
end

class ApplicationManager
  require 'childprocess'
  attr_accessor :rails, :ember, :rails_log, :ember_log, :proxy, :proxy_log

  def initialize
    @rails = ChildProcess.build("sh", "-c", "BUNDLE_GEMFILE=Gemfile bundle exec puma start -C config/puma.rb")
    @rails.leader = true
    @rails.cwd = Cukes.config.rails_root
    @rails_log = @rails.io.stdout = @rails.io.stderr = Tempfile.new('rails-log')

    @ember = ChildProcess.build("npm", "start", "--", "--port", ENV['EMBER_PORT'], "--live-reload", "false")
    @ember.leader = true
    @ember.cwd = Cukes.config.ember_root
    @ember_log = @ember.io.stdout = @ember.io.stderr = Tempfile.new("ember-log")

    @proxy = ChildProcess.build("bin/proxy")
    @proxy.cwd = Cukes.config.proxy_root
    @proxy_log = @proxy.io.stdout = @proxy.io.stderr = Tempfile.new("proxy-log")
  end

  def start_stack
    puts "Bringing the Applications Online, sit tight"
    rails.start
    ember.start
    proxy.start  
    wait_for_processes_started
    puts "Applications Online - Happy Cuking"
  end

  def stop_stack
    puts "Stopping the Applications, hang on"

    interrupt "rails", rails
    interrupt "ember", ember
    interrupt "proxy", proxy

    wait_for_processes_to_exit
    puts "All done! Hope they're all passes (::) (::) (::)"
  end

  private

  def interrupt( label, process )
    begin
      process.interrupt
    rescue Errno::EPERM
      $stderr.puts "Failed to interrupt #{label}... Process might still be running"
    end
  end

  def dump_logs
    puts "Rails log:"
      puts open(rails_log).read
      puts "-"*10
      puts "Ember log:"
      puts open(ember_log).read
      puts "-"*10
      puts "Proxy log:"
      puts open(proxy_log).read
      puts "-"*10
    end

  def wait_for_processes_started
    begin
      Timeout::timeout(Cukes.config.startup_timeout) do
        loop do
           break if processes_started?
        end
      end
    rescue Timeout::Error => e
      dump_logs
      rails.interrupt
      ember.interrupt
      proxy.interrupt
      wait_for_processes_to_exit
      raise "Unable to start the application"
    end
    dump_logs
  end

  def wait_for_processes_to_exit
    begin
      Timeout::timeout(5) do
        loop { break if rails.exited? && ember.exited? && proxy.exited? }
      end
    rescue Errno::ESRCH => e
      # Already stopped the process, no biggie
    rescue Timeout::Error => e
      raise "Unable to exit processes. pids: #{rails.pid}, #{ember.pid}, #{proxy.pid}"
    end
  end

  def processes_started?
    open(rails_log).read.include?( Cukes.config.rails_started_message ) &&
      open(ember_log).read.include?( Cukes.config.ember_started_message ) &&
      open(proxy_log).read.include?( Cukes.config.proxy_started_message )
  end
end
