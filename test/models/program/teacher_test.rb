# == Schema Information
#
# Table name: program_teachers
#
#  id         :bigint           not null, primary key
#  details    :text
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_program_teachers_on_program_id  (program_id)
#  index_program_teachers_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (program_id => programs.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class Program::TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
