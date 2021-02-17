class Api::PagesController < Api::ApiController

    before_action :find_subject

    def create
        page = @subject.pages.new(page_params)
        if page.save
            render json: {
                status: 200,
                messege: "created",
                subject: @subject,
                page: page
            }
        else
            render json: {
                status: 422,
                errors: page.errors
            }
        end
    end

    def update
        page = @subject.pages.find(params[:id])
        if page.update(page_params)
            render json: {
                status: 200,
                messege: "created",
                subject: @subject,
                page: page
            }
        else
            render json: {
                status: 422,
                errors: page.errors
            }
        end
    end

    def destroy
        page = @subject.pages.find(params[:id])
        page.destroy
        render json: {
            status: 200,
            messege: "deleted"
        }
    end




    private
    def find_subject
        @subject = Subject.find(params[:subject_id])
    end

    def page_params
        params.require(:page).permit(:name, :position, :permalink, :visible)
    end
end