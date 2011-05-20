require 'rubygems'
require 'httparty'

class Accounts
  include HTTParty
  #doesn't seem to pick up env variable correctly if I set it here
  #headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  format :json
  # debug_output $stderr

  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    @root_url = ENV['sfdc_instance_url']+"/services/data/v"+ENV['sfdc_api_version']
  end
  
  def self.search(keyword)
    Accounts.set_headers
    soql = "SELECT Id, Name, BillingCity, BillingState, Phone from Account Where Name = \'#{keyword}\'"
    get(Accounts.root_url+"/query/?q=#{CGI::escape(soql)}")
  end
  
  def self.create()
    Accounts.set_headers
    headers 'Content-Type' => "application/json"
    
    options = {
      :body => {
          :Name => "1234"
      }.to_json
    }
    response = post(Accounts.root_url+"/sobjects/Account/", options)
    # puts response.body, response.code, response.message
  end
  
  def self.save(params)
    Accounts.set_headers
    headers 'Content-Type' => "application/json"
    
    options = {
      :body => {
          :billingcity => params[:BillingCity]
      }.to_json
    }
    p options
    response = post(Accounts.root_url+"/sobjects/Account/#{params[:id]}?_HttpMethod=PATCH", options)
    # 201 response.body equals success
    # puts response.body, response.code, response.message
  end
  
  def self.retrieve(id)
    Accounts.set_headers
    get(Accounts.root_url+"/sobjects/Account/#{id}?fields=Id,Name,BillingCity,BillingState,Phone,Website") 
  end
  
  def self.opportunities(accountId)
    Accounts.set_headers
    soql = "SELECT Id, Name, Amount, StageName, Probability, CloseDate from Opportunity where AccountId = \'#{accountId}\'"
    get(Accounts.root_url+"/query/?q=#{CGI::escape(soql)}")
  end
  
  def self.create_opp(params)
    Accounts.set_headers
    headers 'Content-Type' => "application/json"
    
    options = {
      :body => {
          :name => params[:name],
          :amount => params[:amount],
          :accountId => params[:id],
          :amount => params[:amount],
          :closeDate => params[:closeDate],
          :stageName => params[:stageName]
      }.to_json
    }
    response = post(Accounts.root_url+"/sobjects/Opportunity/", options)
    # 201 response.body equals success
    # puts response.body, response.code, response.message
  end
 
end