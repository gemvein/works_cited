require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

module WorksCited
  RSpec.describe '/citations', type: :request do
    include Engine.routes.url_helpers
    let(:doodad) { FactoryBot.create(:doodad) }
    let(:admin) { FactoryBot.create(:user, admin: true) }
    let(:citation) { FactoryBot.create(:works_cited_citation, record: doodad) }

    # Citation. As you add validations to Citation, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      { citation_type: 'book', title: Faker::Book.title, record_id: doodad.id, record_type: 'Doodad' }
    }

    let(:invalid_attributes) {
      { citation_type: 'book', title: nil, record_id: nil, record_type: nil }
    }

    describe 'GET /index' do
      it 'renders a successful response' do
        Citation.create! valid_attributes
        get citations_url
        expect(response).to be_successful
      end
    end

    describe 'GET /show' do
      it 'renders a successful response' do
        get citation_url(citation)
        expect(response).to be_successful
      end
    end

    describe 'GET /new' do
      it 'disallows when appropriate' do
        expect { get new_citation_url }.to raise_error(CanCan::AccessDenied)
      end
      it 'renders a successful response when admin' do
        sign_in admin
        get new_citation_url
        expect(response).to be_successful
      end
    end

    describe 'GET /edit' do
      it 'disallows when appropriate' do
        expect { get edit_citation_url(citation) }.to raise_error(CanCan::AccessDenied)
      end
      it 'render a successful response when admin' do
        sign_in admin
        get edit_citation_url(citation)
        expect(response).to be_successful
      end
    end

    describe 'POST /create' do
      it 'disallows when appropriate' do
        expect { post citations_url, params: { citation: valid_attributes } }.to raise_error(CanCan::AccessDenied)
      end
      describe 'when admin' do
        before { sign_in admin }
        context 'with valid parameters' do
          it 'creates a new Citation' do
            expect {
              post citations_url, params: { citation: valid_attributes }
              puts response.inspect
            }.to change(Citation, :count).by(1)
          end

          it 'redirects to the created citation' do
            post citations_url, params: { citation: valid_attributes }
            expect(response).to redirect_to(citation_url(Citation.last))
          end
        end

        context 'with invalid parameters' do
          it 'does not create a new Citation' do
            expect {
              post citations_url, params: { citation: invalid_attributes }
            }.to change(Citation, :count).by(0)
          end

          it "renders a successful response (i.e. to display the 'new' template)" do
            post citations_url, params: { citation: invalid_attributes }
            expect(response).to be_successful
          end
        end
      end
    end

    describe 'PATCH /update' do
      let(:new_attributes) {
        { citation_type: 'book', title: 'New Title', record_id: doodad.id, record_type: 'Doodad' }
      }
      it 'disallows when appropriate' do
        expect { patch citation_url(citation), params: { citation: new_attributes } }.to raise_error(CanCan::AccessDenied)
      end
      describe 'when admin' do
        before { sign_in admin }
        context 'with valid parameters' do

          it 'updates the requested citation' do
            patch citation_url(citation), params: { citation: new_attributes }
            citation.reload
            expect(citation.title).to eq('New Title')
          end

          it 'redirects to the citation' do
            patch citation_url(citation), params: { citation: new_attributes }
            citation.reload
            expect(response).to redirect_to(citation_url(citation))
          end
        end

        context 'with invalid parameters' do
          it "renders a successful response (i.e. to display the 'edit' template)" do
            patch citation_url(citation), params: { citation: invalid_attributes }
            expect(response).to be_successful
          end
        end
      end
    end

    describe 'DELETE /destroy' do
      it 'disallows when appropriate' do
        expect { delete citation_url(citation) }.to raise_error(CanCan::AccessDenied)
      end
      describe 'when admin' do
        before do
          sign_in admin
          citation # Call it up so it exists ahead of time
        end

        it 'destroys the requested citation' do
          expect {
            delete citation_url(citation)
          }.to change(Citation, :count).by(-1)
        end

        it 'redirects to the citations list' do
          delete citation_url(citation)
          expect(response).to redirect_to(citations_url)
        end
      end
    end
  end
end