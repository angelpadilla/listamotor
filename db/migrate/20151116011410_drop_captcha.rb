class DropCaptcha < ActiveRecord::Migration
  def change
  	drop_table :simple_captcha_data
  end
end
