#!/usr/bin/env rake

task :sync do
  `ebooks archive destroytoday corpus/destroytoday.json`
  `ebooks consume corpus/destroytoday.json`
end