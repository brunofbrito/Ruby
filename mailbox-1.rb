class Email

  def initialize(subject,hash)
    @subject = subject
    @date = hash[:date]
    @from = hash[:from]
  end

  def date
    @date 
  end

  def from
    @from
  end

  def subject
    @subject
  end

end

class Mailbox
  
  def initialize(groupname,emails)
    @groupname = groupname
    @emails = emails
  end

  def emails
    @emails
  end

  def groupname
    @groupname
  end

end

emails = [
  Email.new("Homework this week! :)", {:date => "2014-12-01", :from => "Bruno"}),   
  Email.new("Keep on coding! :)", {:date => "2014-12-02", :from => "Ferdous"}),
  Email.new("Re: Homework this week! :)", {:date => "2014-12-04", :from => "Brock"})
]

mailbox = Mailbox.new("Ruby Study Group", emails)

mailbox.emails.each do |email|
  puts "Date: #{email.date}"
  puts "From: #{email.from}"
  puts "Subject: #{email.subject}"
  puts
end