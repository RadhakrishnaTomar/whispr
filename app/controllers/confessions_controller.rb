class ConfessionsController < ApplicationController
  def index
    @confessions = Confession.recent
    @confession = Confession.new
  end

  def create
    ip = request.remote_ip
    if Confession.where(ip: ip).where("created_at >= ?", Time.zone.now.beginning_of_day).count >= 3
      redirect_to root_path, alert: "You have reached your posting limit for today."
      return
    end

    @confession = Confession.new(confession_params.merge(ip: ip))
    if @confession.save
      redirect_to root_path, notice: "Your confession has been posted."
    else
      render :index
    end
  end

  def trending
    @confessions = Confession
      .left_joins(:reactions)
      .group("confessions.id")
      .order(Arel.sql("COUNT(reactions.id) DESC, confessions.created_at DESC"))
  end

  private

  def confession_params
    params.require(:confession).permit(:body)
  end
end
