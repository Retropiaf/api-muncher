class User < ApplicationRecord

  def self.from_auth_hash(auth_hash, provider)
    user = new
    user.provider = provider
    user.uid = auth_hash['uid']
    user.username = auth_hash['info']['nickname']
    user.email = auth_hash['info']['email']
    return user
  end
end
