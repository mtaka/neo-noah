require 'minitest/autorun'


# Base Test Case with Common data
class PairsHelperTestBase < Minitest::Test
  include PairsHelper
  
  FT_VALUES, FT_ROLES = %w|FROM TO|, %w|from to|
  FROM, TO = "<div class='from'>FROM</div>", "<div class='to'>TO</div>"
  FT_PAIR= [
    "<div class='from'>FROM</div>",
    "<div class='to'>TO</div>"
  ]
  FT_PAIR_WRAP= [
    "<div class='from_to_pair'>",
    "  <div class='from'>FROM</div>",
    "  <div class='to'>TO</div>",
    "</div>"
  ]
  FT_SRC = [%w|FROM1 TO1|, %w|FROM2 TO2|, %w|FROM3 TO3|]
  FT_PAIRS = [
    "<div class='from_to_pairs'>",
    "  <div class='from_to_pair'>",
    "    <div class='from'>FROM1</div>",
    "    <div class='to'>TO1</div>",
    "  </div>",
    "  <div class='from_to_pair'>",
    "    <div class='from'>FROM2</div>",
    "    <div class='to'>TO2</div>",
    "  </div>",
    "  <div class='from_to_pair'>",
    "    <div class='from'>FROM3</div>",
    "    <div class='to'>TO3</div>",
    "  </div>",
    "</div>"
  ]
  FT_LINES=<<EOS
FROM1|TO1
FROM2|TO2
FROM3|TO3
EOS
  NV_PAIRS = [
    "<div class='name_value_pairs'>",
    "  <div class='name_value_pair'>",
    "    <div class='name'>NAME1</div>",
    "    <div class='value'>VALUE1</div>",
    "  </div>",
    "  <div class='name_value_pair'>",
    "    <div class='name'>NAME2</div>",
    "    <div class='value'>VALUE2</div>",
    "  </div>",
    "  <div class='name_value_pair'>",
    "    <div class='name'>NAME3</div>",
    "    <div class='value'>VALUE3</div>",
    "  </div>",
    "</div>"
  ]
  NV_LINES =<<EOS
NAME1|VALUE1
NAME2|VALUE2
NAME3|VALUE3
EOS
  NV_ROLES = %w|name value|
end

# Testing common utility methods
class UtilFuncTest < PairsHelperTestBase
  def test_tag_inline
    assert_equal FROM, tag_inline('div', 'FROM', class: 'from')
  end
  def test_a_indent
    src = %w|pqr xyz stu|
    assert_equal ['  pqr', '  xyz', '  stu'], a_indent(src)
  end
  def test_a_indent_tag
    src = ['<abc/>', '<def/>', '<ghi/>']
    assert_equal ['  <abc/>', '  <def/>', '  <ghi/>'], a_indent(src)
  end
end
class DivTest < PairsHelperTestBase
  def test_div_inline
    assert_equal FROM, div_inline('FROM', 'from')
  end
  def test_div_block
    assert_equal FT_PAIR_WRAP, div_block(FT_PAIR, 'from_to_pair')
  end
end
class ArrayPairsHelperTest < PairsHelperTestBase
  def test_build_pair_div
    assert_equal FT_PAIR, build_pair_div(FT_VALUES, FT_ROLES)
  end
  def test_build_pair_div_wrap
    assert_equal FT_PAIR_WRAP, build_pair_div_wrap(FT_VALUES, FT_ROLES)
  end
  def test_build_pairs_div
    assert_equal FT_PAIRS, build_pairs_div(FT_SRC, FT_ROLES)
  end
end
class StringPairsHelperTest < PairsHelperTestBase
  def test_build_pairs_from_to_lines
    assert_equal FT_PAIRS, build_pairs_div_from_lines(FT_LINES, FT_ROLES)
  end
  def test_build_pairs_name_value_lines
    assert_equal NV_PAIRS, build_pairs_div_from_lines(NV_LINES, NV_ROLES)
  end
end

