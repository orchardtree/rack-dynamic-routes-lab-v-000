require 'pry'
class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      req_item = req.path.split("/item/").last
      item = @@items.find{|item| item.name == req_item}
      resp.write item.price
      binding.pry
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
  
  def item_handler

  end
end