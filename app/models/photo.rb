class Photo < Post
  require 'carrierwave/orm/mongomapper'
  include MongoMapper::Document
  mount_uploader :image, ImageUploader
  
  xml_reader :remote_photo
  xml_reader :album_id 

  key :album_id, ObjectId
  belongs_to :album, :class_name => 'Album'
  timestamps!

  validates_presence_of :album

  def remote_photo
    image.path
  end

  def remote_photo= remote_path
    image.store! open(remote_path)
  end
end