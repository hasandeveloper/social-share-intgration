module ServicesS3
    class ProductService
        def self.update_s3_url product
            @product = product
            
              if !@product.image_file_name.nil?
                link = "https://s3.ap-south-1.amazonaws.com/productcustomizationuploads/products/images/000/000/"+(@product.id.to_s.rjust(3,"0")).to_s+"/original/"+@product.image_file_name
                # binding.pry
                @product.image_url = link
                @product.save!
              end
        end

        def self.update_s3_url_for_update product
            @product = product
      

              if !@product.image_file_name.nil?
                link = "https://s3.ap-south-1.amazonaws.com/productcustomizationuploads/products/images/000/000/"+(@product.id.to_s.rjust(3,"0")).to_s+"/original/"+@product.image_file_name
                # binding.pry
                @product.image_url = link
              end
        end
    end
end