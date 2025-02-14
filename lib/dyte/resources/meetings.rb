module Dyte
  class MeetingsResource < Resource
    def list(**params)
      response = get_request("meetings", params: params)
      Collection.from_response(response, type: Meeting)
    end

    def fetch(meeting_id:)
      Meeting.new get_request("meetings/#{meeting_id}").body.dig("data")
    end

    def create(**attributes)
      Meeting.new post_request("meetings", body: attributes).body.dig("data")
    end

    def update(meeting_id:, **attributes)
      Meeting.new put_request("meetings/#{meeting_id}", body: attributes).body.dig("data", "meeting")
    end

    def update_old(meeting_id:, body: {})
      Meeting.new put_request("meetings/#{meeting_id}", body: body).body.dig("data", "meeting")
    end
  end
end
