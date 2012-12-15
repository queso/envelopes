class IncomesController < ApplicationController
  # GET /incomes
  # GET /incomes.json
  def index
    @incomes = Income.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incomes }
    end
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
    @income = Income.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @income }
    end
  end

  # GET /incomes/new
  # GET /incomes/new.json
  def new
    @income = Income.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @income }
    end
  end

  # GET /incomes/1/edit
  def edit
    @income = Income.find(params[:id])
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = Income.new(income_params)

    respond_to do |format|
      if @income.save
        format.html { redirect_to @income, notice: 'Income was successfully created.' }
        format.json { render json: @income, status: :created, location: @income }
      else
        format.html { render action: "new" }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    @income = Income.find(params[:id])

    respond_to do |format|
      if @income.update_attributes(income_params)
        format.html { redirect_to @income, notice: 'Income was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income = Income.find(params[:id])
    @income.destroy

    respond_to do |format|
      format.html { redirect_to incomes_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example: params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def income_params
      params.require(:income).permit(:amount, :day_of_month, :recurring, :every_x_weeks, :start_date)
    end
end
