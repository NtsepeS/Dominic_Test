# Create simple user interactions safely by extending BaseService and
# running your own code inside a #run block.
class BaseService

  # Default errors
  attr_reader :errors

  def initialize
    @errors = {}
  end

  # Whether or not the #run completed successfully
  def successful?
    !!@completed
  end

  # Use this to wrap your own code. When you need to bail out, simply
  # throw :abort and the transactions will be rolled back and completed
  # flag won't be set.
  def run
    transaction do
      catch(:abort) do
        yield

        @completed = true
      end
    end

    self
  end

  private

  def transaction
    ActiveRecord::Base.transaction do
      yield

      raise ActiveRecord::Rollback unless successful?
    end
  end
end
