class Video < ActiveRecord::Base
  before_create :generate_token

  def point_to(otherToken)
    Raydash.changeStream(self.token,otherToken)
    self.connected_to=otherToken
    self.save()
  end
  def strangerConnect()
    begin
      videos=Video.where("id <> ? AND active=1",self.id)
      ct = videos.count
      if ct == 0 then
        return false
      end
      video = videos.find(:first, :offset => rand(video.size))
    end until video.check_active()
  end
  protected
    def check_active()
      streamInfo=Raydash.getStreamInfo(self.token)
      if streamInfo["active"] != self.active then
        self.active=streamInfo["active"]
        self.save()
      end
      self.active
    end
  private
    def generate_token
       self.token = Raydash.getToken()
    end
end
