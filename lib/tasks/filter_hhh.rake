namespace :filter do
  desc "Create hit lists for all active housing filters"
  task hhh: :environment do

    Filter.all.each do |filter|
      puts "Generating hit list for filter #{filter.id}"
      Listing.apply(filter)

    end

  end

end