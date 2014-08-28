require 'delegate'

module ActionDirector
  class Directive < SimpleDelegator
    include Directable

    def initialize directed = nil, name = nil
      super @directed = directed
      @name = name
      @actions = {}
    end
    
    def inspect
      [@name, 'Directive'].join ' '
    end    

    def setup &block
      block.arity < 1 ? instance_eval(&block) : block.call(self) unless block.nil?
      self
    end

    def otherwise?
      !@actions.default.nil?
    end

    def accept? condition
      otherwise? || recognize?(condition)
    end

    def recognize? condition
      key_like(condition) != nil
    end
  end
end

