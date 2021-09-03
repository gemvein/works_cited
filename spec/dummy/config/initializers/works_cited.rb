WorksCited.configure do |config|
  # This will dynamically generate a scope (.astrologians) and a boolean check (#astrologian?)
  # on WorksCited::Contributor
  config.valid_contributor_roles << 'astrologian'

  # This will dynamically generate a scope (.star_charts) and a boolean check (#star_chart?)
  # on WorksCited::Citation
  #
  # If you want to override the default view for any new (or existing) types:
  # List a citation: app/views/works_cited/citation_types/_star_chart.html.[haml/erb]
  # Add/Edit a citation: app/views/works_cited/citation_types/_star_chart_form.html.[haml/erb]
  config.valid_citation_types << 'star_chart'
end