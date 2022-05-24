
class Storage

  def store_product_at_location(warehouse,x,y,w,h,p)
    h -= 1
    y -= 1
    x -= 1
    w -= 1
    h = y - h
    raise_store_error(warehouse,x, y, w, h)
    store_locations(warehouse,x,y,w,h,p)
  end

  def remove_product_at_location(warehouse,x, y, w, h)
    h -= 1
    y -= 1
    x -= 1
    w -= 1
    h = y - h
    raise_remove_error(warehouse,x, y, w, h)  
    remove_locations(warehouse,x, y, w, h)
    remove_locations(warehouse,x, y, w, h)
  end

  private

  def raise_store_error(warehouse,x, y, w, h)
    store_error_message = "Sorry can't put that there : ("
    raise store_error_message if warehouse[y][x] != ' '
    raise store_error_message if y.negative? || y > warehouse.length
    raise store_error_message if h.negative? || h > warehouse.length
    raise store_error_message if x.negative? || x > warehouse[y].length
    raise store_error_message if w > warehouse[y][x..].length
  end
  
  def raise_remove_error(warehouse,x, y, w, h)
    remove_error_message = 'sorry nothing there : ('
    raise remove_error_message if warehouse[x][y] == ' '
  end

  def store_locations(warehouse,x,y,w,h,p)
    warehouse[y][x..(x + w)] = warehouse[y][x..(x + w)].map { |_i| i = p }
    while y > h
      warehouse[y - 1][x..(x + w)] = warehouse[y - 1][x..(x + w)].map { |_i| i = p }
      y -= 1
    end
  end

  def remove_locations(warehouse,x, y, w, h)
    warehouse[y][x..(x + w)] = warehouse[y][x..(x + w)].map { |_i| i = ' ' }
    warehouse[y - 1][x..(x + w)] = warehouse[y - 1][x..(x + w)].map { |_i| i = ' ' }
  end

end