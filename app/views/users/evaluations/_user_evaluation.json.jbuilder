json.extract! user_evaluation, :id, :publication_id, :program_teacher, :completeness_validated, :completeness_comment, :authenticity_validated, :authenticity_comment, :validity_validated, :validity_comment, :depth_validated, :depth_comment, :extent_validated, :extent_comment, :explanation_validated, :explanation_comment, :created_at, :updated_at
json.url user_evaluation_url(user_evaluation, format: :json)
