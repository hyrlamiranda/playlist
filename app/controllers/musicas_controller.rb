class MusicasController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /musicas
  # GET /musicas.json
  def index
    @musicas = Musica.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @musicas }
    end
  end

  # GET /musicas/1
  # GET /musicas/1.json
  def show
    @musica = Musica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @musica }
    end
  end

  def my_musics
    @musics = Musica.where(:user_id => current_user.id)

    respond_to do |format|
      format.html
      format.json{ render json: @musica }
    end
  end

  # GET /musicas/new
  # GET /musicas/new.json
  def new
    @musica = Musica.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @musica }
    end
  end

  # GET /musicas/1/edit
  def edit
    @musica = Musica.find(params[:id])
  end

  # POST /musicas
  # POST /musicas.json
  def create
    @musica = Musica.new(params[:musica])
    @musica.user_id = current_user.id
    respond_to do |format|
      if @musica.save
        format.html { redirect_to @musica, notice: 'Musica was successfully created.' }
        format.json { render json: @musica, status: :created, location: @musica }
      else
        format.html { render action: "new" }
        format.json { render json: @musica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /musicas/1
  # PUT /musicas/1.json
  def update
    @musica = Musica.find(params[:id])

    respond_to do |format|
      if @musica.update_attributes(params[:musica])
        format.html { redirect_to @musica, notice: 'Musica was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @musica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musicas/1
  # DELETE /musicas/1.json
  def destroy
    @musica = Musica.find(params[:id])
    @musica.destroy

    respond_to do |format|
      format.html { redirect_to musicas_url }
      format.json { head :no_content }
    end
  end
  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "playlist" && password == "playlist"
    end
  end
end
