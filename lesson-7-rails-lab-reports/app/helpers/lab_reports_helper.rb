module LabReportsHelper
  def grade_color_classes(grade)
    case grade
    when "A"
      "text-green-600"
    when "B"
      "text-green-600"
    when "C"
      "text-green-600"
    when "D"
      "text-orange-400"
    when "E"
      "text-orange-400"
    when "FX"
      "text-red-500"
    when "F"
      "text-red-500"
    else
      ""
    end
  end
end
