require 'pry'
class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      req_item = req.path.split("/items/").last
      item = @@items.find{|item| item.name == req_item}
      if req_item.nil?
        resp.status = 404
      else
        resp.write item.price
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
  
  def item_handler

  end
end