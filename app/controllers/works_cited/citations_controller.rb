module WorksCited
  class CitationsController < ApplicationController
    load_and_authorize_resource except: %i[preview]
    before_action :set_records, only: %i[edit update new create]

    # GET /citations
    def index
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
      @records = [
        OpenStruct.new({
                         record_type: 'Doodad',
                         records: Doodad.accessible_by(current_ability, :select).map do |doodad|
                           OpenStruct.new({ id: "Doodad:#{doodad.id}", name: doodad.name })
                         end
                       })
      ]
    end

    # Only allow a list of trusted parameters through.
    def citation_params
      params.require(:citation).permit(
        :id,
        :citation_type,
        :media,
        :title,
        :publisher,
        :city,
        :edition,
        :volume,
        :series,
        :year,
        :record,
        :url,
        :pages,
        works_cited_contributors_attributes: %i[id contributor_role first middle last suffix handle _destroy]
      )
    end
  end
end
