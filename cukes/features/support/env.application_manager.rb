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
  attr_accessor :rails, :ember, :rails_log, :ember_log

  def initialize
    ChildProcess.posix_spawn = true
    @rails = ChildProcess.build("sh", "-c", "BUNDLE_GEMFILE=Gemfile bundle exec rails s -e test")
    @rails.leader = true
    @rails.cwd = Cukes.config.rails_root
    @rails.io.inherit!
    # @rails_log = @rails.io.stdout = @rails.io.stderr = Tempfile.new('rails-log')

    @ember = ChildProcess.build("ember", "serve", "--proxy", "http://localhost:3000", "--live-reload", "false")
    @ember.leader = true
    @ember.cwd = Cukes.config.ember_root
    @ember.io.inherit!
    # @ember_log = @ember.io.stdout = @ember.io.stderr = Tempfile.new("ember-log")
  end

  def start_stack
    puts "Bringing the Applications Online, sit tight"
    rails.start
    puts "start_stack1"
    ember.start
    puts "start_stack2"
    wait_for_processes_started
    puts "Applications Online - Happy Cuking"
  end

  def stop_stack
    puts "Stopping the Applications, hang on"
    rails.interrupt
    ember.interrupt
    wait_for_processes_to_exit
    puts "All done! Hope they're all passes (::) (::) (::)"
  end


private

  def dump_logs
    # puts "Rails log:"
    # puts open(rails_log).read
    # puts "-"*10
    # puts "Ember log:"
    # puts open(ember_log).read
    # puts "-"*10
  end

  def wait_for_processes_started
    begin
      puts "wait_for_processes_started 1"
      Timeout::timeout(Cukes.config.startup_timeout) do
        puts "wait_for_processes_started 2"
        loop do
           puts "wait_for_processes_started 3"
           break if processes_started?
           puts "wait_for_processes_started 4"
        end
        puts "wait_for_processes_started 5"
      end
      puts "wait_for_processes_started 6"
    rescue Timeout::Error => e
      puts "wait_for_processes_started 7"
      dump_logs
      puts "wait_for_processes_started 8"
      rails.interrupt
      puts "wait_for_processes_started 9"
      ember.interrupt
      puts "wait_for_processes_started 10"
      wait_for_processes_to_exit
      puts "wait_for_processes_started 11"
      raise "Unable to start the application"
    end
    puts "wait_for_processes_started 12"
    dump_logs
    puts "wait_for_processes_started 13"
  end

  def wait_for_processes_to_exit
    begin
      puts "wait_for_processes_to_exit 1"
      Timeout::timeout(5) do
        puts "wait_for_processes_to_exit 2"
        loop { break if rails.exited? && ember.exited? }
        puts "wait_for_processes_to_exit 3"
      end
      puts "wait_for_processes_to_exit 4"
    rescue Errno::ESRCH => e
      puts "wait_for_processes_to_exit 5"
      # Already stopped the process, no biggie
    rescue Timeout::Error => e
      puts "wait_for_processes_to_exit 6"
      raise "Unable to exit processes. pids: #{rails.pid}, #{ember.pid}"
    end
    puts "wait_for_processes_to_exit 7"
  end

  def processes_started?
    puts "processes_started 1"
    sleep 15
    puts "processes_started 2"
    true 
    # open(rails_log).read.include?( Cukes.config.rails_started_message ) &&
      # open(ember_log).read.include?( Cukes.config.ember_started_message )
  end
end
