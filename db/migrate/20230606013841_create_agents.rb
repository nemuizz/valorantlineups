class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.string :agent_name
      

      t.timestamps
    end
  end
end
