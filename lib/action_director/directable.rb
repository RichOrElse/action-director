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
      stored = actions[key]
      if stored
        stored.call *args
      else
        raise ArgumentError, "#{key.inspect}:#{key.class} did not match any condition"
      end
    end

    def by key, *args                      # passes a key plus (optional) arguments
      as key, key, *args
    end

    def of key, subject                    # passes the subject with the key
      as key, subject, key                 
    end

    def from source                        # matches (keys) and passes the subject (with matching key)
      of key_like(source), source
    end

    def to destination, *args              # matches (keys) and passes the subject (without a key) plus (optional) arguments
      alike destination, destination, *args
    end

    def for subject, condition             # evaluates second argument (condition) instead of the first (subject)
      alike condition, subject, condition
    end

    def like so, &block                    # matches and passes the subject (so), accepts only one (1) argument (so)
      alike so, so, block                  
    end

    def alike so, *args                    # derives a key from the subject (so), only passes succeeding arguments (args), similar to as() method, passing no key they are alike :P
      as key_like(so), *args               
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
