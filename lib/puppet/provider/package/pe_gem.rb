require 'puppet/provider/package'
require 'uri'

# Ruby gems support.
Puppet::Type.type(:package).provide :pe_gem, :parent => :gem do
  desc "Puppet Enterprise Ruby Gem support. If a URL is passed via `source`, then
    that URL is used as the remote gem repository; if a source is present but is
    not a valid URL, it will be interpreted as the path to a local gem file.  If
    source is not present at all, the gem will be installed from the default gem
    repositories."

  has_feature :versionable

  exe = Facter.fact(:operatingsystem) == :windows ? 'C:/Program Files (x86)/Puppet Labs/Puppet Enterprise/sys/ruby/bin/gem' : '/opt/puppet/bin/gem'

  commands :gemcmd => exe
end
