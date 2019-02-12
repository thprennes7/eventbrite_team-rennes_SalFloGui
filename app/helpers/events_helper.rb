module EventsHelper

  def convert_date(datetime)
      DateTime.strptime(datetime.values.join(" "), '%Y %m %d %H %M')
  end
end
