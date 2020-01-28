namespace :syc_data do
	desc "Synchronize Price From AWS Cloud Fornt "
	task :aws_syc => :environment do
	    PricingLoger.new.get_data
	end
end