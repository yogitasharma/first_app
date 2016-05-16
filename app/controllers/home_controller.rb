class HomeController < ApplicationController 
	layout 'application'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 def index
 end

  def homepage
    @notices= Notice.last(10)
  end

  def videos
  end

  def tutorials
  end

  def facultydetails
  end

  def querypage
  end

  def contactdetails
    if(params[:email].blank?|| params[:name].blank? || params[:message].blank?)
      flash[:errorquery]="Please fill all fields."
      flash[:noticequery]=''
    else
      emailquery=Queryemail.new
      emailquery.email=params[:email]
      emailquery.name=params[:name]
      emailquery.message=params[:message]
      emailquery.toemail='sharmayogita25@gmail.com'
      emailquery.save
    Usermailer.query_email(params[:name],params[:email],params[:message]).deliver
    flash[:errorquery]=''
    flash[:noticequery]="Successfully sent"
  end
  redirect_to :back
  end

  def contactadmin
    
  end

  def updatefaculty
  end

  def updatefacultydetails
    if(params[:name].blank?|| params[:department].blank? || params[:email].blank? || params[:description].blank? || params[:post].blank?)
      flash[:errorfaculty]="Please fill all fields."
      flash[:noticefaculty]=''
    else
      facultydetail= FacultyDetail.where('member_id=?',current_member.id).first
      if !facultydetail.blank?
      facultydetail.email=params[:email]
      facultydetail.name=params[:name]
      facultydetail.description=params[:description]
      facultydetail.post=params[:post]
      facultydetail.department=params[:department]
      facultydetail.save
      else
      facultydetail=FacultyDetail.new
      facultydetail.email=params[:email]
      facultydetail.name=params[:name]
      facultydetail.description=params[:description]
      facultydetail.post=params[:post]
      facultydetail.department=params[:department]
      facultydetail.member_id= current_member.id
      facultydetail.save 
  end
   flash[:errorfaculty]=''
    flash[:noticefaculty]="Successfully saved"
  end
  redirect_to :back
end

  def facultycontact
    @faculty=FacultyDetail.where('id=?',params[:id]).first 
  end

  def facultycontactdetails
    @faculty=FacultyDetail.where('id=?',params[:faculty_id]).first 
     if(params[:email].blank?|| params[:name].blank? || params[:message].blank?)
      flash[:error1]="Please fill all fields."
      flash[:notice1]=''
    else
      emailquery=Queryemail.new
      emailquery.email=params[:email]
      emailquery.name=params[:name]
      emailquery.message=params[:message]
      emailquery.toemail=@faculty.email
      emailquery.save
    Usermailer.queryto_faculty_email(params[:name],params[:email],params[:message],@faculty.email).deliver
    flash[:error1]=''
    flash[:notice1]="Successfully sent"
  end
  redirect_to :back
  end

  def allfacultydetails
    @faculties= FacultyDetail.all
  end

  def notce
  end

  def noticeupdate
    if(params[:subject].blank?|| params[:department].blank? || params[:noticedescription].blank?)
      flash[:error]="Please fill all required fields."
      flash[:noticeerr]=''
    else
      noticedetail=Notice.new
      noticedetail.subject=params[:subject]
      noticedetail.description=params[:noticedescription]
      if !params[:semester].blank?
        noticedetail.semester=params[:semester]
      end
      noticedetail.department=params[:department]
      noticedetail.save 
      flash[:error]=''
       flash[:noticeerr]="Successfully saved"
  end
  redirect_to :back
  end
end