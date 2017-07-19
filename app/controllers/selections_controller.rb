class SelectionsController < ApplicationController

  def destroy
    selection = Selection.find(params[:id])
    selection.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: "Track was removed from the group." }
      format.json { head :no_content }
    end
  end
end
