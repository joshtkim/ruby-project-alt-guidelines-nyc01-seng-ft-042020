class Writer < ActiveRecord::Base
    has_many :webtoons
    has_many :readers, through: :webtoons
end
