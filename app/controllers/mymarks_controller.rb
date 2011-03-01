class MymarksController < ApplicationController
  # GET /mymarks
  # GET /mymarks.xml
  def index
    @mymarks = Mymark.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mymarks }
    end
  end

  # GET /mymarks/1
  # GET /mymarks/1.xml
  def show
    @mymark = Mymark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mymark }
    end
  end

  # GET /mymarks/new
  # GET /mymarks/new.xml
  def new
    @marks=Mark.all
    @mymark = Mymark.new
    @mymark.user_id = current_user.id
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mymark }
    end
  end

  # GET /mymarks/1/edit
  def edit
    @mymark = Mymark.find(params[:id])
  end

  # POST /mymarks
  # POST /mymarks.xml
  def create
    @marks=Mark.all
    @mymark = Mymark.new(params[:mymark])
    #force the user_id to the current user, so they can't do crazy stuff in the form.
    @mymark.user_id=current_user.id
    respond_to do |format|
      if @mymark.save
        format.html { redirect_to(@mymark, :notice => 'Mymark was successfully created.') }
        format.xml  { render :xml => @mymark, :status => :created, :location => @mymark }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mymark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mymarks/1
  # PUT /mymarks/1.xml
  def update
    @mymark = Mymark.find(params[:id])

    respond_to do |format|
      if @mymark.update_attributes(params[:mymark])
        format.html { redirect_to(@mymark, :notice => 'Mymark was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mymark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mymarks/1
  # DELETE /mymarks/1.xml
  def destroy
    @mymark = Mymark.find(params[:id])
    @mymark.destroy

    respond_to do |format|
      format.html { redirect_to(mymarks_url) }
      format.xml  { head :ok }
    end
  end
end
