module SelectorsHelper
  # Maps a name to a link.
  def to_selector(selector_name)
    return unless selector_name

    case selector_name
    when '側邊功能'
      '#sidebar-menu'
    when '工具列'
      '.toolbar'
    when '上方工具列'
      '.toolbar.upper'
    else
      raise "Can't find mapping from \"#{selector_name}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World SelectorsHelper
