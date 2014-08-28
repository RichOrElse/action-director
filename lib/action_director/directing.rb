module ActionDirector
  module Directing
    private

    def direct actor = nil, &block
      directive_for(actor).setup &block
    end

    def directive name, actor = nil
      directives[name] = directive_for(actor, name)
    end

    def directive_for actor, name = nil
      actor.kind_of?(Directive) ? actor : Directive.new(actor, name)
    end

    def directives
      @directives ||= {}
    end
  end
end