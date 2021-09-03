module WorksCited
  class CitationsController < ApplicationController
    load_and_authorize_resource
    before_action :set_records, only: %i[edit update new create]

    # GET /citations
    def index
    end

    # GET /citations/1
    def show
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
