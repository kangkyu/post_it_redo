module ApplicationHelper

  def external_url(url)
    if url.start_with?('http://', 'https://')
      url
    else
      "http://#{url}"
    end
  end

  def correct_user?(user)
    user_log_in? && current_user == user
  end

  def random_color
    ["Black", "Navy", "DarkBlue", "MediumBlue", "Blue", "DarkGreen", "Green", "Teal", "DarkCyan", "DeepSkyBlue", "DarkTurquoise", "MediumSpringGreen", "Lime", "SpringGreen", "Aqua", "Cyan", "MidnightBlue", "DodgerBlue", "LightSeaGreen", "ForestGreen", "SeaGreen", "DarkSlateGray", "LimeGreen", "MediumSeaGreen", "Turquoise", "RoyalBlue", "SteelBlue", "DarkSlateBlue", "MediumTurquoise", "Indigo", "DarkOliveGreen", "CadetBlue", "CornflowerBlue", "RebeccaPurple", "MediumAquaMarine", "DimGray", "SlateBlue", "OliveDrab", "SlateGray", "LightSlateGray", "MediumSlateBlue", "LawnGreen", "Chartreuse", "Aquamarine", "Maroon", "Purple", "Olive", "Gray", "SkyBlue", "LightSkyBlue", "BlueViolet", "DarkRed", "DarkMagenta", "SaddleBrown", "DarkSeaGreen", "LightGreen", "MediumPurple", "DarkViolet", "PaleGreen", "DarkOrchid", "YellowGreen", "Sienna", "Brown", "DarkGray", "LightBlue", "GreenYellow", "PaleTurquoise", "LightSteelBlue", "PowderBlue", "FireBrick", "DarkGoldenRod", "MediumOrchid", "RosyBrown", "DarkKhaki", "Silver", "MediumVioletRed", "IndianRed", "Peru", "Chocolate", "Tan", "LightGray", "Thistle", "Orchid", "GoldenRod", "PaleVioletRed", "Crimson", "Gainsboro", "Plum", "BurlyWood", "LightCyan", "Lavender", "DarkSalmon", "Violet", "PaleGoldenRod", "LightCoral", "Khaki", "AliceBlue", "HoneyDew", "Azure", "SandyBrown", "Wheat", "Beige", "WhiteSmoke", "MintCream", "GhostWhite", "Salmon", "AntiqueWhite", "Linen", "LightGoldenRodYellow", "OldLace", "Red", "Fuchsia", "Magenta", "DeepPink", "OrangeRed", "Tomato", "HotPink", "Coral", "DarkOrange", "LightSalmon", "Orange", "LightPink", "Pink", "Gold", "PeachPuff", "NavajoWhite", "Moccasin", "Bisque", "MistyRose", "BlanchedAlmond", "PapayaWhip", "LavenderBlush", "SeaShell", "Cornsilk", "LemonChiffon", "FloralWhite", "Snow", "Yellow", "LightYellow", "Ivory", "White"].sample
  end

  def net_votes(votable)
    votable.votes.where(voted: true).count - votable.votes.where(voted: false).count
  end

  def caret_up_icon_post(post)
    if current_user && post.votes.where(user: current_user).take && post.votes.where(user: current_user).take.voted == true
      link_to fa_icon("caret-up 2x", style: "color: OrangeRed;"), vote_post_path(post, voted: nil), method: 'post'
    else
      link_to fa_icon("caret-up 2x", style: "color: gray;"), vote_post_path(post, voted: true), method: 'post'
    end
  end

  def caret_down_icon_post(post)
    if current_user && post.votes.where(user: current_user).take && post.votes.where(user: current_user).take.voted == false
      link_to fa_icon("caret-down 2x", style: "color: OrangeRed;"), vote_post_path(post, voted: nil), method: 'post'
    else
      link_to fa_icon("caret-down 2x", style: "color: gray;"), vote_post_path(post, voted: false), method: 'post'
    end
  end

  def caret_up_icon_comment(comment)
    if current_user && comment.votes.where(user: current_user).take && comment.votes.where(user: current_user).take.voted == true
      link_to fa_icon("caret-up 2x", style: "color: OrangeRed;"), vote_post_comment_path(comment.post, comment, voted: nil), method: 'post'
    else
      link_to fa_icon("caret-up 2x", style: "color: gray;"), vote_post_comment_path(comment.post, comment, voted: true), method: 'post'
    end
  end

  def caret_down_icon_comment(comment)
    if current_user && comment.votes.where(user: current_user).take && comment.votes.where(user: current_user).take.voted == false
      link_to fa_icon("caret-down 2x", style: "color: OrangeRed;"), vote_post_comment_path(comment.post, comment, voted: nil), method: 'post'
    else
      link_to fa_icon("caret-down 2x", style: "color: gray;"), vote_post_comment_path(comment.post, comment, voted: false), method: 'post'
    end
  end
end
