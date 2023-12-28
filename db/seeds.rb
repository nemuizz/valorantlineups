# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
agents = Agent.create([
    { agent_name: 'Jett' }, { agent_name: 'Raze' },
    { agent_name: 'Breach' }, { agent_name: 'Omen' },
    { agent_name: 'Brimstone' }, { agent_name: 'Phoenix' },
    { agent_name: 'Sage' }, { agent_name: 'Sova' },
    { agent_name: 'Viper' }, { agent_name: 'Cypher' },
    { agent_name: 'Reyna' }, { agent_name: 'Killjoy' },
    { agent_name: 'Skye' }, { agent_name: 'Yoru' },
    { agent_name: 'Astra' }, { agent_name: 'Kayo' },
    { agent_name: 'Chamber' }, { agent_name: 'Neon' },
    { agent_name: 'Fade' }, { agent_name: 'Harbor' },
    { agent_name: 'Gekko' },{ agent_name: 'Deadlock' } 
])

maps = Map.create([
    {map_name: 'Split'}, {map_name: 'Bind'}, 
    {map_name: 'Haven'}, {map_name: 'Acsent'}, 
    {map_name: 'Icebox'}, {map_name: 'Breeze'}, 
    {map_name: 'Fracture'}, {map_name: 'Pearl'}, 
    {map_name: 'Lotus'}, {map_name: 'Sunset'}
])