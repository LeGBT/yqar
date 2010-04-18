class RepSourcesController < ApplicationController
  # GET /rep_sources
  # GET /rep_sources.xml
  def index
    @rep_sources = RepSource.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rep_sources }
    end
  end

  # GET /rep_sources/1
  # GET /rep_sources/1.xml
  def show
    @rep_source = RepSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rep_source }
    end
  end

  # GET /rep_sources/new
  # GET /rep_sources/new.xml
  def new
    @rep_source = RepSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rep_source }
    end
  end

  # GET /rep_sources/1/edit
  def edit
    @rep_source = RepSource.find(params[:id])
  end

  # POST /rep_sources
  # POST /rep_sources.xml
  def create
    @rep_source = RepSource.new(params[:rep_source])

    respond_to do |format|
      if @rep_source.save
        format.html { redirect_to(@rep_source, :notice => 'Rep source was successfully created.') }
        format.xml  { render :xml => @rep_source, :status => :created, :location => @rep_source }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rep_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rep_sources/1
  # PUT /rep_sources/1.xml
  def update
    @rep_source = RepSource.find(params[:id])

    respond_to do |format|
      if @rep_source.update_attributes(params[:rep_source])
        format.html { redirect_to(@rep_source, :notice => 'Rep source was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rep_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rep_sources/1
  # DELETE /rep_sources/1.xml
  def destroy
    @rep_source = RepSource.find(params[:id])
    @rep_source.destroy

    respond_to do |format|
      format.html { redirect_to(rep_sources_url) }
      format.xml  { head :ok }
    end
  end
end
