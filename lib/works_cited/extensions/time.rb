class Time
  def mla_date
    month_name = strftime('%B')
    return strftime('%e %B %Y') if month_name.length < 5

    strftime('%e %b. %Y')
  end

  def mla_datetime
    month_name = strftime('%B')
    time = if month_name.length < 5
             strftime('%e %B %Y, %l:%M %P')
           else
             strftime('%e %b. %Y, %l:%M %P')
           end
    time.gsub(/([ap])m/, '\\1.m.')
  end
end