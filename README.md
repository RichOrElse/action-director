# ActionDirector

Directs objects' behaviors

## Installation

Add this line to your application's Gemfile:

    gem 'action_director'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install action_director

## Usage

    class AgeLabeler
      include ActionDirector

      def initialize
        @labeling_age = directive('labeling age').setup do
          with 1..17, 18..27, 28..37, 38..47, 48..57 do |age, range| "#{range.begin} - #{range.end}" end
          with 58..100000000000000000000000000000000 do |age, range| "#{range.begin} and above"    end
          otherwise                                  do |age, range| "Unknown"                     end
        end
      end
    
      def label_age(age)
        @labeling_age.from age
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
