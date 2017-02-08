class Folder < Repo
  has_many :folders
  has_many :documents
end
