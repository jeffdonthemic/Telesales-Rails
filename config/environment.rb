# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
OmniauthDemo::Application.initialize!

# Set our instance URL for Force.com
#ENV['sfdc_instance_url'] = 'https://na6.salesforce.com'
ENV['sfdc_api_version'] = '21.0'
#ENV['token'] = '00D700000009Bki!ARQAQMKKyIvm0OpWWCuxnLRJ8nQJnWkrtyyhNgWYN.3doM7upsbmFBZK4DD7LwT5CL_EE76DkmzAtIIqtcoAXszagls.s63U'
#ENV['sfdc_instance_url'] = "https://na5.salesforce.com"