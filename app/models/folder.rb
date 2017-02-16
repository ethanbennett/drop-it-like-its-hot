class Folder < Repo
  has_many :repos, foreign_key: :repo_id, :dependent => :destroy
  has_many :folders, -> (object) {where(type: 'Folder')}, foreign_key: :repo_id
  has_many :documents, -> (object) {where(type: 'Document')}, foreign_key: :repo_id
end
