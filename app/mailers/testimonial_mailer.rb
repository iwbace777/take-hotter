class TestimonialMailer < ActionMailer::Base
  default from: "team@TakeHotter.com"

  def send_testimonial_request_mail email, caregiver
  	@caregiver = caregiver
  	mail :to => email, :subject => "#{@caregiver.first_and_last_initial} would like a reference on TakeHotter."
  end
end