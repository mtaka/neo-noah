module ArticlesHelper
  def resolve_url addr
    if addr !~/^http/
      base = Settings.base_url || ''
      addr =  base + addr
    end
    addr
  end
end
