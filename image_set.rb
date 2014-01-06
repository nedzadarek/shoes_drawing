Shoes.app do
  button 'size' do alert(@arr.size) end
  @para1 = para 'text'
  @arr=[{left: 0, top: 0}]
  @f=false
  
  @shape = stack width: 400, height: 400 do

  end
  
  @shape.click do
    @f=true
  end
  
  @shape.release do
    @f=false
  end
  
  @shape.motion do |left, top| 
    @para1.text = "left: #{left}\ntop: #{top}"
    
    if @f
    
      line @arr.last[:left], @arr.last[:top], left, top
      @arr << Hash[:left, left, :top, top]
    end
  end
  
end
