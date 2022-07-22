# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

require File.expand_path(File.dirname(__FILE__) + "/environment") # Rails.rootを使用するために必要
rails_env = Rails.env.to_sym # cronを実行する環境変数
set :environment, rails_env # cronを実行する環境変数をセット
set :output, 'log/cron.log' # cronのログの吐き出し場所
every 1.day, at: '0:00 am' do # 毎日午前9時に実行
# rubocop:disable all
  begin
    runner "Batch::InformationUpdate.informationUpdate"
    runner "Batch::CouponDelete.couponDelete"
    # runner "Batch::InformationMailer.informationMailer"
  rescue => e
    Rails.logger.error("aborted rails runner")
    raise e
  end
# rubocop:enable all
end
