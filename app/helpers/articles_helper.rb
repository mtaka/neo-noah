module ArticlesHelper
  def resolve_url addr
    return '' unless addr
    if addr !~/^http/
      base = Settings.base_url || ''
      addr =  base + addr
    end
    addr
  end
end
