class AddAudioAndVideoFilesToMulticasts < ActiveRecord::Migration[5.0]
  def change
    add_column :multicasts, :audio, :string
    add_column :multicasts, :video, :string
  end
end
