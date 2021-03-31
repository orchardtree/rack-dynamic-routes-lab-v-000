class Application
  
  @@items = []
  
  def call(env)
    @resp = Rack::Response.new
    @req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_handler
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
  
  def item_handler
    req_item = req.path.split(/item/)
    
  end
end