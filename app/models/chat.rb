class Chat < ApplicationRecord
  belongs_to :chatapp, optional: true
end
