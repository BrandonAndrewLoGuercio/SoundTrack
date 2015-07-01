# require 'carrierwave/test/matchers'
#
# describe AvatarUploader do
#   include CarrierWave::Test::Matchers
#
#   before do
#     @user = create(:user)
#     AvatarUploader.enable_processing = true
#     @uploader = AvatarUploader.new(@user)
#
#     File.open(path_to_file) do |f|
#       @uploader.store!(f)
#     end
#   end
#
#   after do
#     MyUploader.enable_processing = false
#     @uploader.remove!
#   end
#
#     context 'the remote url version' do
#       it "should allow a user to insert a remote url link as it's avatar" do
#       end
#     end
#
#     context 'the uploaded version' do
#       it "allows a user to upload an avatar from their computer" do
#       end
#     end
#
#     context 'the default version' do
#       it "should give user default avatar when user does not upload an avatar" do
#         @uploader.should be eq. to 'default.png'
#       end
#     end

#     context 'the updated version' do
#         it "updates user's avatar when it's updated on the account settings page" do
#       end
#     end

#
#   context 'the profile version' do
#     it "should scale an image to be exactly 225 by 225 pixels" do
#       @uploader.thumb.should have_dimensions(225, 225)
#     end
#   end
#
#   context 'the nav version' do
#     it "should scale down a landscape image to be exactly 35 by 35 pixels" do
#       @uploader.nav.should be_no_larger_than(35, 35)
#     end
#   end

  # context 'removing an uploaded avatar' do
  #   it 'should be the default avatar if user elects to remove their avatar' do
  #
  #   end
  # end
#
#   it "should make the image readable only to the owner and not executable" do
#     @uploader.should have_permissions(0600)
#   end
# end