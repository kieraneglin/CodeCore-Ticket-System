class TicketsController < ApplicationController
  def main
    params[:page] ||= 1
    @t = Ticket.all.order('status ASC, created_at ASC').page(params[:page]).per(10)
  end

  def query
    redirect_to search_page_path(params[:search][:search_term], 1)
  end

  def search
    params[:page] ||= 1
    term = params[:query]
    @t = Ticket.all.where('created_by ilike ? OR created_by_email ilike ? OR body ilike?', "%#{term}%", "%#{term}%", "%#{term}%").page(params[:page]).per(10)
    # redirect_to search_page_path('t', 1)
  end

  def new
    @t = Ticket.new
  end

  def create
    @t = Ticket.new(allowed_new_ticket_params)

    if @t.save
      redirect_to show_path(@t)
    else
      render :new
    end
  end

  def show
    @t = Ticket.find(params[:id])
  end

  def edit
    @t = Ticket.find(params[:id])
  end

  def update
    @t = Ticket.find(params[:id])

    if @t.update(allowed_new_ticket_params)
      redirect_to show_path(@t)
    else
      render :edit
    end
  end

  def destroy
    @t = Ticket.find(params[:id])
    @t.destroy

    redirect_to root_path
  end

  def done
    @t = Ticket.find(params[:id])
    @t.toggle!(:status)

    redirect_to root_path
  end

  private

  def allowed_new_ticket_params
    params.require(:ticket).permit(:title, :body, :created_by, :created_by_email, :department)
  end
end
