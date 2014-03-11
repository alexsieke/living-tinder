module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | LivingTinder"      
    end
  end
end
