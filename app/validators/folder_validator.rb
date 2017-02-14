class FolderValidator < ActiveModel::Validator
  def validate(record)
    unless record.folder == nil
      if record.folder.type == "Document"
        record.repo_id = nil
      end
    end
  end
end