class EmployeesController < ApplicationController
    def create
        @employee = Employee.new(employee_params)
        @employee.company_id = params[:company_id]
        if @employee.save
            redirect_to company_path(params[:company_id])
        else 
            redirect_to root_path
        end
    end

    def destroy
        @company = Company.find(params[:company_id])
        @employee = Employee.find(params[:id])

        @employee.destroy

        redirect_to company_path(@company)
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :area_id)
    end
end
