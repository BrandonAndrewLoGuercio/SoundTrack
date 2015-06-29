# require 'carrierwave/test/matchers'
#
# describe MyUploader do
#   include CarrierWave::Test::Matchers
#
#   before do
#     MyUploader.enable_processing = true
#     @uploader = MyUploader.new(@user, :avatar)
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

    # context 'the default version' do
    #   it "should give user default avatar when user does not upload an avatar" do
    #
    #   end
    # end

#
#   context 'the thumb version' do
#     it "should scale down a landscape image to be exactly 50 by 50 pixels" do
#       @uploader.thumb.should have_dimensions(50, 50)
#     end
#   end
#
#   context 'the NAV version' do
#     it "should scale down a landscape image to fit within 35 by 35 pixels" do
#       @uploader.small.should be_no_larger_than(35, 35)
#     end
#   end
#
#   it "should make the image readable only to the owner and not executable" do
#     @uploader.should have_permissions(0600)
#   end
# end