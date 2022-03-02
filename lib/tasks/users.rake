namespace :users do
  desc "TODO"
  task export: :environment do
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet :name => 'Posts'
 
    posts = User.all
 
    posts.each_with_index do |post, i|
      sheet.row(i).push post.name, post.gender, post.dob, post.status
    end
    book.write 'Posts.xls'
  end

end
