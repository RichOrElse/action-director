# ActionDirector

Directs objects' behaviors

## Installation

Add this line to your application's Gemfile:

    gem 'action_director'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install action_director

## Sample Usage

Range Conditions:

    class AgeLabeler
      include ActionDirector

      def initialize
        @labeling = directive('Labeling age').setup do
          with 1..17, 18..27, 28..37, 38..47, 48..57 do |age, range| "#{range.begin} - #{range.end}" end
          with 58..100000000000000000000000000000000 do |age, range| "#{range.begin} and above"      end
          otherwise                                  do |age, range| "Unknown"                       end
        end
      end
    
      def label(age)
        @labeling.from age
      end
    end

Regexp Conditions:

    class JsonResponseDirector < Struct.new(:view_context)
      include Directives::Director

      def responding
        @responding ||= direct view_context do
          with /^succeeded_creating/ do |resource| render action: 'show', status: :created, location: resource end
          with /^failed/             do |resource| render json: resource.errors, status: :unprocessable_entity end
          otherwise                  do |resource| head :no_content                                            end
        end
      end

      def method_missing(method_name, *args, &block)
        resource = args.first
        responding.for resource, method_name
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
