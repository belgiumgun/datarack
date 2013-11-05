class AddVisaStatusVisaEmpMartialStatusCurrentStatusField2Field3Field4FilerackIdToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :visa_status, :string
    add_column :resumes, :visa_emp, :string
    add_column :resumes, :martial_status, :string
    add_column :resumes, :current_status, :string
    add_column :resumes, :filerack_id, :integer
    add_column :resumes, :field2, :string
    add_column :resumes, :field3, :string
    add_column :resumes, :field4, :string
  end
end
