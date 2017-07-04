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
        when /\A\|title/
          wiki.name = ele.split("=")[1].strip.delete("[]{}'")
        when /\A\| name/
          wiki.name = ele.split("=")[1].strip.delete("[]{}'")
        when /\A\| logo /
          wiki.logo_url = ele.split("=")[1].strip.delete("[]{}'").split("|")[0]
          wiki.logo_url.slice!("File:")
        when /\A\|logo /
          wiki.logo_url = ele.split("=")[1].strip.delete("[]{}'").split("|")[0]
          wiki.logo_url.slice!("File:")
        when /\A\|image_file /
          wiki.logo_url = ele.split("=")[1].strip.delete("[]{}'").split("|")[0]
          wiki.logo_url.slice!("File:")
        when /\A\| type/
          wiki.site_type = ele.split("=")[1].strip.delete("[]").split("|").join(", ")
        when /\A\|type/
          wiki.site_type = ele.split("=")[1].strip.delete("[]").split("|").join(", ")
        when /\A\| editor/
          wiki.editor = ele.split("=")[1].strip.delete("[]")
        when /\A\|editor/
          wiki.editor = ele.split("=")[1].strip.delete("[]")
        when /\A\| owner/
          wiki.owner = ele.split("=")[1].strip.delete("[]").split("<br>").join(", ")
        when /\A\| url/
          wiki.url = ele.split("=")[1].strip.delete("[]{}'")
          wiki.url.slice!("URL|")
          wiki.url = wiki.url.split("|")[0].split(" ")[0]
        when /\A\| website/
          wiki.url = ele.split("=")[1].strip.delete("[]{}'").split("|")[1]
          wiki.url = wiki.url.split("|")[0].split(" ")[0]
        when /\A\|website/
          wiki.url = ele.split("=")[1].strip.delete("[]{}'").split("|")[1]
          wiki.url = wiki.url.split("|")[0].split(" ")[0]
        when /\A\| founded/
          wiki.founded = ele.split("=")[1].split("{{start date")[1].split("|")[1]
        when /\A\| launch date/
          wiki.founded = ele.split("=")[1].split("{{start date")[1].split("|")[1]
          wiki.founded = ele.split("{{start date")[1].split("|")[2] if wiki.founded.zero?
        when /\A\| launch_date/
          wiki.founded = ele.split("=")[1].split("{{start date")[1].split("|")[1]
        when /\A\|firstdate/
          wiki.founded = ele.split("=")[1].split("{{start date")[1].split("|")[1]
        when /\A\| author/
          wiki.created = ele.split("=")[1].strip.delete("[]{}'").split("<br />").join(", ").split("<")[0]
        end
      end
      wikis << wiki
    end
    wikis
  end
end
