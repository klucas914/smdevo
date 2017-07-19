class RolesController < ApplicationController

  def destroy
    role = Role.find(params[:id])
    role.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: "User was removed from the group." }
      format.json { head :no_content }
    end
  end

end
