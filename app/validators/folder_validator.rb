class FolderValidator < ActiveModel::Validator
  def validate(record)
    unless record.repo == nil
      if record.repo.type == "Document"
        record.repo_id = nil
      end
    end
  end
end