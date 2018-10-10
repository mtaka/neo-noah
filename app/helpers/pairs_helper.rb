module PairsHelper

  ##################################################
  # Common Constants
  CR,TAB,SP,BAR,UBAR="\n","\t",'  ','|','_'

  # A method for building attribute string
  def mk_attr_str **attr_map
    attr_map.map{|k,v|" #{k}='#{v}'"}.join
  end

  ##################################################
  # A method for building inline tag string
  def tag_inline tagname, value, **attr_map
    attr_str = mk_attr_str(attr_map)
    "<#{tagname}#{attr_str}>#{value}</div>"
  end
  # A method for building inline div string with class attribute
  def div_inline value, role
    tag_inline('div', value, class: role)
  end

  ##################################################
  # A method for indent array
  def a_indent arr, level=1
    [arr].flatten.map{|e|"#{SP*level}#{e}"}
  end
  # A method for building block level tag string array with class attribute
  def tag_block tagname, children, **attr_map
    ch = a_indent(children)
    attr_str = mk_attr_str(attr_map)
    ["<#{tagname}#{attr_str}>", ch, "</div>"].flatten
  end
  # A method for building block level div string array
  def div_block children, role
    tag_block('div', children, class: role)
  end

  ##################################################
  # A method for building pair from value/role pair
  def build_pair_div value_pair, role_pair
    value_pair.zip(role_pair).map{|v,r|div_inline(v,r)}
  end
  # A method for building pair role
  def mk_pair_role rpair, plural=false
    suffix = plural ? 's' : ''
    "#{rpair.join(UBAR)}_pair#{suffix}"
  end
  # A method for building pair from value/role pair with wrapper
  def build_pair_div_wrap value_pair, role_pair
    pairs = build_pair_div(value_pair, role_pair)
    pair_role = mk_pair_role(role_pair)
    div_block(pairs, pair_role)
  end
  # A method for building pairs from value/role pairs
  def build_pairs_div value_pairs, role_pair
    pairs = value_pairs.map{|pair|build_pair_div_wrap(pair, role_pair)}
    pairs_role = mk_pair_role(role_pair, true)
    div_block(pairs, pairs_role)
  end
  # A method for building pairs from value pairs string and role pairs
  def build_pairs_div_from_lines value_pair_lines, role_pair, rsep=CR, csep=BAR
    value_pairs = value_pair_lines.split(rsep).map{|row|row.split(csep, 2)}
    build_pairs_div(value_pairs, role_pair)
  end

end
