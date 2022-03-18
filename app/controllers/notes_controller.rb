class NotesController < ApplicationController
  layout 'notes'

  before_action :authenticate
  before_action :set_note, only: %i[ show edit update destroy ]

  # GET /notes or /notes.json
  def index
    query = params[:q] ? Note.where('title LIKE ?', "%#{params[:q]}%") : Note.all
    @notes = query.order(created_at: :desc).limit(100)
  end

  # GET /notes/1 or /notes/1.json
  def show()
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html do
          redirect_to note_url(@note), notice: "Note was successfully created."
        end
        format.json { render :ashow, status: :created, location: @note }
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.prepend("sidebar-notes-list", partial: 'notes/note_list_item', locals: { note: @note }),
          ]
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.json { render :ashow, status: :ok, location: @note }
        format.html { redirect_to note_url(@note), notice: "Note was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to "/", notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def user
    User.last
  end

  def set_note
    @note = Note.find params[:id]
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.fetch(:note, {}).permit(:title, :body)
  end
end
