module InfosHelper
  def desc info
    case info.data_type
    when 'FromToPairs'
      raw build_pairs_div_from_lines(info.data, %w|from to|).join
    when 'NameValuePairs'
      raw build_pairs_div_from_lines(info.data, %w|name value|).join
    else
      info.data
    end
  end
end

