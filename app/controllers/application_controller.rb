class ApplicationController < ActionController::API

  def render_objects(objects, klass)
    if objects.present?
      if klass == User
        render json: { data: { results: objects.map { |object| serializer.new(object, scope: { action_name: action_name, controller_name: controller_name }).serializable_hash } }, status: { 'code': 200, 'errorDetail': '', 'message': 'OK' } }
      end
    else
      render json: { status: { 'code': 204, 'errorDetail': 'Nothing to display', 'message': 'NO CONTENT' } }
    end
  end

  def create_entity(object)
    if object.save
      render_resource(object)
    else
      render json: { status: { "code": 422, "errorDetail": object.errors.full_messages.first, "message": "VALIDATION FAILED" } }
    end
  end

  def render_resource(object)
    render json: { status: { "code": 200, "errorDetail": "", "message": "OK" }, data: { result: serializer.new(object).serializable_hash } }
  end

end