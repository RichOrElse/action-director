
module ActionDirector
  def self.included(receiver)
    receiver.extend         Directing
    receiver.send :include, Directing
  end
end
