# == Schema Information
#
# Table name: useful_links
#
#  id                      :integer          not null, primary key
#  title                   :string
#  description             :string
#  useful_link_category_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  picture_file_name       :string
#  picture_content_type    :string
#  picture_file_size       :integer
#  picture_updated_at      :datetime
#  is_public               :boolean          default(FALSE), not null
#  url                     :string
#

require 'rails_helper'

RSpec.describe UsefulLink, type: :model do

  describe 'Interactions' do
    it 'belongs to a useful_link_category' do
      association=described_class.reflect_on_association(:useful_link_category)
      expect(association.macro).to eq :belongs_to
    end
    it 'has many comments' do
      association=described_class.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end
    it 'has many link interactions' do
      association=described_class.reflect_on_association(:link_interactions)
      expect(association.macro).to eq :has_many
    end
  end


  describe 'Link Interactions' do
    before(:each) do
      @user_id=1010;
      # we create the link
      @useful_link_to_read= FactoryGirl.create(:useful_link)
      @useful_link_read= FactoryGirl.create(:useful_link)
      @useful_link_useless= FactoryGirl.create(:useful_link)
      @useful_link_priority= FactoryGirl.create(:useful_link)

      @useful_link_naked= FactoryGirl.create(:useful_link)


      @useful_link_to_read.save!
      @useful_link_read.save!
      @useful_link_useless.save!
      @useful_link_priority.save!

      @useful_link_naked.save!
      # we create a TO READ interaction
      @to_read_link_interaction = FactoryGirl.create(:link_interaction, :interaction_type_id => InteractionType::TO_READ, :user_id => @user_id, :useful_link_id => @useful_link_to_read.id)
      # we create a READ interaction
      @read_link_interaction = FactoryGirl.create(:link_interaction, :interaction_type_id => InteractionType::ALREADY_READ, :user_id => @user_id, :useful_link_id => @useful_link_read.id)
      # we create a USELESS interaction
      @useless_link_interaction = FactoryGirl.create(:link_interaction, :interaction_type_id => InteractionType::USELESS, :user_id => @user_id, :useful_link_id => @useful_link_useless.id)
      # we create a PRIORITY interaction
      @priority_link_interaction = FactoryGirl.create(:link_interaction, :interaction_type_id => InteractionType::PRIORITY, :user_id => @user_id, :useful_link_id => @useful_link_priority.id)
    end

    it 'should be read when I indicate it was read' do
      @read_link_interaction.save!

      # now, our link should be marked as read
      expect(@useful_link_read.is_already_read?(@user_id)).to be true
    end

    it 'should not be marked as read by default' do
      expect(@useful_link_naked.is_already_read?(@user_id)).to be false
    end

    it 'should not be marked as priority by default' do
      expect(@useful_link_naked.is_priority?(@user_id)).to be false
    end

    it 'should not be marked as useless by default' do
      expect(@useful_link_naked.is_useless?(@user_id)).to be false
    end

    it 'should be to read by default' do
      expect(@useful_link_naked.is_to_read?(@user_id)).to be true
    end

    it 'should not be marked as read when we set an association to "TO READ"' do
      @to_read_link_interaction.save!
      expect(@useful_link_to_read.is_already_read?(@user_id)).to be false
    end

    it 'should not be to read when we I said I have to read it' do
      @to_read_link_interaction.save!
      expect(@useful_link_to_read.is_to_read?(@user_id)).to be true
    end

    it 'should not be to read when we set an association to "READ"' do
      @to_read_link_interaction.save!
      expect(@useful_link_read.is_to_read?(@user_id)).to be false
    end

    it 'should be in priority when I set the priority status' do
      @priority_link_interaction.save!
      expect(@useful_link_priority.is_priority?(@user_id)).to be true
    end

    it 'should not be marked as prioritized when I said it was useless' do
      @useless_link_interaction.save!
      expect(@useful_link_useless.is_priority?(@user_id)).to be false
    end

    it 'should be useless when I said it was useless' do
      @useless_link_interaction.save!
      expect(@useful_link_useless.is_useless?(@user_id)).to be true
    end



  end

  describe 'Validations' do
    before(:each) do
      @regular_link= FactoryGirl.create(:useful_link, title: 'Link for Law', description: 'This is a link talking about Law', useful_link_category_id: 1,
                                        url: 'lalal.fr', is_public: false)
    end

    it 'should be valid with a title, an url, a is_public option, a category' do
      expect(@regular_link).to be_valid
    end

    it 'should not be valid if the title is empty' do
      @regular_link.title=''
      expect(@regular_link).to_not be_valid
    end

    it 'should not be valid if the title is longer than 200 characters' do
      long_name='b'*300
      @regular_link.title=long_name
      expect(@regular_link).to_not be_valid
    end

    it 'should not be valid if the title is nil' do
      @regular_link.title=nil
      expect(@regular_link).to_not be_valid
    end

    it 'should not be valid if is_public is nil' do
      @regular_link.is_public=nil
      expect(@regular_link).to_not be_valid
    end

    it 'should not be valid if useful_link_category_id is nil' do
      @regular_link.useful_link_category_id=nil
      expect(@regular_link).to_not be_valid
    end

    it 'should not be public by default' do
      expect(@regular_link.is_public).to eq false
    end

    it 'should be public when we switch the is_public option' do
      @regular_link.toggle_public
      expect(@regular_link.is_public).to eq true
    end

    it 'should be private again when we switch the is_public option' do
      @regular_link.toggle_public
      @regular_link.toggle_public
      expect(@regular_link.is_public).to eq false
    end

    it 'should not have a nil url' do
      @regular_link.url=nil
      expect(@regular_link).to_not be_valid
    end

  end


  describe 'Scopes' do
    before(:each) do
      @link_for_law= FactoryGirl.create(:useful_link, title: 'Link for Law', description: 'This is a link talking about Law', useful_link_category_id: FakeLinkCategories::LAW, is_public:true)
      @link_for_money= FactoryGirl.create(:useful_link, title: 'Link for Money', description: 'This is a link talking about Money', useful_link_category_id: FakeLinkCategories::MONEY,is_public: false)
      @link_for_info= FactoryGirl.create(:useful_link, title: 'Link for Info', description: 'This is a link talking about Info', useful_link_category_id: FakeLinkCategories::INFO,is_public: false)
      @link_for_mentorship= FactoryGirl.create(:useful_link, title: 'Link for Mentorship', description: 'This is a link talking about Mentorship', useful_link_category_id: FakeLinkCategories::MENTORSHIP, is_public:true)
      @link_for_associates= FactoryGirl.create(:useful_link, title: 'Link for Associates', description: 'This is a link talking about Associates', useful_link_category_id: FakeLinkCategories::ASSOCIATES,is_public: false)
      @link_for_housing= FactoryGirl.create(:useful_link, title: 'Link for Housing', description: 'This is a link talking about Housing', useful_link_category_id: FakeLinkCategories::HOUSING,is_public: false)
      @link_for_ideas= FactoryGirl.create(:useful_link, title: 'Link for Ideas', description: 'This is a link talking about Ideas', useful_link_category_id: FakeLinkCategories::IDEAS, is_public:true)
      @link_for_technical= FactoryGirl.create(:useful_link, title: 'Link for Technical', description: 'This is a link talking about Technical', useful_link_category_id: FakeLinkCategories::TECHNICAL,is_public: false)
      @link_for_technical_second= FactoryGirl.create(:useful_link, title: 'Second Link for Technical', description: 'This is a Second link talking about Technical', useful_link_category_id: FakeLinkCategories::TECHNICAL,is_public: false)

      @array_of_links=[@link_for_law,@link_for_money,@link_for_info,@link_for_mentorship,@link_for_associates,
                      @link_for_housing,@link_for_ideas,@link_for_technical,@link_for_technical_second]
      @array_of_links.each(&:save)

    end
    it 'shows the right number of links for public links' do
      results = UsefulLink.public_links
      expect(results.count).to eq 3
    end

    it 'shows the right number of links for public links with category joined' do
      results = UsefulLink.public_links_with_categories
      expect(results.count).to eq 3
    end

    it 'shows the right number of links for not public links' do
      results = UsefulLink.private_links
      expect(results.count).to eq (@array_of_links.count()-3)
    end

    it 'shows all the links for reverse order' do
      results = UsefulLink.reverse_order
      expect(results.count).to eq @array_of_links.count()
    end

    it 'shows all the links for natural order' do
      results = UsefulLink.natural_order
      expect(results.count).to eq @array_of_links.count()
    end

    it 'respects the reversed order' do
      results = UsefulLink.reverse_order
      expect(results.index(@link_for_technical_second)).to be < results.index(@link_for_associates)
      expect(results.index(@link_for_associates)).to be < results.index(@link_for_law)

    end

    it 'respects the natural order' do
      results = UsefulLink.natural_order
      expect(results.index(@link_for_law)).to be < results.index(@link_for_associates)
      expect(results.index(@link_for_associates)).to be < results.index(@link_for_technical_second)
    end

    it 'shows one link for law scope' do
      results = UsefulLink.law
      expect(results.count).to eq 1
    end

    it 'shows one link for money scope' do
      results = UsefulLink.money
      expect(results.count).to eq 1
    end

    it 'shows one link for info scope' do
      results = UsefulLink.info
      expect(results.count).to eq 1
    end

    it 'shows one link for mentorship scope' do
      results = UsefulLink.mentorship
      expect(results.count).to eq 1
    end

    it 'shows one link for associates scope' do
      results = UsefulLink.associates
      expect(results.count).to eq 1
    end

    it 'shows one link for housing scope' do
      results = UsefulLink.housing
      expect(results.count).to eq 1
    end

    it 'shows one link for ideas scope' do
      results = UsefulLink.ideas
      expect(results.count).to eq 1
    end

    it 'shows two links for technical scope' do
      results = UsefulLink.technical
      expect(results.count).to eq 2
    end

    it 'shows no link for BOTH technical and ideas scope' do
      results = UsefulLink.technical.ideas
      expect(results.count).to eq 0
    end




  end






end
