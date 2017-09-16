module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.png'
    end
  end

  def sklonenie(number, krokodil, krokodila, krokodilov,with_number)
    if number == nil || !number.is_a?(Numeric)
      number = 0
    end

    prefix = ""
    prefix = "#{number}" if with_number == true

    ostatok = number % 10

    if number % 100 > 10 && number % 100 <= 20
      return "#{prefix} #{krokodilov}"
    elsif ostatok == 1
      return "#{prefix} #{krokodil}"
    end

    if ostatok >= 2 && ostatok <= 4
      return "#{prefix} #{krokodila}"
    end

    if ostatok > 4 || ostatok == 0
      return "#{prefix} #{krokodilov}"
    end
    return "#{prefix} #{krokodilov}"
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa-#{icon_class}"
  end
end
