# == Schema Information
#
# Table name: wikis
#
#  id         :integer          not null, primary key
#  name       :string
#  logo_url   :string
#  site_type  :string
#  editor     :string
#  owner      :string
#  url        :string
#  founded    :integer
#  created    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'wikipedia'
class Wiki < ApplicationRecord

  def self.fetch_by_names(names)
    names.map! do |name|
      name.split(" ").join("%20")
    end
    name_query = names.join("|")
    markups = HTTParty.get("https://en.wikipedia.org/w/api.php?action=query&titles=#{name_query}&format=json&formatversion=2&prop=revisions&rvprop=content&rvsection=0")

    wikis = []

    markups["query"]["pages"].each do |markup|
      wiki = Wiki.new
      markup["revisions"][0]["content"].split("{{Infobox")[1].split("\n")
      .select { |ele| ele.start_with?("|") }
      .each do |ele|
        case ele
        when /\A\| title/
          wiki.name = ele.split("=")[1].strip.delete("[]{}'")
          p wiki.name
        when /\A\|title/
          wiki.name = ele.split("=")[1].strip.delete("[]{}'")
          p wiki.name
        when /\A\| name/
          wiki.name = ele.split("=")[1].strip.delete("[]{}'")
          p wiki.name
        when /\A\| logo /
          wiki.logo_url = ele.split("=")[1].strip.delete("[]{}'").split("|")[0]
          wiki.logo_url.slice!("File:")
          p wiki.logo_url
        when /\A\|logo /
          wiki.logo_url = ele.split("=")[1].strip.delete("[]{}'").split("|")[0]
          wiki.logo_url.slice!("File:")
          p wiki.logo_url
        when /\A\|image_file /
          wiki.logo_url = ele.split("=")[1].strip.delete("[]{}'").split("|")[0]
          wiki.logo_url.slice!("File:")
          p wiki.logo_url
        when /\A\| type/
          wiki.site_type = ele.split("=")[1].strip.delete("[]")
          p wiki.site_type
        when /\A\|type/
          wiki.site_type = ele.split("=")[1].strip.delete("[]")
          p wiki.site_type
        when /\A\| editor/
          wiki.editor = ele.split("=")[1].strip.delete("[]")
          p wiki.editor
        when /\A\|editor/
          wiki.editor = ele.split("=")[1].strip.delete("[]")
          p wiki.editor
        when /\A\| owner/
          wiki.owner = ele.split("=")[1].strip.delete("[]").split("<br>").join(", ")
          p wiki.owner
        when /\A\| url/
          wiki.url = ele.split("=")[1].strip.delete("[]{}'")
          wiki.url.slice!("URL|")
          p wiki.url
        when /\A\| website/
          wiki.url = ele.split("=")[1].strip.delete("[]{}'").split("|")[1]
          p wiki.url
        when /\A\|website/
          wiki.url = ele.split("=")[1].strip.delete("[]{}'").split("|")[1]
          p wiki.url
        when /\A\| founded/
          wiki.founded = ele.split("=")[1].split("{{start date")[1].split("|")[1]
          p wiki.founded
        when /\A\| launch date/
          wiki.founded = ele.split("=")[1].split("{{start date")[1].split("|")[1]
          if wiki.founded.zero?
            wiki.founded = ele.split("{{start date")[1].split("|")[2]
          end
          p wiki.founded
        when /\A\| launch_date/
          wiki.founded = ele.split("=")[1].split("{{start date")[1].split("|")[1]
          p wiki.founded
        when /\A\|firstdate/
          wiki.founded = ele.split("=")[1].split("{{start date")[1].split("|")[1]
          p wiki.founded
        when /\A\| author/
          wiki.created = ele.split("=")[1].strip.delete("[]{}'").split("<br>").join(", ")
          p wiki.created
        end
      end
      wikis << wiki
    end
    wikis

  end
end
