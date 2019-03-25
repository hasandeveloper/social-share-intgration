class Product < ApplicationRecord
    has_attached_file :image, styles: { large: "1024x768>", medium: "300x300>", thumb: "100x100#" }
       validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
   after_create :upload_in_s3
   validate :please_check_with_s3_for_update, on: :update

   def upload_in_s3
     ServicesS3::ProductService.update_s3_url self
   end

   def please_check_with_s3_for_update
     ServicesS3::ProductService.update_s3_url_for_update self
   end

end
