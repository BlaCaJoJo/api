json.answers @member.answers do |a|
 json.extract! a, :question_id, :member_id, :desc, :accepted
end
