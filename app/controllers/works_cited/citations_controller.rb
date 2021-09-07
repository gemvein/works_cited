module WorksCited
  class CitationsController < ApplicationController
    load_and_authorize_resource except: %i[preview]
    before_action :set_records, only: %i[edit update new create]

    # GET /citations
    def index
      @citations = @citations.page(params[:page])
    end

    # GET /citations/1
    def show
    end

    # GET /citations/preview
    def preview
      @citation = Citation.new(citation_params)
      authorize! :preview, @citation

      contributors_array = []
      raw_contributors = citation_params.dig(:works_cited_contributors_attributes)
      raw_contributors&.each do |index, contributor|
        destroy = contributor.delete(:_destroy)
        next if destroy == '1'

        contributors_array << Contributor.new(contributor)
      end
      @contributors = pack_contributors_by_role(contributors_array)
      render :preview, layout: false
    end

    # GET /citations/new
    def new
    end

    # GET /citations/1/edit
    def edit
    end

    # POST /citations
    def create
      if @citation.save
        redirect_to @citation, notice: 'Citation was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /citations/1
    def update
      if @citation.update(citation_params)
        redirect_to @citation, notice: 'Citation was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /citations/1
    def destroy
      @citation.destroy
      redirect_to citations_url, notice: 'Citation was successfully destroyed.'
    end

    private

    def pack_contributors_by_role(raw_contributors)
      array_of_keys = WorksCited.configuration.valid_contributor_roles
      packed_array = array_of_keys.map do |contributor_role|
        [contributor_role.pluralize, select_contributors_by_role(contributor_role, raw_contributors)]
      end
      contributors_hash = packed_array.to_h
      OpenStruct.new contributors_hash
    end

    def select_contributors_by_role(role, raw_contributors)
      found = raw_contributors.select { |x| x.contributor_role == role }
      found || WorksCited::Contributor.none
    end

    def set_records
      Rails.application.eager_load!
      models = ApplicationRecord.descendants.select { |x| x.method_defined?(:works_cited_citations) }

      @records = models.map do |model|
        items = model.accessible_by(current_ability, :select)
        next unless items.any?

        model_name = model.model_name
        OpenStruct.new(
          {
            record_type: model_name,
            records: items.map do |item|
              OpenStruct.new({ id: "#{model_name}:#{item.id}", name: item.name })
            end
          }
        )
      end.compact
    end

    # Only allow a list of trusted parameters through.
    def citation_params
      params.require(:citation).permit(
        :id,
        :citation_type,
        :title,
        :container_title,
        :publisher,
        :city,
        :edition,
        :volume,
        :number,
        :series,
        :year,
        :record,
        :media,
        :url,
        :pages,
        :published_at,
        :online_database,
        :doi,
        :accessed_at,
        works_cited_contributors_attributes: %i[id contributor_role first middle last suffix handle _destroy]
      )
    end
  end
end
