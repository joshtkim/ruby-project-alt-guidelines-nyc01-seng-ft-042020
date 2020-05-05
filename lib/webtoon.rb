class Webtoon < ActiveRecord::Base
    belongs_to :reader
    belongs_to :writer
end
