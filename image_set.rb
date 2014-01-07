Shoes.app do
  stack do
    background purple
    button 'Number of strokes' do alert(@arr.size) end
    button 'Hashes' do alert(@arr) end
    button 'Number of points in each stroke' do
      sizes =[]
      @arr.each do |el|
        sizes << el.size
      end
      alert sizes
    end
    @para1 = para 'text'
    @zone = para ''
    @arr=[[]]
    @f=false
    
    @shape = stack width: 400, height: 400 do
      background red
    end
    
    
    @shape.click do |button, left, top|
      @f=true
      @arr.last << Hash[:left,  left, :top, top ]
    end
    
    @shape.release do
      @f=false
      @arr << []
    end
    
    @shape.hover do
      @zone.text = "You can draw."
    end
    
    @shape.leave do
      @zone.text = "You can not draw."
    end
   
    @shape.motion do |left, top|
      
      @para1.text = "left: #{left}\ntop: #{top}"
      
      if @f
        x1 = @arr.last.last[:left]
        y1 = @arr.last.last[:top]
        
        @shape.append do
          line x1, y1, left, top
        end
        @arr.last << Hash[:left, left, :top, top]
        
      end
    end
  end
end
