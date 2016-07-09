class TextMessageJob < ActiveJob::Base
  queue_as :default

  def perform(caregiver)
    easy = SMSEasy::Client.new
    easy.deliver(caregiver.phone, caregiver.carrier, 'HI! A new care job has been posted on TakeHotter in your area. Go to www.TakeHotter.com and login to apply. Good luck!')
  end
end
