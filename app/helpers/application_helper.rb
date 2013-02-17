module ApplicationHelper

  def body_director(dir, title)
    if dir == nil or dir == "" 
    	"'" + title + "' has no director info"
    else
       dir
    end    	 
  end

end
