# frozen_string_literal: true

module WorksCited
  # Application Helper
  module ApplicationHelper
    def works_cited_list(record, title = 'Works Cited')
      citations = record.works_cited_citations.ordered_by_author.accessible_by(current_ability, :list)
      render 'works_cited/citations/list', citations: citations, title: title
    end

    def works_cited_citation(citation)
      path = partial_path_or_default('citation', citation.citation_type)
      render path, citation: citation, contributors: citation.works_cited_contributors
    end

    def works_cited_preview(citation, contributors)
      path = partial_path_or_default('citation', citation.citation_type)
      render path, citation: citation, contributors: contributors
    end

    def works_cited_type_fields(form, citation_type)
      path = partial_path_or_default('fields', citation_type)
      render path, f: form, citation_type: citation_type
    end

    def works_cited_citations_fields(form)
      render 'works_cited/citations/fields', form: form
    end

    def list_names(names)
      first = first_contributor(names)
      first_contributor_name = first&.full_name(first.name_order)
      case number_of_contributors(names)
      when 0 then nil
      when 1 then first_contributor_name
      when 2
        "#{first_contributor_name}, and #{second_contributor(names).full_name(:first)}"
      else
        "#{first_contributor_name}, et al"
      end
    end

    # This method creates a link with `data-id` `data-fields` attributes. These attributes are used to create new instances of the nested fields through Javascript.
    def works_cited_link_to_add_fields(name, f, association, partial = nil)

      # Takes an object (@person) and creates a new instance of its associated model (:addresses)
      # To better understand, run the following in your terminal:
      # rails c --sandbox
      # @person = Person.new
      # new_object = @person.send(:addresses).klass.new
      new_object = f.object.send(association).klass.new

      # Saves the unique ID of the object into a variable.
      # This is needed to ensure the key of the associated array is unique. This is makes parsing the content in the `data-fields` attribute easier through Javascript.
      # We could use another method to achive this.
      id = new_object.object_id

      # https://api.rubyonrails.org/ fields_for(record_name, record_object = nil, fields_options = {}, &block)
      # record_name = :addresses
      # record_object = new_object
      # fields_options = { child_index: id }
      # child_index` is used to ensure the key of the associated array is unique, and that it matched the value in the `data-id` attribute.
      # `person[addresses_attributes][child_index_value][_destroy]`
      fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
        # `association.to_s.singularize + "_fields"` ends up evaluating to `address_fields`
        # The render function will then look for `views/people/_address_fields.html.erb`
        # The render function also needs to be passed the value of 'builder', because `views/people/_address_fields.html.erb` needs this to render the form tags.
        partial ||= "#{association.to_s.singularize}_fields"
        render(partial, record: new_object, f: builder)
      end

      # This renders a simple link, but passes information into `data` attributes.
      # This info can be named anything we want, but in this case we chose `data-id:` and `data-fields:`.
      # The `id:` is from `new_object.object_id`.
      # The `fields:` are rendered from the `fields` blocks.
      # We use `gsub("\n", "")` to remove anywhite space from the rendered partial.
      # The `id:` value needs to match the value used in `child_index: id`.
      link_to(name, '#', class: "add_fields button button-action", data: {id: id, fields: fields.gsub("\n", "")})

    end

    private

    def partial_path_or_default(purpose, citation_type)
      unless WorksCited.configuration.valid_citation_types.include? citation_type
        raise 'Invalid Citation Type sent to partial_path_or_default'
      end

      path_to_partial = "works_cited/citation_types/#{purpose}/#{citation_type}"
      partial_exists = lookup_context.find_all(path_to_partial, [], true).any?

      return path_to_partial if partial_exists

      "works_cited/citation_types/#{purpose}/default"
    end

    def first_contributor(names)
      names.first
    end

    def second_contributor(names)
      names.offset(1).first
    end

    def number_of_contributors(names)
      names.size
    end
  end
end
