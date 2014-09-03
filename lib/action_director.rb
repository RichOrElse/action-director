require "action_director/directable"
require "action_director/directive"
require "action_director/directing"

module ActionDirector
  def self.included(receiver)
    receiver.extend         Directing
    receiver.send :include, Directing
  end
end
