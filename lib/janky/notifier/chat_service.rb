module Janky
  module Notifier
    class ChatService
      def self.started(build)
        message = "Build #%s (%s) of %s/%s started %s" % [
          build.number,
          build.short_sha1,
          build.repo_name,
          build.branch_name,
          build.branch_url
        ]

        ::Janky::ChatService.speak(message, build.room_id, {:color => "green"})
      end

      def self.completed(build)
        status = build.green? ? "was successful" : "failed"
        color = build.green? ? "green" : "red"

        message = "Build #%s (%s) of %s/%s %s (%ss) %s" % [
          build.number,
          build.short_sha1,
          build.repo_name,
          build.branch_name,
          status,
          build.duration,
          build.web_url
        ]

        ::Janky::ChatService.speak(message, build.room, {:color => color})
      end
    end
  end
end
