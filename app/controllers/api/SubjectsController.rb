class Api::SubjectsController < Api::ApiController

    # skip_before_action :verify_authenticity_token

    def index 
        render json: Subject.all
    end

    def show
        render json: Subject.find(params[:id])
    end

    def create
        subject = Subject.new(subject_params)
        if subject.save
            render json:{
                status: 200,
                messege: "Subject Created",
                subject: subject
            }
        else 
            render json:{
                status: 500,
                errors: subject.errors
            }
        end
    end

    def update
        subject = Subject.find(params[:id])
        if subject.update(subject_params)
            render json:{
                status: 200,
                messege: "updated",
                subject: subject
            }
        else
            render json: {
                status: 500,
                messege: "subject could not be updated",

            }
            
        end
    end

    def destroy
        subject = Subject.find(params[:id])
        subject.destroy
        render json:{
            status: 200,
            messege: "deleted"
        }
    end

    private
    def subject_params
        params.require(:subject).permit(:name, :position, :visible)
    end
end