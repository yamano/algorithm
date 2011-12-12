watch("^(.*).rb") { |m| system("rspec ./#{m[1]}_spec.rb") }
watch("^(.*)_spec.rb") { |m| system("rspec ./#{m[1]}_spec.rb") }
