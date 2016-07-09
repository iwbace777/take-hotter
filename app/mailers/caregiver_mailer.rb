class CaregiverMailer < ActionMailer::Base
  default from: "darren@TakeHotter.com"

  def send_greeting_email caregiver
  	@caregiver = caregiver
  	# attachments['welcome_packet.pdf'] = File.read('/Users/kyleszives/Documents/TakeHotter/invocies/oct20-26-szives.pdf')
  	mail to: caregiver.email, subject: 'Welcome to TakeHotter!'
  end

  def send_missing_info caregiver
  	@caregiver = caregiver
  	mail to: caregiver.email, from: 'team@TakeHotter.com', subject: "TakeHotter - Your profile is almost approved! We just need ..."
  end

  def send_approval_email caregiver
    @caregiver = caregiver

    mail to: caregiver.email, subject: "You've been approved!"
  end

  def send_caregiver_toolkit caregiver
    @caregiver = caregiver

    attachments['caregiver-article-interview-questions.pdf'] = File.read(TakeHotter::Application.assets.find_asset('caregiver-article-interview-questions.pdf').pathname.to_s)

    mail to: @caregiver.email, subject: "Thank you for applying to a care job!"
  end

  def send_family_is_checking_you_out caregiver, contract
    @caregiver = caregiver
    @contract = contract

    mail to: @caregiver.email, subject: "Hi #{@caregiver.first_name}, a family was checking out your profile"
  end
end
