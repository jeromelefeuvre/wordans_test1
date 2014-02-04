# -*- encoding : utf-8 -*-
#!/usr/bin/env ruby

class User
  require 'active_support/all'

  attr_accessor :id, :name, :email, :created_at

  def initialize(attrs = {})
    attrs.each_pair { |attr, value| send("#{attr}=", value) if respond_to?("#{attr}=") }
  end
end

user1 = User.new(:id => 1, :name => "foo", :email => "foo@example.com", :created_at => Time.now)
user2 = User.new(:id => 2, :name => "bar", :email => "bar@example.com", :created_at => Time.now)
user3 = User.new(:id => 3, :name => "baz", :email => "baz@example.com", :created_at => Time.now)
user4 = User.new(:id => 4, :name => "qux", :email => "quz@example.com", :created_at => Time.now)

users = [user1, user2, user3, user4]

class Exporter
  require 'csv'

  attr_accessor :columns

  def initialize(attrs = {})
    attrs.each_pair { |attr, value| send("#{attr}=", value) if respond_to?("#{attr}=") }
  end

  def export(datas)
    CSV.open(friendly_filename, "w") do |csv|
      csv << columns

      datas.each do |data|
        csv << columns.collect{|column| data.try(column)}
      end
    end
  end

  private
  def friendly_filename
    "Export-#{Time.now.strftime("%Y-%m-%d-%H%M%S")}.csv"
  end
end

exporter = Exporter.new(columns: %w(id name email created_at))
puts exporter.export(users)
