require "test_helper"

class LabReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @lab_report = lab_reports(:one)
  end

  test "should get index" do
    get lab_reports_url
    assert_response :success
    assert_select "h1", "Lab Reports"
  end

  test "should show lab_report" do
    get lab_report_url(@lab_report)
    assert_response :success
    assert_select "h1", @lab_report.title
  end

  test "should get new" do
    get new_lab_report_url
    assert_response :success
    assert_select "h1", "New Lab Report"
  end

  test "should create lab_report" do
    assert_difference("LabReport.count") do
      post lab_reports_url, params: { lab_report: { title: "New Report", description: "Some text", grade: "B", user_id: @user.id } }
    end
    assert_redirected_to lab_report_url(LabReport.last)
  end

  test "should get edit" do
    get edit_lab_report_url(@lab_report)
    assert_response :success
    assert_select "h1", "Edit Lab Report"
  end

  test "should update lab_report" do
    patch lab_report_url(@lab_report), params: { lab_report: { title: "Updated Report" } }
    assert_redirected_to lab_report_url(@lab_report)
    @lab_report.reload
    assert_equal "Updated Report", @lab_report.title
  end

  test "should destroy lab_report" do
    assert_difference("LabReport.count", -1) do
      delete lab_report_url(@lab_report)
    end
    assert_redirected_to lab_reports_url
  end
end
