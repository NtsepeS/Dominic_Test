class NewContainerService < BaseService

  attr_reader :container
  attr_reader :containable

  def create( containable, options = {} )
    options.assert_valid_keys( :in )

    @containable = containable
    @parent      = options[:in]

    if valid?
      run do
        build_container
        validate_container
        persist_container

        persist_containable
      end
    end

    self
  end

  def valid?
    if @containable.nil?
      @errors[:containable] = "can't be blank"
      return false
    end

    unless @containable.valid?
      @errors = @containable.errors
      return false
    end

    if @containable.persisted?
      @errors[:containable] = "must be a new record"
      return false
    end

    if @containable.requires_container?
      if @parent.nil?
        @errors[:parent] = "can't be blank"
        return false
      end

      unless @parent.class == @containable.parent_container_class
        mismatch = @parent.class
        expected = @containable.parent_container_class
        @errors[:parent] = "expected #{expected}, got #{mismatch} instead"
        return false
      end
    end

    true
  end

  private

  def build_container
    @container = Container.new( parent: @parent.try(:container) )
  end

  def validate_container
    unless container.valid?
      @errors = container.errors
      throw :abort
    end
  end

  def persist_container
    unless container.save
      throw :abort
    end
  end

  def persist_containable
    @containable.container = container

    unless @containable.save
      @errors = @containable.errors
      throw :abort
    end
  end
end
