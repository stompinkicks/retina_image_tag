module RetinaImageTag
  module ViewHelpers
    
    def retina_image()
      @retina_image_path = @design.image_url(:retina)
      image_tag("hello", @options)
    end
    
    
    def retina_image_tag(image, options = {})
      @devicePixelRatio = cookies[:devicePixelRatio]
      @options          = options
      @image            = image                             # foo.jpg
      
      @file_path        = image_path(@image)
      @file_ext         = File.extname(@file_path)          # .jpg, .png
      @file_name        = File.basename(@image, @file_ext)  # pic1, foo
      @file_dirname     = File.dirname(@file_path)
      
            
      case @devicePixelRatio
        when '2'
          retina_image
        when '1.5'
          retina_image
        else
          image_tag("hello", @options)
       end
     end
     
  end
end