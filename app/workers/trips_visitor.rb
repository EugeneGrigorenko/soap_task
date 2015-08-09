class TripsVisitor
  include Singleton

  def mark_visited_countries
    Trips.where('end_date < (?) AND finished = false', Date.today)
      .find_in_batches.each(&:mark_visited_countries)
  end
end
