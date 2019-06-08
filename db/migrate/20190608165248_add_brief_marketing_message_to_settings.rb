class AddBriefMarketingMessageToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :brief_marketing_message, :string
  end
end
