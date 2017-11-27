class Api::V1::EditorsController < ApplicationController
  def index
    @editors = Editor.all
    render json: @editors, status:200
  end

  def create
      @editor = Editor.create(raw_content_state: params[:content].to_json, user_id: 1)
      render json: @editor, status: 200
  end

  def show
    @editor = Editor.find(editor_params[:id])
    render json: @editor, status: 200
  end


  def update
    @editor = Editor.find(editor_params[:id])
    @editor.update(raw_content_state: params[:content].to_json)
    render json: @editor, status: 201
  end

  def show_last_editor
    @last_editor = Editor.where(user_id: 1).last
    if @last_editor
      render json: @last_editor, status: 200
    else
      render json: {created_at: "no journals found"}
    end
  end

  private
  def editor_params
    params.permit(:content, :id)
  end
end
