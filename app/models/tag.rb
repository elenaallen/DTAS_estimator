class Tag < ActiveRecord::Base
	has_many :task_tags
	has_many :tasks, :through => :task_tags

	accepts_nested_attributes_for :task_tags, :allow_destroy => true


	def self.est_time(tag_id)
  		avg = Tag.joins(:tasks).where("tags.name = ? ", tag_id ).average("actual_time * complexity")
	end
end
