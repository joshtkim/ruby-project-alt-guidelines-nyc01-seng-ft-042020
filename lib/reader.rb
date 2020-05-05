class Reader < ActiveRecord::Base
    has_many :webtoons
    has_many :writers, through: :webtoons
end
