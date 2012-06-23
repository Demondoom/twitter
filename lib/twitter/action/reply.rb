require 'twitter/action/status'

module Twitter
  module Action
    class Reply < Twitter::Action::Status

      # A collection of statuses that reply to a user
      #
      # @return [Array<Twitter::Status>]
      def target_objects
        @target_objects = Array(@attrs['target_objects']).map do |status|
          Twitter::Status.from_response(status)
        end
      end

      # A collection that contains the replied-to status
      #
      # @return [Array<Twitter::Status>]
      def targets
        @targets = Array(@attrs['targets']).map do |status|
          Twitter::Status.from_response(status)
        end
      end

    end
  end
end
