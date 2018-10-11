module InfosHelper
  def desc info
    case info.data_type
    when 'FromToPairs'
      raw build_pairs_div_from_lines(info.data, %w|from to|).join
    else
      info.data
    end
  end
end

