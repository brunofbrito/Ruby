class Email
  # your class from the last exercise
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
  # your class from the last exercise
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

class MailboxHtmlFormatter
  # fill in this class body
  def initialize(mailbox)
    @mailbox = mailbox
  end

  def format()
  output_code = "<html>
  <head>
    <style>
      table {
        border-collapse: collapse;
      }
      td, th {
        border: 1px solid black;
        padding: 1em;
      }
    </style>
  </head>
  <body>"
   output_code << "\n\t<h1>#{@mailbox.groupname}</h1>"
   output_code <<  "\n\t<table>
        <thead>
          <tr>
            <th>Date</th>
            <th>From</th>
            <th>Subject</th>
          </tr>
        </thead>
        <tbody>"
   @mailbox.emails.each do |email|
      output_code << "\n\t<tr>\n"
      output_code << "\t\t<td>#{email.date}</td>\n"
      output_code << "\t\t<td>#{email.from}</td>\n"
      output_code << "\t\t<td>#{email.subject}</td>\n"
      output_code << "\t</tr>\n"
    end
    output_code << "\t</tbody>
    </table>
  </body>
</html>"
  end

end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxHtmlFormatter.new(mailbox)

puts formatter.format


# Your goal is to complete the code in a way so it outputs the following:

# <html>
#   <head>
#     <style>
#       table {
#         border-collapse: collapse;
#       }
#       td, th {
#         border: 1px solid black;
#         padding: 1em;
#       }
#     </style>
#   </head>
#   <body>
#     <h1>Ruby Study Group</h1>
#     <table>
#       <thead>
#         <tr>
#           <th>Date</th>
#           <th>From</th>
#           <th>Subject</th>
#         </tr>
#       </thead>
#       <tbody>
#         <tr>
#           <td>2014-12-01</td>
#           <td>Ferdous</td>
#           <td>Homework this week</td>
#         </tr>
#         <tr>
#           <td>2014-12-01</td>
#           <td>Dajana</td>
#           <td>Keep on coding! :)</td>
#         </tr>
#         <tr>
#           <td>2014-12-02</td>
#           <td>Ariane</td>
#           <td>Re: Homework this week</td>
#         </tr>
#       </tbody>
#     </table>
#   </body>
# </html>