class UserMailer < ActionMailer::Base
  default from: "darren@TakeHotter.com"

  def send_greeting_email user 
    @user = user 
    # attachments['welcome_packet.pdf'] = File.read('/Users/kyleszives/Documents/TakeHotter/invocies/oct20-26-szives.pdf')
    mail to: user.email, subject: "Welcome to TakeHotter #{@user.first_name}"
  end

  def send_interview_guide_email user 
    @user = user 
    attachments['TakeHotter-family-interview-questions.pdf'] = File.read(TakeHotter::Application.assets.find_asset('TakeHotter-family-interview-questions.pdf').pathname.to_s)
    attachments['TakeHotter-care-plan.docx'] = File.read(TakeHotter::Application.assets.find_asset('TakeHotter-care-plan.docx').pathname.to_s)
    attachments['TakeHotter-onboarding-caregiver.pdf'] = File.read(TakeHotter::Application.assets.find_asset('TakeHotter-onboarding-caregiver.pdf').pathname.to_s)

    mail to: user.email, subject: "TakeHotter Interview and Hiring Toolkit"
  end
end
