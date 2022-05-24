
class Storage

  def store_product_at_location(warehouse,x,y,w,h,p)
    h -= 1
    y -= 1
    x -= 1
    w -= 1
    h = y - h
    raise_store_error(warehouse,x, y, w, h)
    warehouse[y][x..(x + w)] = warehouse[y][x..(x + w)].map { |_i| i = p }
    while y > h
      warehouse[y - 1][x..(x + w)] = warehouse[y - 1][x..(x + w)].map { |_i| i = p }
      y -= 1
    end
  end

  def remove_product_at_location(warehouse,x, y, w, h)
    h -= 1
    y -= 1
    x -= 1
    w -= 1
    h = y - h
    raise_remove_error(warehouse,x, y, w, h)
    warehouse[y][x..(x + w)] = warehouse[y][x..(x + w)].map { |_i| i = ' ' }
    while y > h
      warehouse[y - 1][x..(x + w)] = warehouse[y - 1][x..(x + w)].map { |_i| i = ' ' }
      y -= 1
    end
  end

  private

  def raise_store_error(warehouse,x, y, w, h)
    error_message = "Sorry can't put that there : ("
    raise error_message if y.negative? || y > warehouse.length
    raise error_message if h.negative? || h > warehouse.length
    raise error_message if x.negative? || x > warehouse[y].length
    raise error_message if w > warehouse[y][x..].length
  end

  def raise_remove_error
    raise 'sorry nothing there : (' if x || y == ' '
  end
end