# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Layout/LineLength
describe WorksCited::ApplicationHelper do
  let(:doodad) { FactoryBot.create(:doodad) }
  let(:citation) { FactoryBot.create(:works_cited_citation, record: doodad) }

  describe '#works_cited' do
    before do
      FactoryBot.create_list(:works_cited_citation, 15, record: doodad, contributors_count: [*1..3].sample)
    end

    context 'returns list' do
      before(:each) do
        allow(view).to receive(:current_ability).and_return(Ability.new(nil))
      end
      subject { helper.works_cited_list(doodad) }
      it do
        should have_tag('ul', with: { class: 'citations' }) do
          with_tag(
            'li',
            with: { class: 'citation' }
          )
        end
      end
    end
  end

  describe '#works_cited_citation' do
    describe 'books' do
      describe 'with one author' do
        let(:book) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'book',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'James',
                last: 'Gleick',
                middle: '',
                suffix: ''
              )
            ],
            title: 'Chaos: Making a New Science',
            publisher: 'Penguin',
            year: '1987',
            city: '',
            media: '',
            pages: '',
            url: ''
          )
        end
        subject { helper.works_cited_citation(book).gsub(/\s+/, ' ').squish }
        it { should eq('Gleick, James. <em>Chaos: Making a New Science.</em> Penguin, 1987.') }
      end
      describe 'with two authors' do
        let(:book) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'book',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Paula',
                last: 'Gillespie',
                middle: '',
                suffix: ''
              ),
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Neal',
                last: 'Lerner',
                middle: '',
                suffix: ''
              )
            ],
            title: 'The Allyn and Bacon Guide to Peer Tutoring',
            publisher: 'Allyn and Bacon',
            year: '2000',
            city: '',
            media: '',
            pages: '',
            url: ''
          )
        end
        subject { helper.works_cited_citation(book).gsub(/\s+/, ' ').squish }
        it {
          should eq('Gillespie, Paula, and Neal Lerner. <em>The Allyn and Bacon Guide to Peer Tutoring.</em> Allyn and Bacon, 2000.')
        }
      end
      describe 'with multiple authors' do
        let(:book) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'book',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Anne Frances',
                last: 'Wysocki',
                middle: '',
                suffix: ''
              ),
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Neal',
                last: 'Xerner',
                middle: '',
                suffix: ''
              ),
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Another',
                last: 'Zauthor',
                middle: '',
                suffix: ''
              )
            ],
            title: 'Writing New Media: Theory and Applications for Expanding the Teaching of Composition',
            publisher: 'Utah State UP',
            year: '2004',
            city: '',
            media: '',
            pages: '',
            url: ''
          )
        end
        subject { helper.works_cited_citation(book).gsub(/\s+/, ' ').squish }
        it {
          should eq('Wysocki, Anne Frances, et al. <em>Writing New Media: Theory and Applications for Expanding the Teaching of Composition.</em> Utah State UP, 2004.')
        }
      end
      describe 'with no author' do
        let(:book) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'book',
            record: doodad,
            works_cited_contributors: [],
            title: 'Encyclopedia of Indiana',
            publisher: 'Somerset',
            year: '1993',
            city: '',
            media: '',
            pages: '',
            url: ''
          )
        end
        subject { helper.works_cited_citation(book).gsub(/\s+/, ' ').squish }
        it { should eq('<em>Encyclopedia of Indiana.</em> Somerset, 1993.') }
      end
      describe 'with a translator' do
        let(:book) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'book',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Michel',
                last: 'Foucault',
                middle: '',
                suffix: ''
              ),
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'translator',
                first: 'Richard',
                last: 'Howard',
                middle: '',
                suffix: ''
              )
            ],
            title: 'Madness and Civilization: A History of Insanity in the Age of Reason',
            publisher: 'Vintage-Random House',
            year: '1988',
            city: '',
            media: '',
            pages: '',
            url: ''
          )
        end
        subject { helper.works_cited_citation(book).gsub(/\s+/, ' ').squish }
        it {
          should eq('Foucault, Michel. <em>Madness and Civilization: A History of Insanity in the Age of Reason.</em> Translated by Richard Howard. Vintage-Random House, 1988.')
        }
      end
    end
    describe 'periodicals' do
      describe 'in a magazine' do
        let(:periodical) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'periodical',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'James',
                last: 'Poniewozik',
                middle: '',
                suffix: ''
              )
            ],
            title: 'TV Makes a Too-Close Call',
            container_title: 'Time',
            publisher: '',
            year: '',
            published_at: Date.parse('20 Nov. 2000'),
            city: '',
            media: '',
            pages: 'pp. 70-71',
            url: ''
          )
        end
        subject { helper.works_cited_citation(periodical).gsub(/\s+/, ' ').squish }
        it {
          should eq('Poniewozik, James. &quot;TV Makes a Too-Close Call.&quot; <em>Time</em>, 20 Nov. 2000, pp. 70-71.')
        }
      end
      describe 'in a newspaper' do
        let(:periodical) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'periodical',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Bill',
                last: 'Brubaker',
                middle: '',
                suffix: ''
              )
            ],
            title: "New Health Center Targets County's Uninsured Patients",
            container_title: 'Washington Post',
            publisher: '',
            year: '',
            published_at: Date.parse('24 May 2007'),
            city: '',
            media: '',
            pages: 'p. LZ01',
            url: ''
          )
        end
        subject { helper.works_cited_citation(periodical).gsub(/\s+/, ' ').squish }
        it {
          should eq('Brubaker, Bill. &quot;New Health Center Targets County&#39;s Uninsured Patients.&quot; <em>Washington Post</em>, 24 May 2007, p. LZ01.')
        }
      end
      describe 'in a journal' do
        let(:periodical) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'periodical',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Alaknanda',
                last: 'Bagchi',
                middle: '',
                suffix: ''
              )
            ],
            title: "Conflicting Nationalisms: The Voice of the Subaltern in Mahasweta Devi's Bashai Tudu",
            container_title: "Tulsa Studies in Women's Literature",
            publisher: '',
            volume: 'vol. 15',
            number: 'no. 1',
            year: '1996',
            city: '',
            media: '',
            pages: 'pp. 41-50',
            published_at: '',
            url: ''
          )
        end
        subject { helper.works_cited_citation(periodical).gsub(/\s+/, ' ').squish }
        it {
          should eq('Bagchi, Alaknanda. &quot;Conflicting Nationalisms: The Voice of the Subaltern in Mahasweta Devi&#39;s Bashai Tudu.&quot; <em>Tulsa Studies in Women&#39;s Literature</em>, vol. 15, no. 1, 1996, pp. 41-50.')
        }
      end
    end
    describe 'in electronic form' do
      describe 'on a website without a name' do
        let(:electronic) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'electronic',
            record: doodad,
            works_cited_contributors: [],
            title: 'The Purdue OWL Family of Sites',
            container_title: '',
            publisher: 'The Writing Lab and OWL at Purdue and Purdue U',
            volume: '',
            number: '',
            year: '2008',
            city: '',
            media: '',
            pages: '',
            published_at: '',
            accessed_at: Date.parse('23 Apr. 2008'),
            url: 'https://owl.english.purdue.edu/owl'
          )
        end
        subject { helper.works_cited_citation(electronic).gsub(/\s+/, ' ').squish }
        it {
          should eq('<em>The Purdue OWL Family of Sites.</em> The Writing Lab and OWL at Purdue and Purdue U, 2008, <a href="https://owl.english.purdue.edu/owl">owl.english.purdue.edu/owl</a>. Accessed 23 Apr. 2008.')
        }
      end
      describe 'on a website with a name' do
        let(:electronic) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'electronic',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Dino',
                last: 'Felluga',
                middle: '',
                suffix: ''
              )
            ],
            title: 'Guide to Literary and Critical Theory',
            container_title: '',
            publisher: 'Purdue U',
            volume: '',
            number: '',
            year: '',
            published_at: Date.parse('28 Nov. 2003'),
            city: '',
            media: '',
            pages: '',
            accessed_at: Date.parse('10 May 2006'),
            url: 'http://www.cla.purdue.edu/english/theory/'
          )
        end
        subject { helper.works_cited_citation(electronic).gsub(/\s+/, ' ').squish }
        it {
          should eq('Felluga, Dino. <em>Guide to Literary and Critical Theory.</em> Purdue U, 28 Nov. 2003, <a href="http://www.cla.purdue.edu/english/theory/">www.cla.purdue.edu/english/theory/</a>. Accessed 10 May 2006.')
        }
      end
      describe 'on an inner page without a name' do
        let(:electronic) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'electronic',
            record: doodad,
            works_cited_contributors: [],
            title: "Athlete's Foot - Topic Overview",
            container_title: 'WebMD',
            publisher: '',
            volume: '',
            number: '',
            year: '',
            published_at: Date.parse('25 Sept. 2014'),
            city: '',
            media: '',
            pages: '',
            accessed_at: '',
            url: 'https://www.webmd.com/skin-problems-and-treatments/tc/athletes-foot-topic-overview'
          )
        end
        subject { helper.works_cited_citation(electronic).gsub(/\s+/, ' ').squish }
        it {
          should eq('&quot;Athlete&#39;s Foot - Topic Overview.&quot; <em>WebMD,</em> 25 Sep. 2014, <a href="https://www.webmd.com/skin-problems-and-treatments/tc/athletes-foot-topic-overview">www.webmd.com/skin-problems-and-treatments/tc/athletes-foot-topic-overview</a>.')
        }
      end
      describe 'on an inner page with a name' do
        let(:electronic) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'electronic',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Susan',
                last: 'Lundman',
                middle: '',
                suffix: ''
              )
            ],
            title: 'How to Make Vegetarian Chili',
            container_title: 'eHow',
            publisher: '',
            volume: '',
            number: '',
            year: '',
            published_at: '',
            city: '',
            media: '',
            pages: '',
            accessed_at: Date.parse('6 July 2015'),
            url: 'https://www.ehow.com/how_10727_make-vegetarian-chili.html'
          )
        end
        subject { helper.works_cited_citation(electronic).gsub(/\s+/, ' ').squish }
        it {
          should eq('Lundman, Susan. &quot;How to Make Vegetarian Chili.&quot; <em>eHow,</em> <a href="https://www.ehow.com/how_10727_make-vegetarian-chili.html">www.ehow.com/how_10727_make-vegetarian-chili.html</a>. Accessed 6 July 2015.')
        }
      end
      describe 'in an ebook' do
        let(:electronic) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'electronic',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Paul',
                last: 'Silva',
                middle: 'Joseph',
                suffix: ''
              )
            ],
            title: 'How to Write a Lot: A Practical Guide to Productive Academic Writing',
            container_title: '',
            publisher: 'American Psychological Association',
            volume: '',
            number: '',
            year: '2007',
            published_at: '',
            city: '',
            media: 'E-book',
            pages: '',
            accessed_at: '',
            url: ''
          )
        end
        subject { helper.works_cited_citation(electronic).gsub(/\s+/, ' ').squish }
        it {
          should eq('Silva, Paul J. <em>How to Write a Lot: A Practical Guide to Productive Academic Writing.</em> E-book, American Psychological Association, 2007.')
        }
      end
      describe 'in an ebook specific to a platform, with a translator' do
        let(:electronic) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'electronic',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Niccolo',
                last: 'Machiavelli',
                middle: '',
                suffix: ''
              ),
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'translator',
                first: 'W. K.',
                last: 'Marriott',
                middle: '',
                suffix: ''
              )
            ],
            title: 'The Prince',
            container_title: '',
            publisher: 'Library of Alexandria',
            volume: '',
            number: '',
            year: '2018',
            published_at: '',
            city: '',
            media: 'Kindle ed.',
            pages: '',
            accessed_at: '',
            url: ''
          )
        end
        subject { helper.works_cited_citation(electronic).gsub(/\s+/, ' ').squish }
        it {
          should eq('Machiavelli, Niccolo. <em>The Prince.</em> Translated by W. K. Marriott, Kindle ed., Library of Alexandria, 2018.')
        }
      end
      describe 'in an article in a web magazine' do
        let(:electronic) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'electronic',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Mark',
                last: 'Bernstein',
                middle: '',
                suffix: ''
              )
            ],
            title: '10 Tips on Writing the Living Web',
            container_title: 'A List Apart: For People Who Make Websites',
            publisher: '',
            volume: '',
            number: '',
            year: '',
            published_at: Date.parse('16 Aug. 2002'),
            city: '',
            media: '',
            pages: '',
            accessed_at: Date.parse('4 May 2009'),
            url: 'http://alistapart.com/article/writeliving'
          )
        end
        subject { helper.works_cited_citation(electronic).gsub(/\s+/, ' ').squish }
        it {
          should eq('Bernstein, Mark. &quot;10 Tips on Writing the Living Web.&quot; <em>A List Apart: For People Who Make Websites,</em> 16 Aug. 2002, <a href="http://alistapart.com/article/writeliving">alistapart.com/article/writeliving</a>. Accessed 4 May 2009.')
        }
      end
      describe 'in an article in an online only scholarly journal' do
        let(:electronic) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'electronic',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Nadine',
                last: 'Dolby',
                middle: '',
                suffix: ''
              )
            ],
            title: 'Research in Youth Culture and Policy: Current Conditions and Future Directions',
            container_title: 'Social Work and Society: The International Online-Only Journal',
            publisher: '',
            volume: 'vol. 6',
            number: 'no. 2',
            year: '2008',
            published_at: '',
            city: '',
            media: '',
            pages: '',
            accessed_at: Date.parse('20 May 2009'),
            url: 'http://www.socwork.net/sws/article/view/60/362'
          )
        end
        subject { helper.works_cited_citation(electronic).gsub(/\s+/, ' ').squish }
        it {
          should eq('Dolby, Nadine. &quot;Research in Youth Culture and Policy: Current Conditions and Future Directions.&quot; <em>Social Work and Society: The International Online-Only Journal,</em> vol. 6, no. 2, 2008, <a href="http://www.socwork.net/sws/article/view/60/362">www.socwork.net/sws/article/view/60/362</a>. Accessed 20 May 2009.')
        }
      end
      describe 'in an article in a scholarly journal, also in print' do
        let(:electronic) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'electronic',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Mark',
                last: 'Wheelis',
                middle: '',
                suffix: ''
              )
            ],
            title: 'Investigating Disease Outbreaks Under a Protocol to the Biological and Toxin Weapons Convention',
            container_title: 'Emerging Infectious Diseases',
            publisher: '',
            volume: 'vol. 6',
            number: 'no. 6',
            year: '2000',
            published_at: '',
            city: '',
            media: '',
            pages: 'pp. 595-600',
            accessed_at: Date.parse('8 Feb. 2009'),
            url: 'http://wwwnc.cdc.gov/eid/article/6/6/00-0607_article'
          )
        end
        subject { helper.works_cited_citation(electronic).gsub(/\s+/, ' ').squish }
        it {
          should eq('Wheelis, Mark. &quot;Investigating Disease Outbreaks Under a Protocol to the Biological and Toxin Weapons Convention.&quot; <em>Emerging Infectious Diseases,</em> vol. 6, no. 6, 2000, pp. 595-600, <a href="http://wwwnc.cdc.gov/eid/article/6/6/00-0607_article">wwwnc.cdc.gov/eid/article/6/6/00-0607_article</a>. Accessed 8 Feb. 2009.')
        }
      end
      describe 'in an article from an online database' do
        let(:electronic) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'electronic',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Julio',
                last: 'Camargo',
                middle: 'Allen',
                suffix: ''
              ),
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Alvaro',
                last: 'Alonso',
                middle: '',
                suffix: ''
              )
            ],
            title: 'Toxicity of Nitrite to Three Species of Freshwater Invertebrates',
            container_title: 'Environmental Toxicology',
            publisher: '',
            volume: 'vol. 21',
            number: 'no. 1',
            year: '',
            published_at: Date.parse('3 Feb. 2006'),
            city: '',
            media: '',
            pages: 'pp. 90-94',
            accessed_at: Date.parse('26 May 2009'),
            url: '',
            online_database: 'Wiley Online Library',
            doi: 'doi:10.1002/tox.20155'
          )
        end
        subject { helper.works_cited_citation(electronic).gsub(/\s+/, ' ').squish }
        it {
          should eq('Alonso, Alvaro, and Julio A Camargo. &quot;Toxicity of Nitrite to Three Species of Freshwater Invertebrates.&quot; <em>Environmental Toxicology,</em> vol. 21, no. 1, 3 Feb. 2006, pp. 90-94, <em>Wiley Online Library</em>, doi:10.1002/tox.20155. Accessed 26 May 2009.')
        }
      end
    end
    describe 'in an email' do
      describe 'to an individual' do
        let(:email) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'email',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Andrew',
                last: 'Kunka',
                middle: '',
                suffix: ''
              ),
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'receiver',
                first: 'John',
                last: 'Watts',
                middle: '',
                suffix: ''
              )
            ],
            title: 'Re: Modernist Literature',
            container_title: '',
            publisher: '',
            volume: '',
            number: '',
            year: '',
            published_at: Date.parse('15 Nov. 2000'),
            city: '',
            media: '',
            pages: '',
            accessed_at: '',
            url: '',
            online_database: '',
            doi: ''
          )
        end
        subject { helper.works_cited_citation(email).gsub(/\s+/, ' ').squish }
        it { should eq('Kunka, Andrew. &quot;Re: Modernist Literature.&quot; Received by John Watts, 15 Nov. 2000.') }
      end
      describe 'on a listserv' do
        let(:email) do
          FactoryBot.create(
            :works_cited_citation,
            citation_type: 'email',
            record: doodad,
            works_cited_contributors: [
              FactoryBot.build(
                :works_cited_contributor,
                contributor_role: 'author',
                first: 'Sal',
                last: 'Hernandez',
                middle: '',
                suffix: '',
                handle: 'Salmar1515'
              )
            ],
            title: 'Re: Best Strategy: Fenced Pastures vs. Max Number of Rooms?',
            container_title: 'BoardGameGeek',
            publisher: '',
            volume: '',
            number: '',
            year: '',
            published_at: Date.parse('29 Sept. 2008'),
            city: '',
            media: '',
            pages: '',
            accessed_at: Date.parse('5 Apr. 2009'),
            url: 'https://boardgamegeek.com/thread/343929/best-strategy-fenced-pastures-vs-max-number-rooms',
            online_database: '',
            doi: ''
          )
        end
        subject { helper.works_cited_citation(email).gsub(/\s+/, ' ').squish }
        it {
          should eq('Salmar1515 [Sal Hernandez]. &quot;Re: Best Strategy: Fenced Pastures vs. Max Number of Rooms?.&quot; <em>BoardGameGeek,</em> 29 Sep. 2008, <a href="https://boardgamegeek.com/thread/343929/best-strategy-fenced-pastures-vs-max-number-rooms">boardgamegeek.com/thread/343929/best-strategy-fenced-pastures-vs-max-number-rooms</a>. Accessed 5 Apr. 2009.')
        }
      end
    end
    describe 'in a tweet' do
      let(:tweet) do
        FactoryBot.create(
          :works_cited_citation,
          citation_type: 'tweet',
          record: doodad,
          works_cited_contributors: [
            FactoryBot.build(
              :works_cited_contributor,
              contributor_role: 'author',
              first: '',
              last: '',
              middle: '',
              suffix: '',
              handle: 'tombrokaw'
            )
          ],
          title: 'SC demonstrated why all the debates are the engines of this campaign.',
          container_title: 'Twitter',
          publisher: '',
          volume: '',
          number: '',
          year: '',
          published_at: Time.zone.parse('22 Jan. 2012, 3:06 a.m.'),
          city: '',
          media: '',
          pages: '',
          accessed_at: '',
          url: 'https://twitter.com/tombrokaw/status/160996868971704320',
          online_database: '',
          doi: ''
        )
      end
      subject { helper.works_cited_citation(tweet).gsub(/\s+/, ' ').squish }
      it {
        should eq('@tombrokaw. &quot;SC demonstrated why all the debates are the engines of this campaign.&quot; <em>Twitter,</em> 22 Jan. 2012, 3:06 a.m., <a href="https://twitter.com/tombrokaw/status/160996868971704320">twitter.com/tombrokaw/status/160996868971704320</a>.')
      }
    end
  end

  describe '#list_names' do
    describe 'with one name' do
      before do
        citation.works_cited_contributors.authors.destroy_all
        FactoryBot.create(
          :works_cited_contributor,
          works_cited_citation: citation,
          contributor_role: 'author',
          first: 'Joseph',
          middle: 'James',
          last: 'Jackson',
          suffix: 'Jr.'
        )
      end
      subject { list_names(citation.works_cited_contributors.authors) }
      it { should eq 'Jackson, Joseph J, Jr.' }
    end
    describe 'with two names' do
      before do
        citation.works_cited_contributors.authors.destroy_all
        FactoryBot.create(
          :works_cited_contributor,
          works_cited_citation: citation,
          contributor_role: 'author',
          first: 'Joseph',
          middle: 'James',
          last: 'Jackson',
          suffix: 'Jr.'
        )
        FactoryBot.create(
          :works_cited_contributor,
          works_cited_citation: citation,
          contributor_role: 'author',
          first: 'Susan',
          middle: 'Sara',
          last: 'Sorenson',
          suffix: 'Sr.'
        )
      end
      subject { list_names(citation.works_cited_contributors.authors) }
      it { should eq 'Jackson, Joseph J, Jr., and Susan S Sorenson, Sr.' }
    end
    describe 'with more names' do
      before do
        citation.works_cited_contributors.authors.destroy_all
        FactoryBot.create(
          :works_cited_contributor,
          works_cited_citation: citation,
          contributor_role: 'author',
          first: 'Joseph',
          middle: 'James',
          last: 'Jackson',
          suffix: 'Jr.'
        )
        FactoryBot.create(
          :works_cited_contributor,
          works_cited_citation: citation,
          contributor_role: 'author',
          first: 'Susan',
          middle: 'Sara',
          last: 'Sorenson',
          suffix: 'Sr.'
        )
        FactoryBot.create(
          :works_cited_contributor,
          works_cited_citation: citation,
          contributor_role: 'author',
          first: 'Lara',
          middle: '',
          last: 'Lovelace',
          suffix: ''
        )
      end
      subject { list_names(citation.works_cited_contributors.authors) }
      it { should eq 'Jackson, Joseph J, Jr., et al' }
    end
  end
end
# rubocop:enable Layout/LineLength
