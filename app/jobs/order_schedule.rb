
class OrderSchedule < ActiveJob::Base

  def perform
    SchedulingOrderController.scheduling_order
  end

end