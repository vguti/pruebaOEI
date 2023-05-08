class CoursesController < ApplicationController
  def select
    criteria = params[:criteria]
    editions = params[:editions]
    selected_courses = []
    search_type = search_school = search_closest = search_latest = nil
    criteria.each do |c|
      if c.include?("type-")
        search_type = c.gsub("type-","")
      end
      if c.include?("school-")
        search_school = c.gsub("school-","")
      end
      if criteria.include?('closest')
        search_closest = true
      end
      if criteria.include?('latest')
        search_latest = true
      end
      if search_closest && search_latest || !(search_type || search_school || search_closest || search_latest)
        raise "wrong criteria"
      end
    end

    if search_type
      editions.each do |edition|
        edition[:courses].each do |course|
          if course[:type] == search_type
            selected_courses << [edition[:date], course[:name]]
          end
        end
      end
    end

    if search_school
      school_topics = School.find_by(name: search_school).course_types.pluck(:name)
      editions.each do |edition|
        edition[:courses].each do |course|
          if school_topics.include?(course[:type])
            selected_courses << [edition[:date], course[:name]]
          end
        end
      end
    end

    if search_closest
      if selected_courses.any?
        selected_courses = selected_courses.select { |a| a[0] >= Date.today.to_s }.min_by { |subarr| subarr[0] }
      else
      closest_editions = params[:editions].select { |edition| edition[:date].to_date >= Date.today }
      closest_edition = closest_editions.min_by { |edition| edition[:date].to_date - Date.today }
      closest_courses = closest_edition[:courses].map { |course| [closest_edition[:date], course[:name]] }
      selected_courses += closest_courses
      end
    end

    if search_latest
      if selected_courses.any?
        selected_courses = selected_courses.max_by { |subarr| subarr[0] }
      else
        latest_edition = editions.max_by { |edition| edition[:date].to_date }
        latest_courses = latest_edition[:courses].map { |course| [latest_edition[:date], course[:name]] }
        selected_courses += latest_courses
      end
    end


    render json: selected_courses
  end

end
