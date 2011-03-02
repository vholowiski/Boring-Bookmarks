class MymarksController < ApplicationController
before_filter :authenticate_user!
  # GET /mymarks
  # GET /mymarks.xml
  def index
    if params[:show_location]
    @mymarks = Mymark.find_all_by_location_id(params[:show_location])
    else
    @mymarks = Mymark.all
    end

    @locations = Location.find_all_by_user_id(current_user.id)
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
    @locations = Location.find_all_by_user_id(current_user.id)
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
    @locations = Location.find_all_by_user_id(current_user.id)
  end

  # POST /mymarks
  # POST /mymarks.xml
  def create
    @marks=Mark.all
    @locations = Location.find_all_by_user_id(current_user.id)
    @mymark = Mymark.new(params[:mymark])
    #force the user_id to the current user, so they can't do crazy stuff in the form.
    @mymark.user_id=current_user.id

    #ok, this could get complicated. take params[:mymark.mark_id] (which is actually the url)
    #see if it exists. If so, replace mark_id with the id, otherwise create it, then replace it.
    @mark=Mark.find_by_url(params[:mymark][:mark_id])
    
    #if there is no @mark.id, then create a @mark
    if @mark == nil
	@mark=Mark.new
        @mark.url = params[:mymark][:mark_id]
	@mark.name = params[:mymark][:mark_id]
	@mark.save
    end
    
    #finally, set the mark.id
    @mymark.mark_id=@mark.id

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
    @locations = Location.find_all_by_user_id(current_user.id)
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
