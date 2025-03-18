require 'rails_helper'

RSpec.describe "LabReports", type: :request do
  let(:user) { create(:user) }
  let(:lab_report) { create(:lab_report, user: user) }
  let(:valid_params) { { lab_report: attributes_for(:lab_report, user_id: user.id) } }
  let(:invalid_params) { { lab_report: { title: "", user_id: user.id } } }

  describe "POST /lab_reports" do
    context "with valid parameters" do
      it "creates a new lab report and redirects" do
        expect {
          post lab_reports_url, params: valid_params
        }.to change(LabReport, :count).by(1)

        expect(response).to redirect_to(lab_report_url(LabReport.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new lab report and renders errors" do
        expect {
          post lab_reports_url, params: invalid_params
        }.not_to change(LabReport, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Title can&#39;t be blank")
      end
    end
  end

  describe "PATCH /lab_reports/:id" do
    context "with valid parameters" do
      it "updates the lab report and redirects" do
        patch lab_report_url(lab_report), params: { lab_report: { title: "Updated Report" } }
        expect(response).to redirect_to(lab_report_url(lab_report))
        lab_report.reload
        expect(lab_report.title).to eq("Updated Report")
      end
    end

    context "with invalid parameters" do
      it "does not update the lab report and renders errors" do
        patch lab_report_url(lab_report), params: { lab_report: { title: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Title can&#39;t be blank")
      end
    end
  end

  describe "DELETE /lab_reports/:id" do
    it "deletes the lab report and redirects" do
      lab_report
      expect {
        delete lab_report_url(lab_report)
      }.to change(LabReport, :count).by(-1)

      expect(response).to redirect_to(lab_reports_url)
    end

    context "with non-existing lab report" do
      it "returns an error message" do
        expect {
          delete lab_report_url(id: 999)
        }.not_to change(LabReport, :count)

        expect(response).to have_http_status(:not_found)
        expect(response.body).to include("Lab report not found")
      end
    end
  end
end
