class DbtController < ApplicationController
  before_action :logged_in?, :survey_not_completed?
  def show
    @entry = current_user.journal_entries.new
    @quote = DbtQuote.all.sample
  end
end
