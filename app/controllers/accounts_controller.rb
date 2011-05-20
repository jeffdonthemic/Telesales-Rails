require 'accounts'

class AccountsController < ApplicationController
  def index
  end
  
  def search
    @json = Accounts.search(params[:accountName])
  end
  
  def show
    @account = Accounts.retrieve(params[:id])
    @opportunities = Accounts.opportunities(params[:id])    
  end
  
  def create
     @account = Accounts.create
  end
  
  def edit
     @account = Accounts.retrieve(params[:id])
  end
  
  def save
    Accounts.save(params)
    redirect_to :action => :show, :id => params[:id]
  end  
  
  def new_opp 
    @account = Accounts.retrieve(params[:id])
  end
  
  def save_opp
    # Accounts.create_opp(params)
    puts params[:id]
    redirect_to :action => :show, :id => params[:id]
  end

end
