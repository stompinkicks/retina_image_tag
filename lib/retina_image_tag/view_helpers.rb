module RetinaImageTag
  module ViewHelpers
    
    def retina_image()
      image_tag(@file_path.gsub("normal", "retina"), @options)
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
          image_tag(@file_path, @options)
       end
     end
     
  end
end