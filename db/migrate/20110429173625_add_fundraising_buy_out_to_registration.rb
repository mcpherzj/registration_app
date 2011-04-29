class AddFundraisingBuyOutToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :fundraising_buy_out, :boolean
  end

  def self.down
    remove_column :registrations, :fundraising_buy_out
  end
end
