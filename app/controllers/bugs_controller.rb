class BugsController < ApplicationController
  before_action :set_bug, only: %i[ show edit update destroy ]
  

  # GET /bugs or /bugs.json
  def index
    @users=User.all
    @bugs = policy_scope(Bug.all)
    authorize Bug
  end

  # GET /bugs/1 or /bugs/1.json
  def show
    authorize Bug
  end

  # GET /bugs/new
  def new
    @users=User.all
    @bug = Bug.new
    authorize Bug
  end

  # GET /bugs/1/edit
  def edit
    @users=User.all
    authorize Bug
  end

  # POST /bugs or /bugs.json
  def create
    authorize Bug
    @bug = Bug.new(bug_params)

    respond_to do |format|
      if @bug.save
        format.html { redirect_to @bug, notice: "Bug was successfully created." }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bugs/1 or /bugs/1.json
  def update
    @bug = Bug.find(params[:id])
    authorize @bug
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to @bug, notice: "Bug was successfully updated." }
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1 or /bugs/1.json
  def destroy
    authorize Bug
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to bugs_url, notice: "Bug was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      # authorize Bug
      @bug = Bug.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bug_params
      params.require(:bug).permit(:title, :description, :status,:image)
    end
end
