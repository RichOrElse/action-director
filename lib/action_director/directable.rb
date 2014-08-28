# directable.rb: Written by Ritchie Paul Buitre (2014)

module ActionDirector
  module Directable
    def with *_conditions, &block          # assign conditions (keys) on the same callback (block)
      _conditions.each do |key| actions[key] = block end
      self
    end

    def without *_conditions               # removes actions
      _conditions.each do |key| actions.delete key end
      self
    end

    def otherwise &block                   # assigns a default callback for when none of the conditions are met
      actions.default = block
      self
    end

    def as key, *args                      # of the eight(8) calling methods, is the most straight forward (direct) way of calling a stored action block
      stored = actions[key]                # use one (1) calling method for different directables instead of many on the same directable (Directive)
      if stored
        stored.call *args                  # here only the succeeding arguments (args) are passed (excluding key)
      else
        raise ArgumentError, "#{key.inspect}:#{key.class} did not match any condition"
      end
    end

    def by key, *args                      # passes a key plus (optional) arguments
      as key, key, *args
    end

    def of key, subject                    # passes the subject with the key
      as key, subject, key                 # accepts only two (2) arguments
    end

    def from source                        # matches (keys) and passes the subject (with matching key)
      of key_like(source), source          # accepts only one (1) argument (source), passes two (2) to the block
    end

    def to destination, *args              # matches (keys) and passes the subject (without a key) plus (optional) arguments
      alike destination, destination, *args
    end

    def for subject, condition             # evaluates second argument (condition) instead of the first (subject), ideal for hash conditions
      alike condition, subject, condition  # accepts only two (2) arguments and passes both
    end

    def like so, &block                    # matches and passes the subject (so)
      alike so, so, block                  # accepts only one (1) argument (so)
    end

    def alike so, *args                    # derives a key from the subject (so), only passes succeeding arguments (args)
      as key_like(so), *args               # similar to as() method, passing no key they are alike :P
    end

    def conditions                         # list block keys
      actions.keys
    end

    protected

    def key_like condition                 # returns a block key matching the argument
      conditions.find { |key| key === condition }
    end

    def actions                            # blocks store
      @actions ||= {}
    end
  end
end
