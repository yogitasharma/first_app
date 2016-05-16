class Usermailer < ApplicationMailer
	 default from: 'notifications@example.com'
   
   def query_email(name,email,message)
   	@name=name
   	@emailid=email
   	@message=message
       mail(to: 'sharmayogita25@gmail.com', subject: 'Query email from elearning Site')
   end

   def queryto_faculty_email(name,email,message,toemail)
   	@name=name
   @message=message
   	@emailfrom=email
       mail(to: toemail, subject: 'Student query email from elearning Site')
   end
end
