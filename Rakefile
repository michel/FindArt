require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/FindArt'

Hoe.plugin :newgem
# Hoe.plugin :website
Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'findart' do
  self.developer 'Michel de Graaf', 'michel@re-invention.nl'
  self.rubyforge_name       = "findart"
  self.extra_deps         = [['mechanize','>=0.9.3'],
                            ["newgem",">=1.5.2"],
                            ["commander",">=3.2.9"]
                            ]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# remove_task :default
# task :default => [:spec, :features]
