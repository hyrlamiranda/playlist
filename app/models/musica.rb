class Musica < ActiveRecord::Base
  belongs_to :user
  attr_accessible :autor, :nome, :user_id
end
