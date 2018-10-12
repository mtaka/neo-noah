module InfosHelper
  def desc info
    case info.data_type
    when 'FromToPairs'
      data = info.data||''
      raw build_pairs_div_from_lines(data, %w|from to|).join
    when 'NameValuePairs'
      data = info.data||''
      raw build_pairs_div_from_lines(data, %w|name value|).join
    else
      info.data
    end
  end
end

